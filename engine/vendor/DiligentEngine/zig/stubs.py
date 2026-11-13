#!/usr/bin/env python3
"""
gen_stubs.py <translate-c.zig> <InterfaceName> [--skip A,B,C] [--out file.zig]

Example:
  gen_stubs.py c.zig DeviceContext --skip DrawMesh,DrawMeshIndirect,BuildBLAS
"""
import re, sys, argparse

PRIM = {
    "Uint8": "u8", "Uint16": "u16", "Uint32": "u32", "Uint64": "u64",
    "Int8": "i8", "Int16": "i16", "Int32": "i32", "Int64": "i64",
    "f32": "f32", "Bool": "bool", "bool": "bool", "usize": "usize",
}

FLAGS = set()

def is_flag(t):
    return t.endswith("_FLAGS") or t in FLAGS

def split_top(s):
    """Split on commas not nested inside (), [], {}."""
    out, depth, cur = [], 0, ""
    for ch in s:
        if ch in "([{": depth += 1
        if ch in ")]}": depth -= 1
        if ch == "," and depth == 0:
            out.append(cur.strip()); cur = ""
        else:
            cur += ch
    if cur.strip(): out.append(cur.strip())
    return out

def snake(s):
    s = re.sub(r"^(pp|p|f)(?=[A-Z])", "", s)          # Hungarian prefixes
    s = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1_\2", s)  # RTWidth -> RT_Width
    s = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s)
    return s.lower()

def camel(s):
    return s[0].lower() + s[1:]

def pascal_from_enum(s):          # RESOURCE_STATE_TRANSITION_MODE -> ResourceStateTransitionMode
    return "".join(p.capitalize() for p in s.split("_"))

def parse_methods(src, iface):
    m = re.search(rf"pub const struct_I{iface}Methods = extern struct \{{(.*?)\n\}};", src, re.S)
    if not m:
        sys.exit(f"struct_I{iface}Methods not found")
    methods = []
    for line in m.group(1).splitlines():
        lm = re.match(r"\s+(\w+): \?\*const fn \((.*)\) callconv\(\.c\) (.+),$", line)
        if not lm:
            continue
        name, params, ret = lm.groups()
        parts = split_top(params)
        args = []
        for p in parts[1:]:                      # parts[0] is self
            pn, pt = [x.strip() for x in p.split(":", 1)]
            args.append((pn, re.sub(r"\bstruct_", "", pt)))
        methods.append((name, args, re.sub(r"\bstruct_", "", ret.strip())))
    return methods

def classify(pn, pt, z, after_count):
    """-> (kind, zig_type, call_expr, todo)"""
    if pt in PRIM:
        return "plain", PRIM[pt], z, None
    if pt in ("?*const anyopaque", "?*anyopaque"):
        return "plain", pt, z, "void*: pick []const u8 / *const T / *anyopaque"

    # [*c][*c]IFoo or [*c]const [*c]IFoo: array when preceded by a count, else out param
    m = re.fullmatch(r"\[\*c\](const )?\[\*c\]I(\w+)", pt)
    if m:
        const, w = m.groups()
        if after_count:
            call = f"@ptrCast({z}.ptr)" if const else f"@ptrCast(@constCast({z}.ptr))"
            return "array", f"[]const graphics.{w}", call, None
        return "out", w, f"&{z}", None

    m = re.fullmatch(r"\[\*c\]I(\w+)", pt)                 # single interface pointer
    if m:
        return "plain", f"graphics.{m.group(1)}", f"{z}.raw", None

    m = re.fullmatch(r"\[\*c\](const )?(\w+)", pt)
    if m:
        q = "const " if m.group(1) else ""
        base = m.group(2)
        if base in PRIM:
            return "plain", f"?[*]{q}{PRIM[base]}", z, "primitive pointer: array or out?"
        zt = f"graphics.types.{base}"
        if after_count:
            return "array", f"[]const {zt}", f"@ptrCast({z}.ptr)", None
        todo = None if re.search(r"(Attribs|Desc)$", base) else "struct pointer: optional/out?"
        return "plain", f"*{q}{zt}", f"@ptrCast({z})", todo

    if re.fullmatch(r"[A-Z][A-Z0-9_]+", pt):
        zt = f"graphics.types.{pascal_from_enum(pt)}"
        conv = "@bitCast" if is_flag(pt) else "@intFromEnum"
        return "plain", zt, f"{conv}({z})", None

    return "plain", "void", z, f"unmapped type {pt}"

def emit_ret(callee, ret, todos):
    if ret == "void":
        return "void", f"    {callee};"
    if ret in PRIM:
        return PRIM[ret], f"    return {callee};"
    m = re.fullmatch(r"\[\*c\]I(\w+)", ret)
    if m:
        w = m.group(1)
        return f"?graphics.{w}", (
            f"    const p = {callee};\n"
            f"    if (p == null) return null;\n"
            f"    return .{{ .raw = p.? }};")
    m = re.fullmatch(r"\[\*c\]const (\w+)", ret)
    if m:
        todos.append("pointer return: confirm non-null")
        return f"*const graphics.types.{m.group(1)}", f"    return @ptrCast({callee});"
    if re.fullmatch(r"[A-Z][A-Z0-9_]+", ret):
        conv = "@bitCast" if is_flag(ret) else "@enumFromInt"
        return f"graphics.types.{pascal_from_enum(ret)}", f"    return {conv}({callee});"
    todos.append(f"return type {ret}")
    return "void", f"    _ = {callee};"

def emit(name, args, ret, iface):
    todos, zparams, calls, outs = [], [], [], []
    count_at = None                       # (zparams idx, calls idx) of a pending count arg
    for pn, pt in args:
        z = snake(pn)
        is_count = pt == "Uint32" and re.match(r"(Num|.*Count$)", pn)
        kind, zt, expr, todo = classify(pn, pt, z, count_at is not None)
        if todo: todos.append(f"{z}: {todo}")
        if kind == "out":
            outs.append((z, zt)); calls.append(expr)
            count_at = None
            continue
        if kind == "array" and count_at:
            zi, ci = count_at
            zparams[zi] = None                       # count is derived from the slice
            calls[ci] = f"@intCast({z}.len)"
        zparams.append(f"{z}: {zt}"); calls.append(expr)
        count_at = (len(zparams) - 1, len(calls) - 1) if is_count else None
    zparams = [p for p in zparams if p]

    self_t = f"*const {iface}" if name.startswith("Get") else f"*{iface}"
    callee = f'self.method("{name}")(self.raw{"".join(", " + a for a in calls)})'

    if len(outs) == 1 and ret == "void":
        n, w = outs[0]
        rt = f"!graphics.{w}"
        body = (f"    var {n}: [*c]c.I{w} = null;\n    {callee};\n"
                f"    if ({n} == null) return error.{w}CreationFailed;\n"
                f"    return .{{ .raw = {n}.? }};")
    elif outs:
        todos.append("multiple out params")
        rt, body = "void", f"    {callee};"
    else:
        rt, body = emit_ret(callee, ret, todos)

    head = "".join(f"// TODO(manual): {t}\n" for t in todos)
    sig = ", ".join([f"self: {self_t}"] + zparams)
    return f"{head}pub fn {camel(name)}({sig}) {rt} {{\n{body}\n}}\n"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("translate_c"); ap.add_argument("iface")
    ap.add_argument("--skip", default=""); ap.add_argument("--out")
    ap.add_argument("--flags", default="")
    a = ap.parse_args()
    FLAGS.update(f for f in a.flags.split(",") if f)
    skip = {s for s in a.skip.split(",") if s}
    methods = parse_methods(open(a.translate_c).read(), a.iface)

    out = []
    for name, args, ret in methods:
        if name in skip: continue
        out.append(emit(name, args, ret, a.iface))
    out.append(f'pub const method = helpers.methodHelper(@This(), "{a.iface}");')
    out.append(f"pub const addRef = helpers.objectMethods(@This()).addRef;")
    out.append(f"pub const release = helpers.objectMethods(@This()).release;\n")
    skips = ", ".join(f'"{s}"' for s in sorted(skip))
    out.append(f'comptime {{\n    helpers.ensureHandle({a.iface});\n    helpers.ensureMethodsCovered({a.iface}, "{a.iface}", &.{{ {skips} }});\n}}')

    text = "\n".join(out)
    (open(a.out, "w") if a.out else sys.stdout).write(text + "\n")

main()