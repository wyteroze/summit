const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
pub const __mbstate_t = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const __builtin_va_list = [*c]u8;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?*const fn (?*anyopaque) callconv(.c) void = null,
    __arg: ?*anyopaque = null,
    __next: [*c]struct___darwin_pthread_handler_rec = null,
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long = 0,
    __opaque: [56]u8 = @import("std").mem.zeroes([56]u8),
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long = 0,
    __opaque: [40]u8 = @import("std").mem.zeroes([40]u8),
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long = 0,
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long = 0,
    __opaque: [56]u8 = @import("std").mem.zeroes([56]u8),
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long = 0,
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long = 0,
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long = 0,
    __opaque: [192]u8 = @import("std").mem.zeroes([192]u8),
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long = 0,
    __opaque: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long = 0,
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec = null,
    __opaque: [8176]u8 = @import("std").mem.zeroes([8176]u8),
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memcpy(__dst: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dst: ?*anyopaque, __src: ?*const anyopaque, __len: usize) ?*anyopaque;
pub extern fn memset(__b: ?*anyopaque, __c: c_int, __len: usize) ?*anyopaque;
pub extern fn strcat(__s1: [*c]u8, __s2: [*c]const u8) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __charset: [*c]const u8) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn strncat(__s1: [*c]u8, __s2: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strncpy(__dst: [*c]u8, __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strpbrk(__s: [*c]const u8, __charset: [*c]const u8) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strspn(__s: [*c]const u8, __charset: [*c]const u8) usize;
pub extern fn strstr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strtok(__str: [*c]u8, __sep: [*c]const u8) [*c]u8;
pub extern fn strxfrm(__s1: [*c]u8, __s2: [*c]const u8, __n: usize) usize;
pub extern fn strtok_r(__str: [*c]u8, __sep: [*c]const u8, __lasts: [*c][*c]u8) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __strerrbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn strdup(__s1: [*c]const u8) [*c]u8;
pub extern fn memccpy(__dst: ?*anyopaque, __src: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn stpcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn stpncpy(__dst: [*c]u8, __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strndup(__s1: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strnlen(__s1: [*c]const u8, __n: usize) usize;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub const rsize_t = __darwin_size_t;
pub const errno_t = c_int;
pub extern fn memset_s(__s: ?*anyopaque, __smax: rsize_t, __c: c_int, __n: rsize_t) errno_t;
pub extern fn memmem(__big: ?*const anyopaque, __big_len: usize, __little: ?*const anyopaque, __little_len: usize) ?*anyopaque;
pub extern fn memset_pattern4(__b: ?*anyopaque, __pattern4: ?*const anyopaque, __len: usize) void;
pub extern fn memset_pattern8(__b: ?*anyopaque, __pattern8: ?*const anyopaque, __len: usize) void;
pub extern fn memset_pattern16(__b: ?*anyopaque, __pattern16: ?*const anyopaque, __len: usize) void;
pub extern fn strcasestr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strchrnul(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strnstr(__big: [*c]const u8, __little: [*c]const u8, __len: usize) [*c]u8;
pub extern fn strlcat(__dst: [*c]u8, __source: [*c]const u8, __size: usize) usize;
pub extern fn strlcpy(__dst: [*c]u8, __source: [*c]const u8, __size: usize) usize;
pub extern fn strmode(__mode: c_int, __bp: [*c]u8) void;
pub extern fn strsep(__stringp: [*c][*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn swab(noalias ?*const anyopaque, noalias ?*anyopaque, __len: isize) void;
pub extern fn timingsafe_bcmp(__b1: ?*const anyopaque, __b2: ?*const anyopaque, __len: usize) c_int;
pub extern fn strsignal_r(__sig: c_int, __strsignalbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn bcmp(?*const anyopaque, ?*const anyopaque, __n: usize) c_int;
pub extern fn bcopy(?*const anyopaque, ?*anyopaque, __n: usize) void;
pub extern fn bzero(?*anyopaque, __n: usize) void;
pub extern fn index([*c]const u8, c_int) [*c]u8;
pub extern fn rindex([*c]const u8, c_int) [*c]u8;
pub extern fn ffs(c_int) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, usize) c_int;
pub extern fn ffsl(c_long) c_int;
pub extern fn ffsll(c_longlong) c_int;
pub extern fn fls(c_int) c_int;
pub extern fn flsl(c_long) c_int;
pub extern fn flsll(c_longlong) c_int;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast8_t = i8;
pub const int_fast16_t = i16;
pub const int_fast32_t = i32;
pub const int_fast64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = u16;
pub const uint_fast32_t = u32;
pub const uint_fast64_t = u64;
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub const Float32 = f32;
pub const Float64 = f64;
pub const Int64 = i64;
pub const Int32 = i32;
pub const Int16 = i16;
pub const Int8 = i8;
pub const Uint64 = u64;
pub const Uint32 = u32;
pub const Uint16 = u16;
pub const Uint8 = u8;
pub const SizeType = usize;
pub const PVoid = ?*anyopaque;
pub const CPVoid = ?*const anyopaque;
pub const Bool = bool;
pub const False: Bool = @"false" != 0;
pub const True: Bool = @"true" != 0;
pub const Char = u8;
pub const struct_INTERFACE_ID = extern struct {
    Data1: Uint32 = 0,
    Data2: Uint16 = 0,
    Data3: Uint16 = 0,
    Data4: [8]Uint8 = @import("std").mem.zeroes([8]Uint8),
};
pub const INTERFACE_ID = struct_INTERFACE_ID;
pub const IID_Unknown: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 0,
    .Data2 = 0,
    .Data3 = 0,
    .Data4 = [8]Uint8{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    },
};
pub const ReferenceCounterValueType = Int32;
pub const struct_IReferenceCountersMethods = extern struct {
    AddStrongRef: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
    ReleaseStrongRef: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
    AddWeakRef: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
    ReleaseWeakRef: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
    QueryObject: ?*const fn ([*c]struct_IReferenceCounters, ppObject: [*c][*c]struct_IObject) callconv(.c) void = null,
    GetNumStrongRefs: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
    GetNumWeakRefs: ?*const fn ([*c]struct_IReferenceCounters) callconv(.c) ReferenceCounterValueType = null,
};
pub const IReferenceCountersMethods = struct_IReferenceCountersMethods;
pub const struct_IReferenceCountersVtbl = extern struct {
    ReferenceCounters: IReferenceCountersMethods = @import("std").mem.zeroes(IReferenceCountersMethods),
};
pub const struct_IReferenceCounters = extern struct {
    pVtbl: [*c]struct_IReferenceCountersVtbl = null,
};
pub const struct_IObjectMethods = extern struct {
    QueryInterface: ?*const fn ([*c]struct_IObject, IID: [*c]const struct_INTERFACE_ID, ppInterface: [*c][*c]struct_IObject) callconv(.c) void = null,
    AddRef: ?*const fn ([*c]struct_IObject) callconv(.c) ReferenceCounterValueType = null,
    Release: ?*const fn ([*c]struct_IObject) callconv(.c) ReferenceCounterValueType = null,
    GetReferenceCounters: ?*const fn ([*c]struct_IObject) callconv(.c) [*c]struct_IReferenceCounters = null,
};
pub const IObjectMethods = struct_IObjectMethods;
pub const struct_IObjectVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
};
pub const struct_IObject = extern struct {
    pVtbl: [*c]struct_IObjectVtbl = null,
};
pub const IReferenceCountersVtbl = struct_IReferenceCountersVtbl;
pub const IReferenceCounters = struct_IReferenceCounters;
pub const IObjectVtbl = struct_IObjectVtbl;
pub const IObject = struct_IObject;
pub const struct_MacOSNativeWindow = extern struct {
    pNSView: ?*anyopaque = null,
};
pub const NativeWindow = struct_MacOSNativeWindow;
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:147:3: warning: TODO implement function '__builtin___strncpy_chk' in std.zig.c_builtins

// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/StringTools.h:35:12: warning: unable to translate function, demoted to extern
pub extern fn strcpy_s(arg_dest: [*c]u8, arg_destsz: usize, arg_src: [*c]const u8) callconv(.c) c_int;
pub fn IsNum(arg_c: u8) callconv(.c) bool {
    var c = arg_c;
    _ = &c;
    return (@as(c_int, c) >= @as(c_int, '0')) and (@as(c_int, c) <= @as(c_int, '9'));
}
pub fn SafeStrEqual(arg_Str0: [*c]const u8, arg_Str1: [*c]const u8) callconv(.c) bool {
    var Str0 = arg_Str0;
    _ = &Str0;
    var Str1 = arg_Str1;
    _ = &Str1;
    if (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(Str0)))) == @as(?*anyopaque, null)) != @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(Str1)))) == @as(?*anyopaque, null))) return @"false" != 0;
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(Str0)))) != @as(?*anyopaque, null)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(Str1)))) != @as(?*anyopaque, null))) return strcmp(Str0, Str1) == @as(c_int, 0);
    return @"true" != 0;
}
pub fn IsNullOrEmptyStr(arg_Str: [*c]const u8) callconv(.c) bool {
    var Str = arg_Str;
    _ = &Str;
    return (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(Str)))) == @as(?*anyopaque, null)) or (@as(c_int, Str[@as(c_int, 0)]) == @as(c_int, '\x00'));
}
pub fn GetOrdinalNumberSuffix(arg_Num: c_uint) callconv(.c) [*c]const u8 {
    var Num = arg_Num;
    _ = &Num;
    if (((Num == @as(c_uint, 11)) or (Num == @as(c_uint, 12))) or (Num == @as(c_uint, 13))) return "th";
    {
        switch (Num % @as(c_uint, 10)) {
            @as(c_uint, 1) => {
                return "st";
            },
            @as(c_uint, 2) => {
                return "nd";
            },
            @as(c_uint, 3) => {
                return "rd";
            },
            else => {
                return "th";
            },
        }
    }
}
pub const ASYNC_TASK_STATUS = Uint32;
pub const ASYNC_TASK_STATUS_UNKNOWN: c_int = 0;
pub const ASYNC_TASK_STATUS_NOT_STARTED: c_int = 1;
pub const ASYNC_TASK_STATUS_RUNNING: c_int = 2;
pub const ASYNC_TASK_STATUS_CANCELLED: c_int = 3;
pub const ASYNC_TASK_STATUS_COMPLETE: c_int = 4;
pub const enum__ASYNC_TASK_STATUS = c_uint;
pub const IID_AsyncTask: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 2959941082,
    .Data2 = 44704,
    .Data3 = 19709,
    .Data4 = [8]Uint8{
        150,
        154,
        200,
        226,
        1,
        29,
        194,
        148,
    },
};
pub const struct_IAsyncTaskMethods = extern struct {
    Run: ?*const fn ([*c]struct_IAsyncTask, ThreadId: Uint32) callconv(.c) ASYNC_TASK_STATUS = null,
    Cancel: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) void = null,
    SetStatus: ?*const fn ([*c]struct_IAsyncTask, TaskStatus: ASYNC_TASK_STATUS) callconv(.c) void = null,
    GetStatus: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) ASYNC_TASK_STATUS = null,
    SetPriority: ?*const fn ([*c]struct_IAsyncTask, fPriority: f32) callconv(.c) void = null,
    GetPriority: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) f32 = null,
    IsFinished: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) bool = null,
    WaitForCompletion: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) void = null,
    WaitUntilRunning: ?*const fn ([*c]struct_IAsyncTask) callconv(.c) void = null,
};
pub const IAsyncTaskMethods = struct_IAsyncTaskMethods;
pub const struct_IAsyncTaskVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    AsyncTask: IAsyncTaskMethods = @import("std").mem.zeroes(IAsyncTaskMethods),
};
pub const struct_IAsyncTask = extern struct {
    pVtbl: [*c]struct_IAsyncTaskVtbl = null,
};
pub const IAsyncTask = struct_IAsyncTask;
pub const IAsyncTaskVtbl = struct_IAsyncTaskVtbl;
pub const IID_ThreadPool: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 2344168286,
    .Data2 = 16043,
    .Data3 = 19651,
    .Data4 = [8]Uint8{
        157,
        162,
        84,
        112,
        219,
        186,
        113,
        32,
    },
};
pub const struct_IThreadPoolMethods = extern struct {
    EnqueueTask: ?*const fn ([*c]struct_IThreadPool, pTask: [*c]IAsyncTask, ppPrerequisites: [*c][*c]IAsyncTask, NumPrerequisites: Uint32) callconv(.c) bool = null,
    ReprioritizeTask: ?*const fn ([*c]struct_IThreadPool, pTask: [*c]IAsyncTask) callconv(.c) bool = null,
    ReprioritizeAllTasks: ?*const fn ([*c]struct_IThreadPool) callconv(.c) void = null,
    RemoveTask: ?*const fn ([*c]struct_IThreadPool, pTask: [*c]IAsyncTask) callconv(.c) bool = null,
    WaitForAllTasks: ?*const fn ([*c]struct_IThreadPool) callconv(.c) void = null,
    GetQueueSize: ?*const fn ([*c]struct_IThreadPool) callconv(.c) Uint32 = null,
    GetRunningTaskCount: ?*const fn ([*c]struct_IThreadPool) callconv(.c) Uint32 = null,
    StopThreads: ?*const fn ([*c]struct_IThreadPool) callconv(.c) void = null,
    ProcessTask: ?*const fn ([*c]struct_IThreadPool, ThreadId: Uint32, WaitForTask: bool) callconv(.c) bool = null,
};
pub const IThreadPoolMethods = struct_IThreadPoolMethods;
pub const struct_IThreadPoolVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    ThreadPool: IThreadPoolMethods = @import("std").mem.zeroes(IThreadPoolMethods),
};
pub const struct_IThreadPool = extern struct {
    pVtbl: [*c]struct_IThreadPoolVtbl = null,
};
pub const IThreadPool = struct_IThreadPool;
pub const IThreadPoolVtbl = struct_IThreadPoolVtbl;
pub const struct_APIInfo = extern struct {
    StructSize: usize = 0,
    APIVersion: c_int = 0,
    RenderTargetBlendDescSize: usize = 0,
    BlendStateDescSize: usize = 0,
    BufferDescSize: usize = 0,
    BufferDataSize: usize = 0,
    BufferFormatSize: usize = 0,
    BufferViewDescSize: usize = 0,
    StencilOpDescSize: usize = 0,
    DepthStencilStateDescSize: usize = 0,
    SamplerPropertiesSize: usize = 0,
    TexturePropertiesSize: usize = 0,
    RenderDeviceInfoSize: usize = 0,
    DrawAttribsSize: usize = 0,
    DispatchComputeAttribsSize: usize = 0,
    ViewportSize: usize = 0,
    RectSize: usize = 0,
    CopyTextureAttribsSize: usize = 0,
    DeviceObjectAttribsSize: usize = 0,
    GraphicsAdapterInfoSize: usize = 0,
    DisplayModeAttribsSize: usize = 0,
    SwapChainDescSize: usize = 0,
    FullScreenModeDescSize: usize = 0,
    OpenXRAttribsSize: usize = 0,
    EngineCreateInfoSize: usize = 0,
    EngineGLCreateInfoSize: usize = 0,
    EngineD3D11CreateInfoSize: usize = 0,
    EngineD3D12CreateInfoSize: usize = 0,
    EngineVkCreateInfoSize: usize = 0,
    EngineMtlCreateInfoSize: usize = 0,
    BoxSize: usize = 0,
    TextureFormatAttribsSize: usize = 0,
    TextureFormatInfoSize: usize = 0,
    TextureFormatInfoExtSize: usize = 0,
    StateTransitionDescSize: usize = 0,
    LayoutElementSize: usize = 0,
    InputLayoutDescSize: usize = 0,
    SampleDescSize: usize = 0,
    ShaderResourceVariableDescSize: usize = 0,
    ImmutableSamplerDescSize: usize = 0,
    PipelineResourceLayoutDescSize: usize = 0,
    PipelineStateDescSize: usize = 0,
    GraphicsPipelineDescSize: usize = 0,
    GraphicsPipelineStateCreateInfoSize: usize = 0,
    ComputePipelineStateCreateInfoSize: usize = 0,
    RayTracingPipelineDescSize: usize = 0,
    RayTracingPipelineStateCreateInfoSize: usize = 0,
    RasterizerStateDescSize: usize = 0,
    ResourceMappingEntrySize: usize = 0,
    ResourceMappingCreateInfoSize: usize = 0,
    SamplerDescSize: usize = 0,
    ShaderDescSize: usize = 0,
    ShaderMacroSize: usize = 0,
    ShaderMacroArraySize: usize = 0,
    ShaderCreateInfoSize: usize = 0,
    ShaderResourceDescSize: usize = 0,
    DepthStencilClearValueSize: usize = 0,
    OptimizedClearValueSize: usize = 0,
    TextureDescSize: usize = 0,
    TextureSubResDataSize: usize = 0,
    TextureDataSize: usize = 0,
    MappedTextureSubresourceSize: usize = 0,
    TextureViewDescSize: usize = 0,
};
pub const APIInfo = struct_APIInfo;
pub const MAX_BUFFER_SLOTS: Uint32 = DILIGENT_MAX_BUFFER_SLOTS;
pub const MAX_RENDER_TARGETS: Uint32 = DILIGENT_MAX_RENDER_TARGETS;
pub const MAX_VIEWPORTS: Uint32 = DILIGENT_MAX_VIEWPORTS;
pub const MAX_RESOURCE_SIGNATURES: Uint32 = DILIGENT_MAX_RESOURCE_SIGNATURES;
pub const MAX_ADAPTER_QUEUES: Uint32 = DILIGENT_MAX_ADAPTER_QUEUES;
pub const DEFAULT_ADAPTER_ID: Uint32 = DILIGENT_DEFAULT_ADAPTER_ID;
pub const DEFAULT_QUEUE_ID: Uint8 = DILIGENT_DEFAULT_QUEUE_ID;
pub const MAX_SHADING_RATES: Uint32 = DILIGENT_MAX_SHADING_RATES;
pub const SHADING_RATE_X_SHIFT: Uint32 = DILIGENT_SHADING_RATE_X_SHIFT;
pub const MAX_INLINE_CONSTANTS: Uint32 = DILIGENT_MAX_INLINE_CONSTANTS;
pub const VALUE_TYPE = Uint8;
pub const VT_UNDEFINED: c_int = 0;
pub const VT_INT8: c_int = 1;
pub const VT_INT16: c_int = 2;
pub const VT_INT32: c_int = 3;
pub const VT_UINT8: c_int = 4;
pub const VT_UINT16: c_int = 5;
pub const VT_UINT32: c_int = 6;
pub const VT_FLOAT16: c_int = 7;
pub const VT_FLOAT32: c_int = 8;
pub const VT_FLOAT64: c_int = 9;
pub const VT_NUM_TYPES: c_int = 10;
pub const enum__VALUE_TYPE = c_uint;
pub const SHADER_TYPE = Uint32;
pub const SHADER_TYPE_UNKNOWN: c_int = 0;
pub const SHADER_TYPE_VERTEX: c_int = 1;
pub const SHADER_TYPE_PIXEL: c_int = 2;
pub const SHADER_TYPE_GEOMETRY: c_int = 4;
pub const SHADER_TYPE_HULL: c_int = 8;
pub const SHADER_TYPE_DOMAIN: c_int = 16;
pub const SHADER_TYPE_COMPUTE: c_int = 32;
pub const SHADER_TYPE_AMPLIFICATION: c_int = 64;
pub const SHADER_TYPE_MESH: c_int = 128;
pub const SHADER_TYPE_RAY_GEN: c_int = 256;
pub const SHADER_TYPE_RAY_MISS: c_int = 512;
pub const SHADER_TYPE_RAY_CLOSEST_HIT: c_int = 1024;
pub const SHADER_TYPE_RAY_ANY_HIT: c_int = 2048;
pub const SHADER_TYPE_RAY_INTERSECTION: c_int = 4096;
pub const SHADER_TYPE_CALLABLE: c_int = 8192;
pub const SHADER_TYPE_TILE: c_int = 16384;
pub const SHADER_TYPE_LAST: c_int = 16384;
pub const SHADER_TYPE_VS_PS: c_int = 3;
pub const SHADER_TYPE_ALL_GRAPHICS: c_int = 31;
pub const SHADER_TYPE_ALL_MESH: c_int = 194;
pub const SHADER_TYPE_ALL_RAY_TRACING: c_int = 16128;
pub const SHADER_TYPE_ALL: c_int = 32767;
pub const enum__SHADER_TYPE = c_uint;
pub const BIND_FLAGS = Uint32;
pub const BIND_NONE: c_int = 0;
pub const BIND_VERTEX_BUFFER: c_int = 1;
pub const BIND_INDEX_BUFFER: c_int = 2;
pub const BIND_UNIFORM_BUFFER: c_int = 4;
pub const BIND_SHADER_RESOURCE: c_int = 8;
pub const BIND_STREAM_OUTPUT: c_int = 16;
pub const BIND_RENDER_TARGET: c_int = 32;
pub const BIND_DEPTH_STENCIL: c_int = 64;
pub const BIND_UNORDERED_ACCESS: c_int = 128;
pub const BIND_INDIRECT_DRAW_ARGS: c_int = 256;
pub const BIND_INPUT_ATTACHMENT: c_int = 512;
pub const BIND_RAY_TRACING: c_int = 1024;
pub const BIND_SHADING_RATE: c_int = 2048;
pub const BIND_FLAG_LAST: c_int = 2048;
pub const enum__BIND_FLAGS = c_uint;
pub const USAGE = Uint8;
pub const USAGE_IMMUTABLE: c_int = 0;
pub const USAGE_DEFAULT: c_int = 1;
pub const USAGE_DYNAMIC: c_int = 2;
pub const USAGE_STAGING: c_int = 3;
pub const USAGE_UNIFIED: c_int = 4;
pub const USAGE_SPARSE: c_int = 5;
pub const USAGE_NUM_USAGES: c_int = 6;
pub const enum__USAGE = c_uint;
pub const CPU_ACCESS_FLAGS = Uint8;
pub const CPU_ACCESS_NONE: c_int = 0;
pub const CPU_ACCESS_READ: c_int = 1;
pub const CPU_ACCESS_WRITE: c_int = 2;
pub const CPU_ACCESS_FLAG_LAST: c_int = 2;
pub const enum__CPU_ACCESS_FLAGS = c_uint;
pub const MAP_TYPE = Uint8;
pub const MAP_READ: c_int = 1;
pub const MAP_WRITE: c_int = 2;
pub const MAP_READ_WRITE: c_int = 3;
pub const enum__MAP_TYPE = c_uint;
pub const MAP_FLAGS = Uint8;
pub const MAP_FLAG_NONE: c_int = 0;
pub const MAP_FLAG_DO_NOT_WAIT: c_int = 1;
pub const MAP_FLAG_DISCARD: c_int = 2;
pub const MAP_FLAG_NO_OVERWRITE: c_int = 4;
pub const enum__MAP_FLAGS = c_uint;
pub const RESOURCE_DIMENSION = Uint8;
pub const RESOURCE_DIM_UNDEFINED: c_int = 0;
pub const RESOURCE_DIM_BUFFER: c_int = 1;
pub const RESOURCE_DIM_TEX_1D: c_int = 2;
pub const RESOURCE_DIM_TEX_1D_ARRAY: c_int = 3;
pub const RESOURCE_DIM_TEX_2D: c_int = 4;
pub const RESOURCE_DIM_TEX_2D_ARRAY: c_int = 5;
pub const RESOURCE_DIM_TEX_3D: c_int = 6;
pub const RESOURCE_DIM_TEX_CUBE: c_int = 7;
pub const RESOURCE_DIM_TEX_CUBE_ARRAY: c_int = 8;
pub const RESOURCE_DIM_NUM_DIMENSIONS: c_int = 9;
pub const enum__RESOURCE_DIMENSION = c_uint;
pub const TEXTURE_VIEW_TYPE = Uint8;
pub const TEXTURE_VIEW_UNDEFINED: c_int = 0;
pub const TEXTURE_VIEW_SHADER_RESOURCE: c_int = 1;
pub const TEXTURE_VIEW_RENDER_TARGET: c_int = 2;
pub const TEXTURE_VIEW_DEPTH_STENCIL: c_int = 3;
pub const TEXTURE_VIEW_READ_ONLY_DEPTH_STENCIL: c_int = 4;
pub const TEXTURE_VIEW_UNORDERED_ACCESS: c_int = 5;
pub const TEXTURE_VIEW_SHADING_RATE: c_int = 6;
pub const TEXTURE_VIEW_NUM_VIEWS: c_int = 7;
pub const enum__TEXTURE_VIEW_TYPE = c_uint;
pub const BUFFER_VIEW_TYPE = Uint8;
pub const BUFFER_VIEW_UNDEFINED: c_int = 0;
pub const BUFFER_VIEW_SHADER_RESOURCE: c_int = 1;
pub const BUFFER_VIEW_UNORDERED_ACCESS: c_int = 2;
pub const BUFFER_VIEW_NUM_VIEWS: c_int = 3;
pub const enum__BUFFER_VIEW_TYPE = c_uint;
pub const TEXTURE_FORMAT = Uint16;
pub const TEX_FORMAT_UNKNOWN: c_int = 0;
pub const TEX_FORMAT_RGBA32_TYPELESS: c_int = 1;
pub const TEX_FORMAT_RGBA32_FLOAT: c_int = 2;
pub const TEX_FORMAT_RGBA32_UINT: c_int = 3;
pub const TEX_FORMAT_RGBA32_SINT: c_int = 4;
pub const TEX_FORMAT_RGB32_TYPELESS: c_int = 5;
pub const TEX_FORMAT_RGB32_FLOAT: c_int = 6;
pub const TEX_FORMAT_RGB32_UINT: c_int = 7;
pub const TEX_FORMAT_RGB32_SINT: c_int = 8;
pub const TEX_FORMAT_RGBA16_TYPELESS: c_int = 9;
pub const TEX_FORMAT_RGBA16_FLOAT: c_int = 10;
pub const TEX_FORMAT_RGBA16_UNORM: c_int = 11;
pub const TEX_FORMAT_RGBA16_UINT: c_int = 12;
pub const TEX_FORMAT_RGBA16_SNORM: c_int = 13;
pub const TEX_FORMAT_RGBA16_SINT: c_int = 14;
pub const TEX_FORMAT_RG32_TYPELESS: c_int = 15;
pub const TEX_FORMAT_RG32_FLOAT: c_int = 16;
pub const TEX_FORMAT_RG32_UINT: c_int = 17;
pub const TEX_FORMAT_RG32_SINT: c_int = 18;
pub const TEX_FORMAT_R32G8X24_TYPELESS: c_int = 19;
pub const TEX_FORMAT_D32_FLOAT_S8X24_UINT: c_int = 20;
pub const TEX_FORMAT_R32_FLOAT_X8X24_TYPELESS: c_int = 21;
pub const TEX_FORMAT_X32_TYPELESS_G8X24_UINT: c_int = 22;
pub const TEX_FORMAT_RGB10A2_TYPELESS: c_int = 23;
pub const TEX_FORMAT_RGB10A2_UNORM: c_int = 24;
pub const TEX_FORMAT_RGB10A2_UINT: c_int = 25;
pub const TEX_FORMAT_R11G11B10_FLOAT: c_int = 26;
pub const TEX_FORMAT_RGBA8_TYPELESS: c_int = 27;
pub const TEX_FORMAT_RGBA8_UNORM: c_int = 28;
pub const TEX_FORMAT_RGBA8_UNORM_SRGB: c_int = 29;
pub const TEX_FORMAT_RGBA8_UINT: c_int = 30;
pub const TEX_FORMAT_RGBA8_SNORM: c_int = 31;
pub const TEX_FORMAT_RGBA8_SINT: c_int = 32;
pub const TEX_FORMAT_RG16_TYPELESS: c_int = 33;
pub const TEX_FORMAT_RG16_FLOAT: c_int = 34;
pub const TEX_FORMAT_RG16_UNORM: c_int = 35;
pub const TEX_FORMAT_RG16_UINT: c_int = 36;
pub const TEX_FORMAT_RG16_SNORM: c_int = 37;
pub const TEX_FORMAT_RG16_SINT: c_int = 38;
pub const TEX_FORMAT_R32_TYPELESS: c_int = 39;
pub const TEX_FORMAT_D32_FLOAT: c_int = 40;
pub const TEX_FORMAT_R32_FLOAT: c_int = 41;
pub const TEX_FORMAT_R32_UINT: c_int = 42;
pub const TEX_FORMAT_R32_SINT: c_int = 43;
pub const TEX_FORMAT_R24G8_TYPELESS: c_int = 44;
pub const TEX_FORMAT_D24_UNORM_S8_UINT: c_int = 45;
pub const TEX_FORMAT_R24_UNORM_X8_TYPELESS: c_int = 46;
pub const TEX_FORMAT_X24_TYPELESS_G8_UINT: c_int = 47;
pub const TEX_FORMAT_RG8_TYPELESS: c_int = 48;
pub const TEX_FORMAT_RG8_UNORM: c_int = 49;
pub const TEX_FORMAT_RG8_UINT: c_int = 50;
pub const TEX_FORMAT_RG8_SNORM: c_int = 51;
pub const TEX_FORMAT_RG8_SINT: c_int = 52;
pub const TEX_FORMAT_R16_TYPELESS: c_int = 53;
pub const TEX_FORMAT_R16_FLOAT: c_int = 54;
pub const TEX_FORMAT_D16_UNORM: c_int = 55;
pub const TEX_FORMAT_R16_UNORM: c_int = 56;
pub const TEX_FORMAT_R16_UINT: c_int = 57;
pub const TEX_FORMAT_R16_SNORM: c_int = 58;
pub const TEX_FORMAT_R16_SINT: c_int = 59;
pub const TEX_FORMAT_R8_TYPELESS: c_int = 60;
pub const TEX_FORMAT_R8_UNORM: c_int = 61;
pub const TEX_FORMAT_R8_UINT: c_int = 62;
pub const TEX_FORMAT_R8_SNORM: c_int = 63;
pub const TEX_FORMAT_R8_SINT: c_int = 64;
pub const TEX_FORMAT_A8_UNORM: c_int = 65;
pub const TEX_FORMAT_R1_UNORM: c_int = 66;
pub const TEX_FORMAT_RGB9E5_SHAREDEXP: c_int = 67;
pub const TEX_FORMAT_RG8_B8G8_UNORM: c_int = 68;
pub const TEX_FORMAT_G8R8_G8B8_UNORM: c_int = 69;
pub const TEX_FORMAT_BC1_TYPELESS: c_int = 70;
pub const TEX_FORMAT_BC1_UNORM: c_int = 71;
pub const TEX_FORMAT_BC1_UNORM_SRGB: c_int = 72;
pub const TEX_FORMAT_BC2_TYPELESS: c_int = 73;
pub const TEX_FORMAT_BC2_UNORM: c_int = 74;
pub const TEX_FORMAT_BC2_UNORM_SRGB: c_int = 75;
pub const TEX_FORMAT_BC3_TYPELESS: c_int = 76;
pub const TEX_FORMAT_BC3_UNORM: c_int = 77;
pub const TEX_FORMAT_BC3_UNORM_SRGB: c_int = 78;
pub const TEX_FORMAT_BC4_TYPELESS: c_int = 79;
pub const TEX_FORMAT_BC4_UNORM: c_int = 80;
pub const TEX_FORMAT_BC4_SNORM: c_int = 81;
pub const TEX_FORMAT_BC5_TYPELESS: c_int = 82;
pub const TEX_FORMAT_BC5_UNORM: c_int = 83;
pub const TEX_FORMAT_BC5_SNORM: c_int = 84;
pub const TEX_FORMAT_B5G6R5_UNORM: c_int = 85;
pub const TEX_FORMAT_B5G5R5A1_UNORM: c_int = 86;
pub const TEX_FORMAT_BGRA8_UNORM: c_int = 87;
pub const TEX_FORMAT_BGRX8_UNORM: c_int = 88;
pub const TEX_FORMAT_R10G10B10_XR_BIAS_A2_UNORM: c_int = 89;
pub const TEX_FORMAT_BGRA8_TYPELESS: c_int = 90;
pub const TEX_FORMAT_BGRA8_UNORM_SRGB: c_int = 91;
pub const TEX_FORMAT_BGRX8_TYPELESS: c_int = 92;
pub const TEX_FORMAT_BGRX8_UNORM_SRGB: c_int = 93;
pub const TEX_FORMAT_BC6H_TYPELESS: c_int = 94;
pub const TEX_FORMAT_BC6H_UF16: c_int = 95;
pub const TEX_FORMAT_BC6H_SF16: c_int = 96;
pub const TEX_FORMAT_BC7_TYPELESS: c_int = 97;
pub const TEX_FORMAT_BC7_UNORM: c_int = 98;
pub const TEX_FORMAT_BC7_UNORM_SRGB: c_int = 99;
pub const TEX_FORMAT_ETC2_RGB8_UNORM: c_int = 100;
pub const TEX_FORMAT_ETC2_RGB8_UNORM_SRGB: c_int = 101;
pub const TEX_FORMAT_ETC2_RGB8A1_UNORM: c_int = 102;
pub const TEX_FORMAT_ETC2_RGB8A1_UNORM_SRGB: c_int = 103;
pub const TEX_FORMAT_ETC2_RGBA8_UNORM: c_int = 104;
pub const TEX_FORMAT_ETC2_RGBA8_UNORM_SRGB: c_int = 105;
pub const TEX_FORMAT_NUM_FORMATS: c_int = 106;
pub const enum__TEXTURE_FORMAT = c_uint;
pub const FILTER_TYPE = Uint8;
pub const FILTER_TYPE_UNKNOWN: c_int = 0;
pub const FILTER_TYPE_POINT: c_int = 1;
pub const FILTER_TYPE_LINEAR: c_int = 2;
pub const FILTER_TYPE_ANISOTROPIC: c_int = 3;
pub const FILTER_TYPE_COMPARISON_POINT: c_int = 4;
pub const FILTER_TYPE_COMPARISON_LINEAR: c_int = 5;
pub const FILTER_TYPE_COMPARISON_ANISOTROPIC: c_int = 6;
pub const FILTER_TYPE_MINIMUM_POINT: c_int = 7;
pub const FILTER_TYPE_MINIMUM_LINEAR: c_int = 8;
pub const FILTER_TYPE_MINIMUM_ANISOTROPIC: c_int = 9;
pub const FILTER_TYPE_MAXIMUM_POINT: c_int = 10;
pub const FILTER_TYPE_MAXIMUM_LINEAR: c_int = 11;
pub const FILTER_TYPE_MAXIMUM_ANISOTROPIC: c_int = 12;
pub const FILTER_TYPE_NUM_FILTERS: c_int = 13;
pub const enum__FILTER_TYPE = c_uint;
pub const TEXTURE_ADDRESS_MODE = Uint8;
pub const TEXTURE_ADDRESS_UNKNOWN: c_int = 0;
pub const TEXTURE_ADDRESS_WRAP: c_int = 1;
pub const TEXTURE_ADDRESS_MIRROR: c_int = 2;
pub const TEXTURE_ADDRESS_CLAMP: c_int = 3;
pub const TEXTURE_ADDRESS_BORDER: c_int = 4;
pub const TEXTURE_ADDRESS_MIRROR_ONCE: c_int = 5;
pub const TEXTURE_ADDRESS_NUM_MODES: c_int = 6;
pub const enum__TEXTURE_ADDRESS_MODE = c_uint;
pub const COMPARISON_FUNCTION = Uint8;
pub const COMPARISON_FUNC_UNKNOWN: c_int = 0;
pub const COMPARISON_FUNC_NEVER: c_int = 1;
pub const COMPARISON_FUNC_LESS: c_int = 2;
pub const COMPARISON_FUNC_EQUAL: c_int = 3;
pub const COMPARISON_FUNC_LESS_EQUAL: c_int = 4;
pub const COMPARISON_FUNC_GREATER: c_int = 5;
pub const COMPARISON_FUNC_NOT_EQUAL: c_int = 6;
pub const COMPARISON_FUNC_GREATER_EQUAL: c_int = 7;
pub const COMPARISON_FUNC_ALWAYS: c_int = 8;
pub const COMPARISON_FUNC_NUM_FUNCTIONS: c_int = 9;
pub const enum__COMPARISON_FUNCTION = c_uint;
pub const PRIMITIVE_TOPOLOGY = Uint8;
pub const PRIMITIVE_TOPOLOGY_UNDEFINED: c_int = 0;
pub const PRIMITIVE_TOPOLOGY_TRIANGLE_LIST: c_int = 1;
pub const PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP: c_int = 2;
pub const PRIMITIVE_TOPOLOGY_POINT_LIST: c_int = 3;
pub const PRIMITIVE_TOPOLOGY_LINE_LIST: c_int = 4;
pub const PRIMITIVE_TOPOLOGY_LINE_STRIP: c_int = 5;
pub const PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_ADJ: c_int = 6;
pub const PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_ADJ: c_int = 7;
pub const PRIMITIVE_TOPOLOGY_LINE_LIST_ADJ: c_int = 8;
pub const PRIMITIVE_TOPOLOGY_LINE_STRIP_ADJ: c_int = 9;
pub const PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST: c_int = 10;
pub const PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST: c_int = 11;
pub const PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST: c_int = 12;
pub const PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST: c_int = 13;
pub const PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST: c_int = 14;
pub const PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST: c_int = 15;
pub const PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST: c_int = 16;
pub const PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST: c_int = 17;
pub const PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST: c_int = 18;
pub const PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST: c_int = 19;
pub const PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST: c_int = 20;
pub const PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST: c_int = 21;
pub const PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST: c_int = 22;
pub const PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST: c_int = 23;
pub const PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST: c_int = 24;
pub const PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST: c_int = 25;
pub const PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST: c_int = 26;
pub const PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST: c_int = 27;
pub const PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST: c_int = 28;
pub const PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST: c_int = 29;
pub const PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST: c_int = 30;
pub const PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST: c_int = 31;
pub const PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST: c_int = 32;
pub const PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST: c_int = 33;
pub const PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST: c_int = 34;
pub const PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST: c_int = 35;
pub const PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST: c_int = 36;
pub const PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST: c_int = 37;
pub const PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST: c_int = 38;
pub const PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST: c_int = 39;
pub const PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST: c_int = 40;
pub const PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST: c_int = 41;
pub const PRIMITIVE_TOPOLOGY_NUM_TOPOLOGIES: c_int = 42;
pub const enum__PRIMITIVE_TOPOLOGY = c_uint;
pub const MEMORY_PROPERTIES = Uint32;
pub const MEMORY_PROPERTY_UNKNOWN: c_int = 0;
pub const MEMORY_PROPERTY_HOST_COHERENT: c_int = 1;
pub const enum__MEMORY_PROPERTIES = c_uint;
pub const struct_DepthStencilClearValue = extern struct {
    Depth: Float32 = 0,
    Stencil: Uint8 = 0,
};
pub const DepthStencilClearValue = struct_DepthStencilClearValue;
pub const struct_OptimizedClearValue = extern struct {
    Format: TEXTURE_FORMAT = 0,
    Color: [4]Float32 = @import("std").mem.zeroes([4]Float32),
    DepthStencil: DepthStencilClearValue = @import("std").mem.zeroes(DepthStencilClearValue),
};
pub const OptimizedClearValue = struct_OptimizedClearValue;
pub const struct_DeviceObjectAttribs = extern struct {
    Name: [*c]const Char = null,
};
pub const DeviceObjectAttribs = struct_DeviceObjectAttribs;
pub const ADAPTER_TYPE = Uint8;
pub const ADAPTER_TYPE_UNKNOWN: c_int = 0;
pub const ADAPTER_TYPE_SOFTWARE: c_int = 1;
pub const ADAPTER_TYPE_INTEGRATED: c_int = 2;
pub const ADAPTER_TYPE_DISCRETE: c_int = 3;
pub const ADAPTER_TYPE_COUNT: c_int = 4;
pub const enum__ADAPTER_TYPE = c_uint;
pub const SCALING_MODE_UNSPECIFIED: c_int = 0;
pub const SCALING_MODE_CENTERED: c_int = 1;
pub const SCALING_MODE_STRETCHED: c_int = 2;
pub const enum_SCALING_MODE = c_uint;
pub const SCANLINE_ORDER_UNSPECIFIED: c_int = 0;
pub const SCANLINE_ORDER_PROGRESSIVE: c_int = 1;
pub const SCANLINE_ORDER_UPPER_FIELD_FIRST: c_int = 2;
pub const SCANLINE_ORDER_LOWER_FIELD_FIRST: c_int = 3;
pub const enum_SCANLINE_ORDER = c_uint;
pub const struct_DisplayModeAttribs = extern struct {
    Width: Uint32 = 0,
    Height: Uint32 = 0,
    Format: TEXTURE_FORMAT = 0,
    RefreshRateNumerator: Uint32 = 0,
    RefreshRateDenominator: Uint32 = 0,
    Scaling: enum_SCALING_MODE = @import("std").mem.zeroes(enum_SCALING_MODE),
    ScanlineOrder: enum_SCANLINE_ORDER = @import("std").mem.zeroes(enum_SCANLINE_ORDER),
};
pub const DisplayModeAttribs = struct_DisplayModeAttribs;
pub const SWAP_CHAIN_USAGE_FLAGS = Uint32;
pub const SWAP_CHAIN_USAGE_NONE: c_int = 0;
pub const SWAP_CHAIN_USAGE_RENDER_TARGET: c_int = 1;
pub const SWAP_CHAIN_USAGE_SHADER_RESOURCE: c_int = 2;
pub const SWAP_CHAIN_USAGE_INPUT_ATTACHMENT: c_int = 4;
pub const SWAP_CHAIN_USAGE_COPY_SOURCE: c_int = 8;
pub const SWAP_CHAIN_USAGE_LAST: c_int = 8;
pub const enum__SWAP_CHAIN_USAGE_FLAGS = c_uint;
pub const SURFACE_TRANSFORM = Uint32;
pub const SURFACE_TRANSFORM_OPTIMAL: c_int = 0;
pub const SURFACE_TRANSFORM_IDENTITY: c_int = 1;
pub const SURFACE_TRANSFORM_ROTATE_90: c_int = 2;
pub const SURFACE_TRANSFORM_ROTATE_180: c_int = 3;
pub const SURFACE_TRANSFORM_ROTATE_270: c_int = 4;
pub const SURFACE_TRANSFORM_HORIZONTAL_MIRROR: c_int = 5;
pub const SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90: c_int = 6;
pub const SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180: c_int = 7;
pub const SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270: c_int = 8;
pub const enum__SURFACE_TRANSFORM = c_uint;
pub const struct_SwapChainDesc = extern struct {
    Width: Uint32 = 0,
    Height: Uint32 = 0,
    ColorBufferFormat: TEXTURE_FORMAT = 0,
    DepthBufferFormat: TEXTURE_FORMAT = 0,
    Usage: SWAP_CHAIN_USAGE_FLAGS = 0,
    PreTransform: SURFACE_TRANSFORM = 0,
    BufferCount: Uint32 = 0,
    DefaultDepthValue: Float32 = 0,
    DefaultStencilValue: Uint8 = 0,
    IsPrimary: Bool = false,
};
pub const SwapChainDesc = struct_SwapChainDesc;
pub const struct_FullScreenModeDesc = extern struct {
    Fullscreen: Bool = false,
    RefreshRateNumerator: Uint32 = 0,
    RefreshRateDenominator: Uint32 = 0,
    Scaling: enum_SCALING_MODE = @import("std").mem.zeroes(enum_SCALING_MODE),
    ScanlineOrder: enum_SCANLINE_ORDER = @import("std").mem.zeroes(enum_SCANLINE_ORDER),
};
pub const FullScreenModeDesc = struct_FullScreenModeDesc;
pub const QUERY_TYPE_UNDEFINED: c_int = 0;
pub const QUERY_TYPE_OCCLUSION: c_int = 1;
pub const QUERY_TYPE_BINARY_OCCLUSION: c_int = 2;
pub const QUERY_TYPE_TIMESTAMP: c_int = 3;
pub const QUERY_TYPE_PIPELINE_STATISTICS: c_int = 4;
pub const QUERY_TYPE_DURATION: c_int = 5;
pub const QUERY_TYPE_NUM_TYPES: c_int = 6;
pub const enum_QUERY_TYPE = c_uint;
pub const RENDER_DEVICE_TYPE_UNDEFINED: c_int = 0;
pub const RENDER_DEVICE_TYPE_D3D11: c_int = 1;
pub const RENDER_DEVICE_TYPE_D3D12: c_int = 2;
pub const RENDER_DEVICE_TYPE_GL: c_int = 3;
pub const RENDER_DEVICE_TYPE_GLES: c_int = 4;
pub const RENDER_DEVICE_TYPE_VULKAN: c_int = 5;
pub const RENDER_DEVICE_TYPE_METAL: c_int = 6;
pub const RENDER_DEVICE_TYPE_WEBGPU: c_int = 7;
pub const RENDER_DEVICE_TYPE_COUNT: c_int = 8;
pub const enum_RENDER_DEVICE_TYPE = c_uint;
pub const DEVICE_FEATURE_STATE = Uint8;
pub const DEVICE_FEATURE_STATE_DISABLED: c_int = 0;
pub const DEVICE_FEATURE_STATE_ENABLED: c_int = 1;
pub const DEVICE_FEATURE_STATE_OPTIONAL: c_int = 2;
pub const enum__DEVICE_FEATURE_STATE = c_uint;
pub const struct_DeviceFeatures = extern struct {
    SeparablePrograms: DEVICE_FEATURE_STATE = 0,
    ShaderResourceQueries: DEVICE_FEATURE_STATE = 0,
    WireframeFill: DEVICE_FEATURE_STATE = 0,
    MultithreadedResourceCreation: DEVICE_FEATURE_STATE = 0,
    ComputeShaders: DEVICE_FEATURE_STATE = 0,
    GeometryShaders: DEVICE_FEATURE_STATE = 0,
    Tessellation: DEVICE_FEATURE_STATE = 0,
    MeshShaders: DEVICE_FEATURE_STATE = 0,
    RayTracing: DEVICE_FEATURE_STATE = 0,
    BindlessResources: DEVICE_FEATURE_STATE = 0,
    OcclusionQueries: DEVICE_FEATURE_STATE = 0,
    BinaryOcclusionQueries: DEVICE_FEATURE_STATE = 0,
    TimestampQueries: DEVICE_FEATURE_STATE = 0,
    PipelineStatisticsQueries: DEVICE_FEATURE_STATE = 0,
    DurationQueries: DEVICE_FEATURE_STATE = 0,
    DepthBiasClamp: DEVICE_FEATURE_STATE = 0,
    DepthClamp: DEVICE_FEATURE_STATE = 0,
    IndependentBlend: DEVICE_FEATURE_STATE = 0,
    DualSourceBlend: DEVICE_FEATURE_STATE = 0,
    MultiViewport: DEVICE_FEATURE_STATE = 0,
    TextureCompressionBC: DEVICE_FEATURE_STATE = 0,
    TextureCompressionETC2: DEVICE_FEATURE_STATE = 0,
    VertexPipelineUAVWritesAndAtomics: DEVICE_FEATURE_STATE = 0,
    PixelUAVWritesAndAtomics: DEVICE_FEATURE_STATE = 0,
    TextureUAVExtendedFormats: DEVICE_FEATURE_STATE = 0,
    ShaderFloat16: DEVICE_FEATURE_STATE = 0,
    ResourceBuffer16BitAccess: DEVICE_FEATURE_STATE = 0,
    UniformBuffer16BitAccess: DEVICE_FEATURE_STATE = 0,
    ShaderInputOutput16: DEVICE_FEATURE_STATE = 0,
    ShaderInt8: DEVICE_FEATURE_STATE = 0,
    ResourceBuffer8BitAccess: DEVICE_FEATURE_STATE = 0,
    UniformBuffer8BitAccess: DEVICE_FEATURE_STATE = 0,
    ShaderResourceStaticArrays: DEVICE_FEATURE_STATE = 0,
    ShaderResourceRuntimeArrays: DEVICE_FEATURE_STATE = 0,
    WaveOp: DEVICE_FEATURE_STATE = 0,
    InstanceDataStepRate: DEVICE_FEATURE_STATE = 0,
    NativeFence: DEVICE_FEATURE_STATE = 0,
    TileShaders: DEVICE_FEATURE_STATE = 0,
    TransferQueueTimestampQueries: DEVICE_FEATURE_STATE = 0,
    VariableRateShading: DEVICE_FEATURE_STATE = 0,
    SparseResources: DEVICE_FEATURE_STATE = 0,
    SubpassFramebufferFetch: DEVICE_FEATURE_STATE = 0,
    TextureComponentSwizzle: DEVICE_FEATURE_STATE = 0,
    TextureSubresourceViews: DEVICE_FEATURE_STATE = 0,
    NativeMultiDraw: DEVICE_FEATURE_STATE = 0,
    AsyncShaderCompilation: DEVICE_FEATURE_STATE = 0,
    FormattedBuffers: DEVICE_FEATURE_STATE = 0,
    SpecializationConstants: DEVICE_FEATURE_STATE = 0,
    ShaderFloat64: DEVICE_FEATURE_STATE = 0,
    ShaderBarycentrics: DEVICE_FEATURE_STATE = 0,
};
pub const DeviceFeatures = struct_DeviceFeatures;
pub const ADAPTER_VENDOR = Uint8;
pub const ADAPTER_VENDOR_UNKNOWN: c_int = 0;
pub const ADAPTER_VENDOR_NVIDIA: c_int = 1;
pub const ADAPTER_VENDOR_AMD: c_int = 2;
pub const ADAPTER_VENDOR_INTEL: c_int = 3;
pub const ADAPTER_VENDOR_ARM: c_int = 4;
pub const ADAPTER_VENDOR_QUALCOMM: c_int = 5;
pub const ADAPTER_VENDOR_IMGTECH: c_int = 6;
pub const ADAPTER_VENDOR_MSFT: c_int = 7;
pub const ADAPTER_VENDOR_APPLE: c_int = 8;
pub const ADAPTER_VENDOR_MESA: c_int = 9;
pub const ADAPTER_VENDOR_BROADCOM: c_int = 10;
pub const ADAPTER_VENDOR_LAST: c_int = 10;
pub const enum__ADAPTER_VENDOR = c_uint;
pub const struct_Version = extern struct {
    Major: Uint32 = 0,
    Minor: Uint32 = 0,
};
pub const Version = struct_Version;
pub const WAVE_FEATURE = Uint32;
pub const WAVE_FEATURE_UNKNOWN: c_int = 0;
pub const WAVE_FEATURE_BASIC: c_int = 1;
pub const WAVE_FEATURE_VOTE: c_int = 2;
pub const WAVE_FEATURE_ARITHMETIC: c_int = 4;
pub const WAVE_FEATURE_BALLOUT: c_int = 8;
pub const WAVE_FEATURE_SHUFFLE: c_int = 16;
pub const WAVE_FEATURE_SHUFFLE_RELATIVE: c_int = 32;
pub const WAVE_FEATURE_CLUSTERED: c_int = 64;
pub const WAVE_FEATURE_QUAD: c_int = 128;
pub const WAVE_FEATURE_LAST: c_int = 128;
pub const enum__WAVE_FEATURE = c_uint;
pub const VALIDATION_LEVEL = Uint8;
pub const VALIDATION_LEVEL_DISABLED: c_int = 0;
pub const VALIDATION_LEVEL_1: c_int = 1;
pub const VALIDATION_LEVEL_2: c_int = 2;
pub const enum__VALIDATION_LEVEL = c_uint;
pub const struct_TextureProperties = extern struct {
    MaxTexture1DDimension: Uint32 = 0,
    MaxTexture1DArraySlices: Uint32 = 0,
    MaxTexture2DDimension: Uint32 = 0,
    MaxTexture2DArraySlices: Uint32 = 0,
    MaxTexture3DDimension: Uint32 = 0,
    MaxTextureCubeDimension: Uint32 = 0,
    Texture2DMSSupported: Bool = false,
    Texture2DMSArraySupported: Bool = false,
    TextureViewSupported: Bool = false,
    CubemapArraysSupported: Bool = false,
    TextureView2DOn3DSupported: Bool = false,
};
pub const TextureProperties = struct_TextureProperties;
pub const struct_SamplerProperties = extern struct {
    BorderSamplingModeSupported: Bool = false,
    MaxAnisotropy: Uint8 = 0,
    LODBiasSupported: Bool = false,
};
pub const SamplerProperties = struct_SamplerProperties;
pub const struct_WaveOpProperties = extern struct {
    MinSize: Uint32 = 0,
    MaxSize: Uint32 = 0,
    SupportedStages: SHADER_TYPE = 0,
    Features: WAVE_FEATURE = 0,
};
pub const WaveOpProperties = struct_WaveOpProperties;
pub const struct_BufferProperties = extern struct {
    ConstantBufferOffsetAlignment: Uint32 = 0,
    StructuredBufferOffsetAlignment: Uint32 = 0,
    TextureUpdateOffsetAlignment: Uint32 = 0,
    TextureUpdateStrideAlignment: Uint32 = 0,
};
pub const BufferProperties = struct_BufferProperties;
pub const RAY_TRACING_CAP_FLAGS = Uint8;
pub const RAY_TRACING_CAP_FLAG_NONE: c_int = 0;
pub const RAY_TRACING_CAP_FLAG_STANDALONE_SHADERS: c_int = 1;
pub const RAY_TRACING_CAP_FLAG_INLINE_RAY_TRACING: c_int = 2;
pub const RAY_TRACING_CAP_FLAG_INDIRECT_RAY_TRACING: c_int = 4;
pub const enum__RAY_TRACING_CAP_FLAGS = c_uint;
pub const struct_RayTracingProperties = extern struct {
    MaxRecursionDepth: Uint32 = 0,
    ShaderGroupHandleSize: Uint32 = 0,
    MaxShaderRecordStride: Uint32 = 0,
    ShaderGroupBaseAlignment: Uint32 = 0,
    MaxRayGenThreads: Uint32 = 0,
    MaxInstancesPerTLAS: Uint32 = 0,
    MaxPrimitivesPerBLAS: Uint32 = 0,
    MaxGeometriesPerBLAS: Uint32 = 0,
    VertexBufferAlignment: Uint32 = 0,
    IndexBufferAlignment: Uint32 = 0,
    TransformBufferAlignment: Uint32 = 0,
    BoxBufferAlignment: Uint32 = 0,
    ScratchBufferAlignment: Uint32 = 0,
    InstanceBufferAlignment: Uint32 = 0,
    CapFlags: RAY_TRACING_CAP_FLAGS = 0,
};
pub const RayTracingProperties = struct_RayTracingProperties;
pub const struct_MeshShaderProperties = extern struct {
    MaxThreadGroupCountX: Uint32 = 0,
    MaxThreadGroupCountY: Uint32 = 0,
    MaxThreadGroupCountZ: Uint32 = 0,
    MaxThreadGroupTotalCount: Uint32 = 0,
};
pub const MeshShaderProperties = struct_MeshShaderProperties;
pub const struct_ComputeShaderProperties = extern struct {
    SharedMemorySize: Uint32 = 0,
    MaxThreadGroupInvocations: Uint32 = 0,
    MaxThreadGroupSizeX: Uint32 = 0,
    MaxThreadGroupSizeY: Uint32 = 0,
    MaxThreadGroupSizeZ: Uint32 = 0,
    MaxThreadGroupCountX: Uint32 = 0,
    MaxThreadGroupCountY: Uint32 = 0,
    MaxThreadGroupCountZ: Uint32 = 0,
};
pub const ComputeShaderProperties = struct_ComputeShaderProperties;
pub const struct_NDCAttribs = extern struct {
    MinZ: f32 = 0,
    ZtoDepthScale: f32 = 0,
    YtoVScale: f32 = 0,
};
pub const NDCAttribs = struct_NDCAttribs;
pub const struct_RenderDeviceShaderVersionInfo = extern struct {
    HLSL: Version = @import("std").mem.zeroes(Version),
    GLSL: Version = @import("std").mem.zeroes(Version),
    GLESSL: Version = @import("std").mem.zeroes(Version),
    MSL: Version = @import("std").mem.zeroes(Version),
};
pub const RenderDeviceShaderVersionInfo = struct_RenderDeviceShaderVersionInfo;
pub const struct_RenderDeviceInfo = extern struct {
    Type: enum_RENDER_DEVICE_TYPE = @import("std").mem.zeroes(enum_RENDER_DEVICE_TYPE),
    APIVersion: Version = @import("std").mem.zeroes(Version),
    Features: DeviceFeatures = @import("std").mem.zeroes(DeviceFeatures),
    NDC: NDCAttribs = @import("std").mem.zeroes(NDCAttribs),
    MaxShaderVersion: RenderDeviceShaderVersionInfo = @import("std").mem.zeroes(RenderDeviceShaderVersionInfo),
};
pub const RenderDeviceInfo = struct_RenderDeviceInfo;
pub const VALIDATION_FLAGS = Uint32;
pub const VALIDATION_FLAG_NONE: c_int = 0;
pub const VALIDATION_FLAG_CHECK_SHADER_BUFFER_SIZE: c_int = 1;
pub const enum__VALIDATION_FLAGS = c_uint;
pub const COMMAND_QUEUE_TYPE = Uint8;
pub const COMMAND_QUEUE_TYPE_UNKNOWN: c_int = 0;
pub const COMMAND_QUEUE_TYPE_TRANSFER: c_int = 1;
pub const COMMAND_QUEUE_TYPE_COMPUTE: c_int = 3;
pub const COMMAND_QUEUE_TYPE_GRAPHICS: c_int = 7;
pub const COMMAND_QUEUE_TYPE_PRIMARY_MASK: c_int = 7;
pub const COMMAND_QUEUE_TYPE_SPARSE_BINDING: c_int = 8;
pub const COMMAND_QUEUE_TYPE_MAX_BIT: c_int = 7;
pub const enum__COMMAND_QUEUE_TYPE = c_uint;
pub const QUEUE_PRIORITY = Uint8;
pub const QUEUE_PRIORITY_UNKNOWN: c_int = 0;
pub const QUEUE_PRIORITY_LOW: c_int = 1;
pub const QUEUE_PRIORITY_MEDIUM: c_int = 2;
pub const QUEUE_PRIORITY_HIGH: c_int = 3;
pub const QUEUE_PRIORITY_REALTIME: c_int = 4;
pub const QUEUE_PRIORITY_LAST: c_int = 4;
pub const enum__QUEUE_PRIORITY = c_uint;
pub const struct_AdapterMemoryInfo = extern struct {
    LocalMemory: Uint64 = 0,
    HostVisibleMemory: Uint64 = 0,
    UnifiedMemory: Uint64 = 0,
    MaxMemoryAllocation: Uint64 = 0,
    UnifiedMemoryCPUAccess: CPU_ACCESS_FLAGS = 0,
    MemorylessTextureBindFlags: BIND_FLAGS = 0,
};
pub const AdapterMemoryInfo = struct_AdapterMemoryInfo;
pub const SHADING_RATE_COMBINER = Uint8;
pub const SHADING_RATE_COMBINER_PASSTHROUGH: c_int = 1;
pub const SHADING_RATE_COMBINER_OVERRIDE: c_int = 2;
pub const SHADING_RATE_COMBINER_MIN: c_int = 4;
pub const SHADING_RATE_COMBINER_MAX: c_int = 8;
pub const SHADING_RATE_COMBINER_SUM: c_int = 16;
pub const SHADING_RATE_COMBINER_MUL: c_int = 32;
pub const SHADING_RATE_COMBINER_LAST: c_int = 32;
pub const enum__SHADING_RATE_COMBINER = c_uint;
pub const SHADING_RATE_FORMAT = Uint8;
pub const SHADING_RATE_FORMAT_UNKNOWN: c_int = 0;
pub const SHADING_RATE_FORMAT_PALETTE: c_int = 1;
pub const SHADING_RATE_FORMAT_UNORM8: c_int = 2;
pub const SHADING_RATE_FORMAT_COL_ROW_FP32: c_int = 3;
pub const enum__SHADING_RATE_FORMAT = c_uint;
pub const AXIS_SHADING_RATE = Uint8;
pub const AXIS_SHADING_RATE_1X: c_int = 0;
pub const AXIS_SHADING_RATE_2X: c_int = 1;
pub const AXIS_SHADING_RATE_4X: c_int = 2;
pub const AXIS_SHADING_RATE_MAX: c_int = 2;
pub const enum__AXIS_SHADING_RATE = c_uint;
pub const SHADING_RATE = Uint8;
pub const SHADING_RATE_1X1: c_int = 0;
pub const SHADING_RATE_1X2: c_int = 1;
pub const SHADING_RATE_1X4: c_int = 2;
pub const SHADING_RATE_2X1: c_int = 4;
pub const SHADING_RATE_2X2: c_int = 5;
pub const SHADING_RATE_2X4: c_int = 6;
pub const SHADING_RATE_4X1: c_int = 8;
pub const SHADING_RATE_4X2: c_int = 9;
pub const SHADING_RATE_4X4: c_int = 10;
pub const SHADING_RATE_MAX: c_int = 10;
pub const enum__SHADING_RATE = c_uint;
pub const SAMPLE_COUNT = Uint8;
pub const SAMPLE_COUNT_NONE: c_int = 0;
pub const SAMPLE_COUNT_1: c_int = 1;
pub const SAMPLE_COUNT_2: c_int = 2;
pub const SAMPLE_COUNT_4: c_int = 4;
pub const SAMPLE_COUNT_8: c_int = 8;
pub const SAMPLE_COUNT_16: c_int = 16;
pub const SAMPLE_COUNT_32: c_int = 32;
pub const SAMPLE_COUNT_64: c_int = 64;
pub const SAMPLE_COUNT_MAX: c_int = 64;
pub const SAMPLE_COUNT_ALL: c_int = 127;
pub const enum__SAMPLE_COUNT = c_uint;
pub const struct_ShadingRateMode = extern struct {
    Rate: SHADING_RATE = 0,
    SampleBits: SAMPLE_COUNT = 0,
};
pub const ShadingRateMode = struct_ShadingRateMode;
pub const SHADING_RATE_CAP_FLAGS = Uint16;
pub const SHADING_RATE_CAP_FLAG_NONE: c_int = 0;
pub const SHADING_RATE_CAP_FLAG_PER_DRAW: c_int = 1;
pub const SHADING_RATE_CAP_FLAG_PER_PRIMITIVE: c_int = 2;
pub const SHADING_RATE_CAP_FLAG_TEXTURE_BASED: c_int = 4;
pub const SHADING_RATE_CAP_FLAG_SAMPLE_MASK: c_int = 8;
pub const SHADING_RATE_CAP_FLAG_SHADER_SAMPLE_MASK: c_int = 16;
pub const SHADING_RATE_CAP_FLAG_SHADER_DEPTH_STENCIL_WRITE: c_int = 32;
pub const SHADING_RATE_CAP_FLAG_PER_PRIMITIVE_WITH_MULTIPLE_VIEWPORTS: c_int = 64;
pub const SHADING_RATE_CAP_FLAG_SAME_TEXTURE_FOR_WHOLE_RENDERPASS: c_int = 128;
pub const SHADING_RATE_CAP_FLAG_TEXTURE_ARRAY: c_int = 256;
pub const SHADING_RATE_CAP_FLAG_SHADING_RATE_SHADER_INPUT: c_int = 512;
pub const SHADING_RATE_CAP_FLAG_ADDITIONAL_INVOCATIONS: c_int = 1024;
pub const SHADING_RATE_CAP_FLAG_NON_SUBSAMPLED_RENDER_TARGET: c_int = 2048;
pub const SHADING_RATE_CAP_FLAG_SUBSAMPLED_RENDER_TARGET: c_int = 4096;
pub const enum__SHADING_RATE_CAP_FLAGS = c_uint;
pub const SHADING_RATE_TEXTURE_ACCESS = Uint8;
pub const SHADING_RATE_TEXTURE_ACCESS_UNKNOWN: c_int = 0;
pub const SHADING_RATE_TEXTURE_ACCESS_ON_GPU: c_int = 1;
pub const SHADING_RATE_TEXTURE_ACCESS_ON_SUBMIT: c_int = 2;
pub const SHADING_RATE_TEXTURE_ACCESS_ON_SET_RTV: c_int = 3;
pub const enum__SHADING_RATE_TEXTURE_ACCESS = c_uint;
pub const struct_ShadingRateProperties = extern struct {
    ShadingRates: [9]ShadingRateMode = @import("std").mem.zeroes([9]ShadingRateMode),
    NumShadingRates: Uint8 = 0,
    CapFlags: SHADING_RATE_CAP_FLAGS = 0,
    Combiners: SHADING_RATE_COMBINER = 0,
    Format: SHADING_RATE_FORMAT = 0,
    ShadingRateTextureAccess: SHADING_RATE_TEXTURE_ACCESS = 0,
    BindFlags: BIND_FLAGS = 0,
    MinTileSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
    MaxTileSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
    MaxSabsampledArraySlices: Uint32 = 0,
};
pub const ShadingRateProperties = struct_ShadingRateProperties;
pub const DRAW_COMMAND_CAP_FLAGS = Uint16;
pub const DRAW_COMMAND_CAP_FLAG_NONE: c_int = 0;
pub const DRAW_COMMAND_CAP_FLAG_BASE_VERTEX: c_int = 1;
pub const DRAW_COMMAND_CAP_FLAG_DRAW_INDIRECT: c_int = 2;
pub const DRAW_COMMAND_CAP_FLAG_DRAW_INDIRECT_FIRST_INSTANCE: c_int = 4;
pub const DRAW_COMMAND_CAP_FLAG_NATIVE_MULTI_DRAW_INDIRECT: c_int = 8;
pub const DRAW_COMMAND_CAP_FLAG_DRAW_INDIRECT_COUNTER_BUFFER: c_int = 16;
pub const enum__DRAW_COMMAND_CAP_FLAGS = c_uint;
pub const struct_DrawCommandProperties = extern struct {
    CapFlags: DRAW_COMMAND_CAP_FLAGS = 0,
    MaxIndexValue: Uint32 = 0,
    MaxDrawIndirectCount: Uint32 = 0,
};
pub const DrawCommandProperties = struct_DrawCommandProperties;
pub const SPARSE_RESOURCE_CAP_FLAGS = Uint32;
pub const SPARSE_RESOURCE_CAP_FLAG_NONE: c_int = 0;
pub const SPARSE_RESOURCE_CAP_FLAG_SHADER_RESOURCE_RESIDENCY: c_int = 1;
pub const SPARSE_RESOURCE_CAP_FLAG_BUFFER: c_int = 2;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_2D: c_int = 4;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_3D: c_int = 8;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_2_SAMPLES: c_int = 16;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_4_SAMPLES: c_int = 32;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_8_SAMPLES: c_int = 64;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_16_SAMPLES: c_int = 128;
pub const SPARSE_RESOURCE_CAP_FLAG_ALIASED: c_int = 256;
pub const SPARSE_RESOURCE_CAP_FLAG_STANDARD_2D_TILE_SHAPE: c_int = 512;
pub const SPARSE_RESOURCE_CAP_FLAG_STANDARD_2DMS_TILE_SHAPE: c_int = 1024;
pub const SPARSE_RESOURCE_CAP_FLAG_STANDARD_3D_TILE_SHAPE: c_int = 2048;
pub const SPARSE_RESOURCE_CAP_FLAG_ALIGNED_MIP_SIZE: c_int = 4096;
pub const SPARSE_RESOURCE_CAP_FLAG_NON_RESIDENT_STRICT: c_int = 8192;
pub const SPARSE_RESOURCE_CAP_FLAG_TEXTURE_2D_ARRAY_MIP_TAIL: c_int = 16384;
pub const SPARSE_RESOURCE_CAP_FLAG_BUFFER_STANDARD_BLOCK: c_int = 32768;
pub const SPARSE_RESOURCE_CAP_FLAG_NON_RESIDENT_SAFE: c_int = 65536;
pub const SPARSE_RESOURCE_CAP_FLAG_MIXED_RESOURCE_TYPE_SUPPORT: c_int = 131072;
pub const enum__SPARSE_RESOURCE_CAP_FLAGS = c_uint;
pub const struct_SparseResourceProperties = extern struct {
    AddressSpaceSize: Uint64 = 0,
    ResourceSpaceSize: Uint64 = 0,
    CapFlags: SPARSE_RESOURCE_CAP_FLAGS = 0,
    StandardBlockSize: Uint32 = 0,
    BufferBindFlags: BIND_FLAGS = 0,
    _Padding: Uint32 = 0,
};
pub const SparseResourceProperties = struct_SparseResourceProperties;
pub const struct_CommandQueueInfo = extern struct {
    QueueType: COMMAND_QUEUE_TYPE = 0,
    MaxDeviceContexts: Uint32 = 0,
    TextureCopyGranularity: [3]Uint32 = @import("std").mem.zeroes([3]Uint32),
};
pub const CommandQueueInfo = struct_CommandQueueInfo;
pub const struct_GraphicsAdapterInfo = extern struct {
    Description: [128]Char = @import("std").mem.zeroes([128]Char),
    Type: ADAPTER_TYPE = 0,
    Vendor: ADAPTER_VENDOR = 0,
    VendorId: Uint32 = 0,
    DeviceId: Uint32 = 0,
    NumOutputs: Uint32 = 0,
    Memory: AdapterMemoryInfo = @import("std").mem.zeroes(AdapterMemoryInfo),
    RayTracing: RayTracingProperties = @import("std").mem.zeroes(RayTracingProperties),
    WaveOp: WaveOpProperties = @import("std").mem.zeroes(WaveOpProperties),
    Buffer: BufferProperties = @import("std").mem.zeroes(BufferProperties),
    Texture: TextureProperties = @import("std").mem.zeroes(TextureProperties),
    Sampler: SamplerProperties = @import("std").mem.zeroes(SamplerProperties),
    MeshShader: MeshShaderProperties = @import("std").mem.zeroes(MeshShaderProperties),
    ShadingRate: ShadingRateProperties = @import("std").mem.zeroes(ShadingRateProperties),
    ComputeShader: ComputeShaderProperties = @import("std").mem.zeroes(ComputeShaderProperties),
    DrawCommand: DrawCommandProperties = @import("std").mem.zeroes(DrawCommandProperties),
    SparseResources: SparseResourceProperties = @import("std").mem.zeroes(SparseResourceProperties),
    Features: DeviceFeatures = @import("std").mem.zeroes(DeviceFeatures),
    Queues: [16]CommandQueueInfo = @import("std").mem.zeroes([16]CommandQueueInfo),
    NumQueues: Uint32 = 0,
};
pub const GraphicsAdapterInfo = struct_GraphicsAdapterInfo;
pub const struct_ImmediateContextCreateInfo = extern struct {
    Name: [*c]const Char = null,
    QueueId: Uint8 = 0,
    Priority: QUEUE_PRIORITY = 0,
};
pub const ImmediateContextCreateInfo = struct_ImmediateContextCreateInfo;
pub const struct_OpenXRAttribs = extern struct {
    GetInstanceProcAddr: ?*anyopaque = null,
    Instance: Uint64 = 0,
    SystemId: Uint64 = 0,
};
pub const OpenXRAttribs = struct_OpenXRAttribs;
pub const struct_EngineCreateInfo = extern struct {
    EngineAPIVersion: Int32 = 0,
    AdapterId: Uint32 = 0,
    GraphicsAPIVersion: Version = @import("std").mem.zeroes(Version),
    pImmediateContextInfo: [*c]const ImmediateContextCreateInfo = null,
    NumImmediateContexts: Uint32 = 0,
    NumDeferredContexts: Uint32 = 0,
    Features: DeviceFeatures = @import("std").mem.zeroes(DeviceFeatures),
    EnableValidation: Bool = false,
    ValidationFlags: VALIDATION_FLAGS = 0,
    pAsyncShaderCompilationThreadPool: [*c]IThreadPool = null,
    NumAsyncShaderCompilationThreads: Uint32 = 0,
    Padding: Uint32 = 0,
    pXRAttribs: [*c]const OpenXRAttribs = null,
};
pub const EngineCreateInfo = struct_EngineCreateInfo;
pub const struct_EngineGLCreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    Window: NativeWindow = @import("std").mem.zeroes(NativeWindow),
    ZeroToOneNDZ: Bool = false,
    PreferredAdapterType: ADAPTER_TYPE = 0,
};
pub const EngineGLCreateInfo = struct_EngineGLCreateInfo;
pub const D3D11_VALIDATION_FLAGS = Uint32;
pub const D3D11_VALIDATION_FLAG_NONE: c_int = 0;
pub const D3D11_VALIDATION_FLAG_VERIFY_COMMITTED_RESOURCE_RELEVANCE: c_int = 1;
pub const enum__D3D11_VALIDATION_FLAGS = c_uint;
pub const struct_EngineD3D11CreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    D3D11ValidationFlags: D3D11_VALIDATION_FLAGS = 0,
};
pub const EngineD3D11CreateInfo = struct_EngineD3D11CreateInfo;
pub const D3D12_VALIDATION_FLAGS = Uint32;
pub const D3D12_VALIDATION_FLAG_NONE: c_int = 0;
pub const D3D12_VALIDATION_FLAG_BREAK_ON_ERROR: c_int = 1;
pub const D3D12_VALIDATION_FLAG_BREAK_ON_CORRUPTION: c_int = 2;
pub const D3D12_VALIDATION_FLAG_ENABLE_GPU_BASED_VALIDATION: c_int = 4;
pub const enum__D3D12_VALIDATION_FLAGS = c_uint;
pub const struct_EngineD3D12CreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    D3D12DllName: [*c]const Char = null,
    D3D12ValidationFlags: D3D12_VALIDATION_FLAGS = 0,
    CPUDescriptorHeapAllocationSize: [4]Uint32 = @import("std").mem.zeroes([4]Uint32),
    GPUDescriptorHeapSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
    GPUDescriptorHeapDynamicSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
    DynamicDescriptorAllocationChunkSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
    DynamicHeapPageSize: Uint32 = 0,
    NumDynamicHeapPagesToReserve: Uint32 = 0,
    QueryPoolSizes: [6]Uint32 = @import("std").mem.zeroes([6]Uint32),
    pDxCompilerPath: [*c]const Char = null,
};
pub const EngineD3D12CreateInfo = struct_EngineD3D12CreateInfo;
pub const struct_VulkanDescriptorPoolSize = extern struct {
    MaxDescriptorSets: Uint32 = 0,
    NumSeparateSamplerDescriptors: Uint32 = 0,
    NumCombinedSamplerDescriptors: Uint32 = 0,
    NumSampledImageDescriptors: Uint32 = 0,
    NumStorageImageDescriptors: Uint32 = 0,
    NumUniformBufferDescriptors: Uint32 = 0,
    NumStorageBufferDescriptors: Uint32 = 0,
    NumUniformTexelBufferDescriptors: Uint32 = 0,
    NumStorageTexelBufferDescriptors: Uint32 = 0,
    NumInputAttachmentDescriptors: Uint32 = 0,
    NumAccelStructDescriptors: Uint32 = 0,
};
pub const VulkanDescriptorPoolSize = struct_VulkanDescriptorPoolSize;
pub const struct_DeviceFeaturesVk = extern struct {
    DynamicRendering: DEVICE_FEATURE_STATE = 0,
    HostImageCopy: DEVICE_FEATURE_STATE = 0,
};
pub const DeviceFeaturesVk = struct_DeviceFeaturesVk;
pub const struct_EngineVkCreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    FeaturesVk: DeviceFeaturesVk = @import("std").mem.zeroes(DeviceFeaturesVk),
    InstanceLayerCount: Uint32 = 0,
    ppInstanceLayerNames: [*c]const [*c]const Char = null,
    InstanceExtensionCount: Uint32 = 0,
    ppInstanceExtensionNames: [*c]const [*c]const Char = null,
    DeviceExtensionCount: Uint32 = 0,
    ppDeviceExtensionNames: [*c]const [*c]const Char = null,
    pDeviceExtensionFeatures: ?*anyopaque = null,
    pVkAllocator: ?*anyopaque = null,
    IgnoreDebugMessageCount: Uint32 = 0,
    ppIgnoreDebugMessageNames: [*c]const [*c]const Char = null,
    MainDescriptorPoolSize: VulkanDescriptorPoolSize = @import("std").mem.zeroes(VulkanDescriptorPoolSize),
    DynamicDescriptorPoolSize: VulkanDescriptorPoolSize = @import("std").mem.zeroes(VulkanDescriptorPoolSize),
    DeviceLocalMemoryPageSize: Uint32 = 0,
    HostVisibleMemoryPageSize: Uint32 = 0,
    DeviceLocalMemoryReserveSize: Uint32 = 0,
    HostVisibleMemoryReserveSize: Uint32 = 0,
    UploadHeapPageSize: Uint32 = 0,
    DynamicHeapSize: Uint32 = 0,
    DynamicHeapPageSize: Uint32 = 0,
    QueryPoolSizes: [6]Uint32 = @import("std").mem.zeroes([6]Uint32),
    pDxCompilerPath: [*c]const Char = null,
};
pub const EngineVkCreateInfo = struct_EngineVkCreateInfo;
pub const struct_EngineMtlCreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    DynamicHeapPageSize: Uint32 = 0,
    QueryPoolSizes: [6]Uint32 = @import("std").mem.zeroes([6]Uint32),
    pDxCompilerPath: [*c]const Char = null,
};
pub const EngineMtlCreateInfo = struct_EngineMtlCreateInfo;
pub const struct_EngineWebGPUCreateInfo = extern struct {
    _EngineCreateInfo: struct_EngineCreateInfo = @import("std").mem.zeroes(struct_EngineCreateInfo),
    UploadHeapPageSize: Uint32 = 0,
    DynamicHeapSize: Uint32 = 0,
    DynamicHeapPageSize: Uint32 = 0,
    QueryPoolSizes: [6]Uint32 = @import("std").mem.zeroes([6]Uint32),
};
pub const EngineWebGPUCreateInfo = struct_EngineWebGPUCreateInfo;
pub const struct_Box = extern struct {
    MinX: Uint32 = 0,
    MaxX: Uint32 = 0,
    MinY: Uint32 = 0,
    MaxY: Uint32 = 0,
    MinZ: Uint32 = 0,
    MaxZ: Uint32 = 0,
};
pub const Box = struct_Box;
pub const COMPONENT_TYPE = Uint8;
pub const COMPONENT_TYPE_UNDEFINED: c_int = 0;
pub const COMPONENT_TYPE_FLOAT: c_int = 1;
pub const COMPONENT_TYPE_SNORM: c_int = 2;
pub const COMPONENT_TYPE_UNORM: c_int = 3;
pub const COMPONENT_TYPE_UNORM_SRGB: c_int = 4;
pub const COMPONENT_TYPE_SINT: c_int = 5;
pub const COMPONENT_TYPE_UINT: c_int = 6;
pub const COMPONENT_TYPE_DEPTH: c_int = 7;
pub const COMPONENT_TYPE_DEPTH_STENCIL: c_int = 8;
pub const COMPONENT_TYPE_COMPOUND: c_int = 9;
pub const COMPONENT_TYPE_COMPRESSED: c_int = 10;
pub const enum__COMPONENT_TYPE = c_uint;
pub const struct_TextureFormatAttribs = extern struct {
    Name: [*c]const Char = null,
    Format: TEXTURE_FORMAT = 0,
    ComponentSize: Uint8 = 0,
    NumComponents: Uint8 = 0,
    ComponentType: COMPONENT_TYPE = 0,
    IsTypeless: Bool = false,
    BlockWidth: Uint8 = 0,
    BlockHeight: Uint8 = 0,
};
pub const TextureFormatAttribs = struct_TextureFormatAttribs;
pub const struct_TextureFormatInfo = extern struct {
    _TextureFormatAttribs: struct_TextureFormatAttribs = @import("std").mem.zeroes(struct_TextureFormatAttribs),
    Supported: Bool = false,
    Padding: [7]Bool = @import("std").mem.zeroes([7]Bool),
};
pub const TextureFormatInfo = struct_TextureFormatInfo;
pub const RESOURCE_DIMENSION_SUPPORT = Uint32;
pub const RESOURCE_DIMENSION_SUPPORT_NONE: c_int = 0;
pub const RESOURCE_DIMENSION_SUPPORT_BUFFER: c_int = 2;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_1D: c_int = 4;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_1D_ARRAY: c_int = 8;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_2D: c_int = 16;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_2D_ARRAY: c_int = 32;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_3D: c_int = 64;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_CUBE: c_int = 128;
pub const RESOURCE_DIMENSION_SUPPORT_TEX_CUBE_ARRAY: c_int = 256;
pub const enum__RESOURCE_DIMENSION_SUPPORT = c_uint;
pub const struct_TextureFormatInfoExt = extern struct {
    _TextureFormatInfo: struct_TextureFormatInfo = @import("std").mem.zeroes(struct_TextureFormatInfo),
    BindFlags: BIND_FLAGS = 0,
    Dimensions: RESOURCE_DIMENSION_SUPPORT = 0,
    SampleCounts: SAMPLE_COUNT = 0,
    Filterable: Bool = false,
};
pub const TextureFormatInfoExt = struct_TextureFormatInfoExt;
pub const SPARSE_TEXTURE_FLAGS = Uint8;
pub const SPARSE_TEXTURE_FLAG_NONE: c_int = 0;
pub const SPARSE_TEXTURE_FLAG_SINGLE_MIPTAIL: c_int = 1;
pub const SPARSE_TEXTURE_FLAG_ALIGNED_MIP_SIZE: c_int = 2;
pub const SPARSE_TEXTURE_FLAG_NONSTANDARD_BLOCK_SIZE: c_int = 4;
pub const SPARSE_TEXTURE_FLAG_LAST: c_int = 4;
pub const enum__SPARSE_TEXTURE_FLAGS = c_uint;
pub const struct_SparseTextureFormatInfo = extern struct {
    BindFlags: BIND_FLAGS = 0,
    TileSize: [3]Uint32 = @import("std").mem.zeroes([3]Uint32),
    Flags: SPARSE_TEXTURE_FLAGS = 0,
};
pub const SparseTextureFormatInfo = struct_SparseTextureFormatInfo;
pub const PIPELINE_STAGE_FLAGS = Uint32;
pub const PIPELINE_STAGE_FLAG_UNDEFINED: c_uint = 0;
pub const PIPELINE_STAGE_FLAG_TOP_OF_PIPE: c_uint = 1;
pub const PIPELINE_STAGE_FLAG_DRAW_INDIRECT: c_uint = 2;
pub const PIPELINE_STAGE_FLAG_VERTEX_INPUT: c_uint = 4;
pub const PIPELINE_STAGE_FLAG_VERTEX_SHADER: c_uint = 8;
pub const PIPELINE_STAGE_FLAG_HULL_SHADER: c_uint = 16;
pub const PIPELINE_STAGE_FLAG_DOMAIN_SHADER: c_uint = 32;
pub const PIPELINE_STAGE_FLAG_GEOMETRY_SHADER: c_uint = 64;
pub const PIPELINE_STAGE_FLAG_PIXEL_SHADER: c_uint = 128;
pub const PIPELINE_STAGE_FLAG_EARLY_FRAGMENT_TESTS: c_uint = 256;
pub const PIPELINE_STAGE_FLAG_LATE_FRAGMENT_TESTS: c_uint = 512;
pub const PIPELINE_STAGE_FLAG_RENDER_TARGET: c_uint = 1024;
pub const PIPELINE_STAGE_FLAG_COMPUTE_SHADER: c_uint = 2048;
pub const PIPELINE_STAGE_FLAG_TRANSFER: c_uint = 4096;
pub const PIPELINE_STAGE_FLAG_BOTTOM_OF_PIPE: c_uint = 8192;
pub const PIPELINE_STAGE_FLAG_HOST: c_uint = 16384;
pub const PIPELINE_STAGE_FLAG_CONDITIONAL_RENDERING: c_uint = 262144;
pub const PIPELINE_STAGE_FLAG_SHADING_RATE_TEXTURE: c_uint = 4194304;
pub const PIPELINE_STAGE_FLAG_RAY_TRACING_SHADER: c_uint = 2097152;
pub const PIPELINE_STAGE_FLAG_ACCELERATION_STRUCTURE_BUILD: c_uint = 33554432;
pub const PIPELINE_STAGE_FLAG_TASK_SHADER: c_uint = 524288;
pub const PIPELINE_STAGE_FLAG_MESH_SHADER: c_uint = 1048576;
pub const PIPELINE_STAGE_FLAG_FRAGMENT_DENSITY_PROCESS: c_uint = 8388608;
pub const PIPELINE_STAGE_FLAG_DEFAULT: c_uint = 2147483648;
pub const enum__PIPELINE_STAGE_FLAGS = c_uint;
pub const ACCESS_FLAGS = Uint32;
pub const ACCESS_FLAG_NONE: c_uint = 0;
pub const ACCESS_FLAG_INDIRECT_COMMAND_READ: c_uint = 1;
pub const ACCESS_FLAG_INDEX_READ: c_uint = 2;
pub const ACCESS_FLAG_VERTEX_READ: c_uint = 4;
pub const ACCESS_FLAG_UNIFORM_READ: c_uint = 8;
pub const ACCESS_FLAG_INPUT_ATTACHMENT_READ: c_uint = 16;
pub const ACCESS_FLAG_SHADER_READ: c_uint = 32;
pub const ACCESS_FLAG_SHADER_WRITE: c_uint = 64;
pub const ACCESS_FLAG_RENDER_TARGET_READ: c_uint = 128;
pub const ACCESS_FLAG_RENDER_TARGET_WRITE: c_uint = 256;
pub const ACCESS_FLAG_DEPTH_STENCIL_READ: c_uint = 512;
pub const ACCESS_FLAG_DEPTH_STENCIL_WRITE: c_uint = 1024;
pub const ACCESS_FLAG_COPY_SRC: c_uint = 2048;
pub const ACCESS_FLAG_COPY_DST: c_uint = 4096;
pub const ACCESS_FLAG_HOST_READ: c_uint = 8192;
pub const ACCESS_FLAG_HOST_WRITE: c_uint = 16384;
pub const ACCESS_FLAG_MEMORY_READ: c_uint = 32768;
pub const ACCESS_FLAG_MEMORY_WRITE: c_uint = 65536;
pub const ACCESS_FLAG_CONDITIONAL_RENDERING_READ: c_uint = 1048576;
pub const ACCESS_FLAG_SHADING_RATE_TEXTURE_READ: c_uint = 8388608;
pub const ACCESS_FLAG_ACCELERATION_STRUCTURE_READ: c_uint = 2097152;
pub const ACCESS_FLAG_ACCELERATION_STRUCTURE_WRITE: c_uint = 4194304;
pub const ACCESS_FLAG_FRAGMENT_DENSITY_MAP_READ: c_uint = 16777216;
pub const ACCESS_FLAG_DEFAULT: c_uint = 2147483648;
pub const enum__ACCESS_FLAGS = c_uint;
pub const RESOURCE_STATE = Uint32;
pub const RESOURCE_STATE_UNKNOWN: c_int = 0;
pub const RESOURCE_STATE_UNDEFINED: c_int = 1;
pub const RESOURCE_STATE_VERTEX_BUFFER: c_int = 2;
pub const RESOURCE_STATE_CONSTANT_BUFFER: c_int = 4;
pub const RESOURCE_STATE_INDEX_BUFFER: c_int = 8;
pub const RESOURCE_STATE_RENDER_TARGET: c_int = 16;
pub const RESOURCE_STATE_UNORDERED_ACCESS: c_int = 32;
pub const RESOURCE_STATE_DEPTH_WRITE: c_int = 64;
pub const RESOURCE_STATE_DEPTH_READ: c_int = 128;
pub const RESOURCE_STATE_SHADER_RESOURCE: c_int = 256;
pub const RESOURCE_STATE_STREAM_OUT: c_int = 512;
pub const RESOURCE_STATE_INDIRECT_ARGUMENT: c_int = 1024;
pub const RESOURCE_STATE_COPY_DEST: c_int = 2048;
pub const RESOURCE_STATE_COPY_SOURCE: c_int = 4096;
pub const RESOURCE_STATE_RESOLVE_DEST: c_int = 8192;
pub const RESOURCE_STATE_RESOLVE_SOURCE: c_int = 16384;
pub const RESOURCE_STATE_INPUT_ATTACHMENT: c_int = 32768;
pub const RESOURCE_STATE_PRESENT: c_int = 65536;
pub const RESOURCE_STATE_BUILD_AS_READ: c_int = 131072;
pub const RESOURCE_STATE_BUILD_AS_WRITE: c_int = 262144;
pub const RESOURCE_STATE_RAY_TRACING: c_int = 524288;
pub const RESOURCE_STATE_COMMON: c_int = 1048576;
pub const RESOURCE_STATE_SHADING_RATE: c_int = 2097152;
pub const RESOURCE_STATE_MAX_BIT: c_int = 2097152;
pub const RESOURCE_STATE_GENERIC_READ: c_int = 5390;
pub const enum__RESOURCE_STATE = c_uint;
pub const STATE_TRANSITION_TYPE = Uint8;
pub const STATE_TRANSITION_TYPE_IMMEDIATE: c_int = 0;
pub const STATE_TRANSITION_TYPE_BEGIN: c_int = 1;
pub const STATE_TRANSITION_TYPE_END: c_int = 2;
pub const enum__STATE_TRANSITION_TYPE = c_uint;
pub const IID_DeviceObject: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1531759115,
    .Data2 = 20597,
    .Data3 = 16944,
    .Data4 = [8]Uint8{
        151,
        89,
        244,
        135,
        105,
        238,
        85,
        2,
    },
};
pub const struct_IDeviceObjectMethods = extern struct {
    GetDesc: ?*const fn ([*c]struct_IDeviceObject) callconv(.c) [*c]const DeviceObjectAttribs = null,
    GetUniqueID: ?*const fn ([*c]struct_IDeviceObject) callconv(.c) Int32 = null,
    SetUserData: ?*const fn ([*c]struct_IDeviceObject, pUserData: [*c]IObject) callconv(.c) void = null,
    GetUserData: ?*const fn ([*c]struct_IDeviceObject) callconv(.c) [*c]IObject = null,
};
pub const IDeviceObjectMethods = struct_IDeviceObjectMethods;
pub const struct_IDeviceObjectVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
};
pub const struct_IDeviceObject = extern struct {
    pVtbl: [*c]struct_IDeviceObjectVtbl = null,
};
pub const IDeviceObject = struct_IDeviceObject;
pub const IDeviceObjectVtbl = struct_IDeviceObjectVtbl;
pub const IID_BufferView: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 3806868624,
    .Data2 = 59858,
    .Data3 = 18779,
    .Data4 = [8]Uint8{
        154,
        131,
        171,
        180,
        19,
        163,
        139,
        7,
    },
};
pub const struct_BufferFormat = extern struct {
    ValueType: VALUE_TYPE = 0,
    NumComponents: Uint8 = 0,
    IsNormalized: Bool = false,
};
pub const BufferFormat = struct_BufferFormat;
pub const struct_BufferViewDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    ViewType: BUFFER_VIEW_TYPE = 0,
    Format: struct_BufferFormat = @import("std").mem.zeroes(struct_BufferFormat),
    ByteOffset: Uint64 = 0,
    ByteWidth: Uint64 = 0,
};
pub const BufferViewDesc = struct_BufferViewDesc;
pub const IBufferView = struct_IBufferView;
pub const struct_SparseBufferProperties = extern struct {
    AddressSpaceSize: Uint64 = 0,
    BlockSize: Uint32 = 0,
};
pub const SparseBufferProperties = struct_SparseBufferProperties;
pub const struct_IBufferMethods = extern struct {
    CreateView: ?*const fn ([*c]struct_IBuffer, ViewDesc: [*c]const BufferViewDesc, ppView: [*c][*c]IBufferView) callconv(.c) void = null,
    GetDefaultView: ?*const fn ([*c]struct_IBuffer, ViewType: BUFFER_VIEW_TYPE) callconv(.c) [*c]IBufferView = null,
    GetNativeHandle: ?*const fn ([*c]struct_IBuffer) callconv(.c) Uint64 = null,
    SetState: ?*const fn ([*c]struct_IBuffer, State: RESOURCE_STATE) callconv(.c) void = null,
    GetState: ?*const fn ([*c]struct_IBuffer) callconv(.c) RESOURCE_STATE = null,
    GetMemoryProperties: ?*const fn ([*c]struct_IBuffer) callconv(.c) MEMORY_PROPERTIES = null,
    FlushMappedRange: ?*const fn ([*c]struct_IBuffer, StartOffset: Uint64, Size: Uint64) callconv(.c) void = null,
    InvalidateMappedRange: ?*const fn ([*c]struct_IBuffer, StartOffset: Uint64, Size: Uint64) callconv(.c) void = null,
    GetSparseProperties: ?*const fn ([*c]struct_IBuffer) callconv(.c) [*c]const SparseBufferProperties = null,
};
pub const IBufferMethods = struct_IBufferMethods;
pub const struct_IBufferVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    Buffer: IBufferMethods = @import("std").mem.zeroes(IBufferMethods),
};
pub const struct_IBuffer = extern struct {
    pVtbl: [*c]struct_IBufferVtbl = null,
};
pub const struct_IBufferViewMethods = extern struct {
    GetBuffer: ?*const fn ([*c]struct_IBufferView) callconv(.c) [*c]struct_IBuffer = null,
};
pub const IBufferViewMethods = struct_IBufferViewMethods;
pub const struct_IBufferViewVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    BufferView: IBufferViewMethods = @import("std").mem.zeroes(IBufferViewMethods),
};
pub const struct_IBufferView = extern struct {
    pVtbl: [*c]struct_IBufferViewVtbl = null,
};
pub const IBufferViewVtbl = struct_IBufferViewVtbl;
pub const IID_Buffer: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 3964136147,
    .Data2 = 41668,
    .Data3 = 17650,
    .Data4 = [8]Uint8{
        129,
        197,
        82,
        72,
        209,
        79,
        16,
        228,
    },
};
pub const BUFFER_MODE = Uint8;
pub const BUFFER_MODE_UNDEFINED: c_int = 0;
pub const BUFFER_MODE_FORMATTED: c_int = 1;
pub const BUFFER_MODE_STRUCTURED: c_int = 2;
pub const BUFFER_MODE_RAW: c_int = 3;
pub const BUFFER_MODE_NUM_MODES: c_int = 4;
pub const enum__BUFFER_MODE = c_uint;
pub const MISC_BUFFER_FLAGS = Uint8;
pub const MISC_BUFFER_FLAG_NONE: c_int = 0;
pub const MISC_BUFFER_FLAG_SPARSE_ALIASING: c_int = 1;
pub const enum__MISC_BUFFER_FLAGS = c_uint;
pub const struct_BufferDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Size: Uint64 = 0,
    BindFlags: BIND_FLAGS = 0,
    Usage: USAGE = 0,
    CPUAccessFlags: CPU_ACCESS_FLAGS = 0,
    Mode: BUFFER_MODE = 0,
    MiscFlags: MISC_BUFFER_FLAGS = 0,
    ElementByteStride: Uint32 = 0,
    ImmediateContextMask: Uint64 = 0,
};
pub const BufferDesc = struct_BufferDesc;
pub const struct_DeviceContextDesc = extern struct {
    Name: [*c]const Char = null,
    QueueType: COMMAND_QUEUE_TYPE = 0,
    IsDeferred: Bool = false,
    ContextId: Uint8 = 0,
    QueueId: Uint8 = 0,
    TextureCopyGranularity: [3]Uint32 = @import("std").mem.zeroes([3]Uint32),
};
pub const DeviceContextDesc = struct_DeviceContextDesc;
pub const BLEND_FACTOR = Int8;
pub const BLEND_OPERATION = Int8;
pub const LOGIC_OPERATION = Int8;
pub const COLOR_MASK = Uint8;
pub const struct_RenderTargetBlendDesc = extern struct {
    BlendEnable: Bool = false,
    LogicOperationEnable: Bool = false,
    SrcBlend: BLEND_FACTOR = 0,
    DestBlend: BLEND_FACTOR = 0,
    BlendOp: BLEND_OPERATION = 0,
    SrcBlendAlpha: BLEND_FACTOR = 0,
    DestBlendAlpha: BLEND_FACTOR = 0,
    BlendOpAlpha: BLEND_OPERATION = 0,
    LogicOp: LOGIC_OPERATION = 0,
    RenderTargetWriteMask: COLOR_MASK = 0,
};
pub const RenderTargetBlendDesc = struct_RenderTargetBlendDesc;
pub const struct_BlendStateDesc = extern struct {
    AlphaToCoverageEnable: Bool = false,
    IndependentBlendEnable: Bool = false,
    RenderTargets: [8]RenderTargetBlendDesc = @import("std").mem.zeroes([8]RenderTargetBlendDesc),
};
pub const BlendStateDesc = struct_BlendStateDesc;
pub const FILL_MODE = Int8;
pub const CULL_MODE = Int8;
pub const struct_RasterizerStateDesc = extern struct {
    FillMode: FILL_MODE = 0,
    CullMode: CULL_MODE = 0,
    FrontCounterClockwise: Bool = false,
    DepthClipEnable: Bool = false,
    ScissorEnable: Bool = false,
    AntialiasedLineEnable: Bool = false,
    DepthBias: Int32 = 0,
    DepthBiasClamp: Float32 = 0,
    SlopeScaledDepthBias: Float32 = 0,
};
pub const RasterizerStateDesc = struct_RasterizerStateDesc;
pub const STENCIL_OP = Int8;
pub const struct_StencilOpDesc = extern struct {
    StencilFailOp: STENCIL_OP = 0,
    StencilDepthFailOp: STENCIL_OP = 0,
    StencilPassOp: STENCIL_OP = 0,
    StencilFunc: COMPARISON_FUNCTION = 0,
};
pub const StencilOpDesc = struct_StencilOpDesc;
pub const struct_DepthStencilStateDesc = extern struct {
    DepthEnable: Bool = false,
    DepthWriteEnable: Bool = false,
    DepthFunc: COMPARISON_FUNCTION = 0,
    StencilEnable: Bool = false,
    StencilReadMask: Uint8 = 0,
    StencilWriteMask: Uint8 = 0,
    FrontFace: StencilOpDesc = @import("std").mem.zeroes(StencilOpDesc),
    BackFace: StencilOpDesc = @import("std").mem.zeroes(StencilOpDesc),
};
pub const DepthStencilStateDesc = struct_DepthStencilStateDesc;
pub const INPUT_ELEMENT_FREQUENCY = Uint8;
pub const struct_LayoutElement = extern struct {
    HLSLSemantic: [*c]const Char = null,
    InputIndex: Uint32 = 0,
    BufferSlot: Uint32 = 0,
    NumComponents: Uint32 = 0,
    ValueType: VALUE_TYPE = 0,
    IsNormalized: Bool = false,
    RelativeOffset: Uint32 = 0,
    Stride: Uint32 = 0,
    Frequency: INPUT_ELEMENT_FREQUENCY = 0,
    InstanceDataStepRate: Uint32 = 0,
};
pub const LayoutElement = struct_LayoutElement;
pub const struct_InputLayoutDesc = extern struct {
    LayoutElements: [*c]const LayoutElement = null,
    NumElements: Uint32 = 0,
};
pub const InputLayoutDesc = struct_InputLayoutDesc;
pub const PIPELINE_SHADING_RATE_FLAGS = Uint8;
pub const struct_SampleDesc = extern struct {
    Count: Uint8 = 0,
    Quality: Uint8 = 0,
};
pub const SampleDesc = struct_SampleDesc;
pub const struct_IRenderPassVtbl = extern struct {
    Object: struct_IObjectMethods = @import("std").mem.zeroes(struct_IObjectMethods),
    DeviceObject: struct_IDeviceObjectMethods = @import("std").mem.zeroes(struct_IDeviceObjectMethods),
};
pub const struct_IRenderPass = extern struct {
    pVtbl: [*c]struct_IRenderPassVtbl = null,
};
pub const IRenderPass = struct_IRenderPass;
pub const struct_GraphicsPipelineDesc = extern struct {
    BlendDesc: BlendStateDesc = @import("std").mem.zeroes(BlendStateDesc),
    SampleMask: Uint32 = 0,
    RasterizerDesc: RasterizerStateDesc = @import("std").mem.zeroes(RasterizerStateDesc),
    DepthStencilDesc: DepthStencilStateDesc = @import("std").mem.zeroes(DepthStencilStateDesc),
    InputLayout: InputLayoutDesc = @import("std").mem.zeroes(InputLayoutDesc),
    PrimitiveTopology: PRIMITIVE_TOPOLOGY = 0,
    NumViewports: Uint8 = 0,
    NumRenderTargets: Uint8 = 0,
    SubpassIndex: Uint8 = 0,
    ShadingRateFlags: PIPELINE_SHADING_RATE_FLAGS = 0,
    RTVFormats: [8]TEXTURE_FORMAT = @import("std").mem.zeroes([8]TEXTURE_FORMAT),
    DSVFormat: TEXTURE_FORMAT = 0,
    ReadOnlyDSV: Bool = false,
    SmplDesc: SampleDesc = @import("std").mem.zeroes(SampleDesc),
    pRenderPass: [*c]IRenderPass = null,
    NodeMask: Uint32 = 0,
};
pub const GraphicsPipelineDesc = struct_GraphicsPipelineDesc;
pub const struct_RayTracingPipelineDesc = extern struct {
    ShaderRecordSize: Uint16 = 0,
    MaxRecursionDepth: Uint8 = 0,
};
pub const RayTracingPipelineDesc = struct_RayTracingPipelineDesc;
pub const struct_TilePipelineDesc = extern struct {
    NumRenderTargets: Uint8 = 0,
    SampleCount: Uint8 = 0,
    RTVFormats: [8]TEXTURE_FORMAT = @import("std").mem.zeroes([8]TEXTURE_FORMAT),
};
pub const TilePipelineDesc = struct_TilePipelineDesc;
pub const struct_IResourceMappingMethods = extern struct {
    AddResource: ?*const fn ([*c]struct_IResourceMapping, Name: [*c]const Char, pObject: [*c]IDeviceObject, bIsUnique: Bool) callconv(.c) void = null,
    AddResourceArray: ?*const fn ([*c]struct_IResourceMapping, Name: [*c]const Char, StartIndex: Uint32, ppObjects: [*c]const [*c]IDeviceObject, NumElements: Uint32, bIsUnique: Bool) callconv(.c) void = null,
    RemoveResourceByName: ?*const fn ([*c]struct_IResourceMapping, Name: [*c]const Char, ArrayIndex: Uint32) callconv(.c) void = null,
    GetResource: ?*const fn ([*c]struct_IResourceMapping, Name: [*c]const Char, ArrayIndex: Uint32) callconv(.c) [*c]IDeviceObject = null,
    GetSize: ?*const fn ([*c]struct_IResourceMapping) callconv(.c) usize = null,
};
pub const IResourceMappingMethods = struct_IResourceMappingMethods;
pub const struct_IResourceMappingVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    ResourceMapping: IResourceMappingMethods = @import("std").mem.zeroes(IResourceMappingMethods),
};
pub const struct_IResourceMapping = extern struct {
    pVtbl: [*c]struct_IResourceMappingVtbl = null,
};
pub const IResourceMapping = struct_IResourceMapping;
pub const BIND_SHADER_RESOURCES_FLAGS = Uint32;
pub const SET_SHADER_RESOURCE_FLAGS = Uint32;
pub const SHADER_RESOURCE_VARIABLE_TYPE = Uint8;
pub const SHADER_RESOURCE_TYPE = Uint8;
pub const struct_ShaderResourceDesc = extern struct {
    Name: [*c]const Char = null,
    Type: SHADER_RESOURCE_TYPE = 0,
    ArraySize: Uint32 = 0,
};
pub const ShaderResourceDesc = struct_ShaderResourceDesc;
pub const struct_IShaderResourceVariableMethods = extern struct {
    Set: ?*const fn ([*c]struct_IShaderResourceVariable, pObject: [*c]IDeviceObject, Flags: SET_SHADER_RESOURCE_FLAGS) callconv(.c) void = null,
    SetArray: ?*const fn ([*c]struct_IShaderResourceVariable, ppObjects: [*c]const [*c]IDeviceObject, FirstElement: Uint32, NumElements: Uint32, Flags: SET_SHADER_RESOURCE_FLAGS) callconv(.c) void = null,
    SetBufferRange: ?*const fn ([*c]struct_IShaderResourceVariable, pObject: [*c]IDeviceObject, Offset: Uint64, Size: Uint64, ArrayIndex: Uint32, Flags: SET_SHADER_RESOURCE_FLAGS) callconv(.c) void = null,
    SetBufferOffset: ?*const fn ([*c]struct_IShaderResourceVariable, Offset: Uint32, ArrayIndex: Uint32) callconv(.c) void = null,
    SetInlineConstants: ?*const fn ([*c]struct_IShaderResourceVariable, pConstants: ?*const anyopaque, FirstConstant: Uint32, NumConstants: Uint32) callconv(.c) void = null,
    GetType: ?*const fn ([*c]struct_IShaderResourceVariable) callconv(.c) SHADER_RESOURCE_VARIABLE_TYPE = null,
    GetResourceDesc: ?*const fn ([*c]struct_IShaderResourceVariable, ResourceDesc: [*c]ShaderResourceDesc) callconv(.c) void = null,
    GetIndex: ?*const fn ([*c]struct_IShaderResourceVariable) callconv(.c) Uint32 = null,
    Get: ?*const fn ([*c]struct_IShaderResourceVariable, ArrayIndex: Uint32) callconv(.c) [*c]IDeviceObject = null,
};
pub const IShaderResourceVariableMethods = struct_IShaderResourceVariableMethods;
pub const struct_IShaderResourceVariableVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    ShaderResourceVariable: IShaderResourceVariableMethods = @import("std").mem.zeroes(IShaderResourceVariableMethods),
};
pub const struct_IShaderResourceVariable = extern struct {
    pVtbl: [*c]struct_IShaderResourceVariableVtbl = null,
};
pub const IShaderResourceVariable = struct_IShaderResourceVariable;
pub const IPipelineResourceSignature = struct_IPipelineResourceSignature;
pub const struct_IPipelineResourceSignatureMethods = extern struct {
    CreateShaderResourceBinding: ?*const fn ([*c]struct_IPipelineResourceSignature, ppShaderResourceBinding: [*c][*c]IShaderResourceBinding, InitStaticResources: Bool) callconv(.c) void = null,
    BindStaticResources: ?*const fn ([*c]struct_IPipelineResourceSignature, ShaderStages: SHADER_TYPE, pResourceMapping: [*c]IResourceMapping, Flags: BIND_SHADER_RESOURCES_FLAGS) callconv(.c) void = null,
    GetStaticVariableByName: ?*const fn ([*c]struct_IPipelineResourceSignature, ShaderType: SHADER_TYPE, Name: [*c]const Char) callconv(.c) [*c]IShaderResourceVariable = null,
    GetStaticVariableByIndex: ?*const fn ([*c]struct_IPipelineResourceSignature, ShaderType: SHADER_TYPE, Index: Uint32) callconv(.c) [*c]IShaderResourceVariable = null,
    GetStaticVariableCount: ?*const fn ([*c]struct_IPipelineResourceSignature, ShaderType: SHADER_TYPE) callconv(.c) Uint32 = null,
    InitializeStaticSRBResources: ?*const fn ([*c]struct_IPipelineResourceSignature, pShaderResourceBinding: [*c]struct_IShaderResourceBinding) callconv(.c) void = null,
    CopyStaticResources: ?*const fn ([*c]struct_IPipelineResourceSignature, pDstSignature: [*c]IPipelineResourceSignature) callconv(.c) void = null,
    IsCompatibleWith: ?*const fn ([*c]struct_IPipelineResourceSignature, pPRS: [*c]const struct_IPipelineResourceSignature) callconv(.c) Bool = null,
};
pub const IPipelineResourceSignatureMethods = struct_IPipelineResourceSignatureMethods;
pub const struct_IPipelineResourceSignatureVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    PipelineResourceSignature: IPipelineResourceSignatureMethods = @import("std").mem.zeroes(IPipelineResourceSignatureMethods),
};
pub const struct_IPipelineResourceSignature = extern struct {
    pVtbl: [*c]struct_IPipelineResourceSignatureVtbl = null,
};
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAGS = Uint32;
pub const struct_IShaderResourceBindingMethods = extern struct {
    GetPipelineResourceSignature: ?*const fn ([*c]struct_IShaderResourceBinding) callconv(.c) [*c]struct_IPipelineResourceSignature = null,
    BindResources: ?*const fn ([*c]struct_IShaderResourceBinding, ShaderStages: SHADER_TYPE, pResMapping: [*c]IResourceMapping, Flags: BIND_SHADER_RESOURCES_FLAGS) callconv(.c) void = null,
    CheckResources: ?*const fn ([*c]struct_IShaderResourceBinding, ShaderStages: SHADER_TYPE, pResMapping: [*c]IResourceMapping, Flags: BIND_SHADER_RESOURCES_FLAGS) callconv(.c) SHADER_RESOURCE_VARIABLE_TYPE_FLAGS = null,
    GetVariableByName: ?*const fn ([*c]struct_IShaderResourceBinding, ShaderType: SHADER_TYPE, Name: [*c]const Char) callconv(.c) [*c]IShaderResourceVariable = null,
    GetVariableCount: ?*const fn ([*c]struct_IShaderResourceBinding, ShaderType: SHADER_TYPE) callconv(.c) Uint32 = null,
    GetVariableByIndex: ?*const fn ([*c]struct_IShaderResourceBinding, ShaderType: SHADER_TYPE, Index: Uint32) callconv(.c) [*c]IShaderResourceVariable = null,
    StaticResourcesInitialized: ?*const fn ([*c]struct_IShaderResourceBinding) callconv(.c) Bool = null,
};
pub const IShaderResourceBindingMethods = struct_IShaderResourceBindingMethods;
pub const struct_IShaderResourceBindingVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    ShaderResourceBinding: IShaderResourceBindingMethods = @import("std").mem.zeroes(IShaderResourceBindingMethods),
};
pub const struct_IShaderResourceBinding = extern struct {
    pVtbl: [*c]struct_IShaderResourceBindingVtbl = null,
};
pub const IShaderResourceBinding = struct_IShaderResourceBinding;
pub const PIPELINE_STATE_STATUS = Uint32;
pub const struct_IPipelineStateMethods = extern struct {
    GetGraphicsPipelineDesc: ?*const fn ([*c]struct_IPipelineState) callconv(.c) [*c]const GraphicsPipelineDesc = null,
    GetRayTracingPipelineDesc: ?*const fn ([*c]struct_IPipelineState) callconv(.c) [*c]const RayTracingPipelineDesc = null,
    GetTilePipelineDesc: ?*const fn ([*c]struct_IPipelineState) callconv(.c) [*c]const TilePipelineDesc = null,
    BindStaticResources: ?*const fn ([*c]struct_IPipelineState, ShaderStages: SHADER_TYPE, pResourceMapping: [*c]IResourceMapping, Flags: BIND_SHADER_RESOURCES_FLAGS) callconv(.c) void = null,
    GetStaticVariableCount: ?*const fn ([*c]struct_IPipelineState, ShaderType: SHADER_TYPE) callconv(.c) Uint32 = null,
    GetStaticVariableByName: ?*const fn ([*c]struct_IPipelineState, ShaderType: SHADER_TYPE, Name: [*c]const Char) callconv(.c) [*c]IShaderResourceVariable = null,
    GetStaticVariableByIndex: ?*const fn ([*c]struct_IPipelineState, ShaderType: SHADER_TYPE, Index: Uint32) callconv(.c) [*c]IShaderResourceVariable = null,
    CreateShaderResourceBinding: ?*const fn ([*c]struct_IPipelineState, ppShaderResourceBinding: [*c][*c]IShaderResourceBinding, InitStaticResources: Bool) callconv(.c) void = null,
    InitializeStaticSRBResources: ?*const fn ([*c]struct_IPipelineState, pShaderResourceBinding: [*c]struct_IShaderResourceBinding) callconv(.c) void = null,
    CopyStaticResources: ?*const fn ([*c]struct_IPipelineState, pDstPipeline: [*c]IPipelineState) callconv(.c) void = null,
    IsCompatibleWith: ?*const fn ([*c]struct_IPipelineState, pPSO: [*c]const struct_IPipelineState) callconv(.c) bool = null,
    GetResourceSignatureCount: ?*const fn ([*c]struct_IPipelineState) callconv(.c) Uint32 = null,
    GetResourceSignature: ?*const fn ([*c]struct_IPipelineState, Index: Uint32) callconv(.c) [*c]IPipelineResourceSignature = null,
    GetStatus: ?*const fn ([*c]struct_IPipelineState, WaitForCompletion: bool) callconv(.c) PIPELINE_STATE_STATUS = null,
};
pub const IPipelineStateMethods = struct_IPipelineStateMethods;
pub const struct_IPipelineStateVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    PipelineState: IPipelineStateMethods = @import("std").mem.zeroes(IPipelineStateMethods),
};
pub const struct_IPipelineState = extern struct {
    pVtbl: [*c]struct_IPipelineStateVtbl = null,
};
pub const IPipelineState = struct_IPipelineState;
pub const RESOURCE_STATE_TRANSITION_MODE = Uint8;
pub const IBuffer = struct_IBuffer;
pub const SET_VERTEX_BUFFERS_FLAGS = Uint8;
pub const struct_Viewport = extern struct {
    TopLeftX: Float32 = 0,
    TopLeftY: Float32 = 0,
    Width: Float32 = 0,
    Height: Float32 = 0,
    MinDepth: Float32 = 0,
    MaxDepth: Float32 = 0,
};
pub const Viewport = struct_Viewport;
pub const struct_Rect = extern struct {
    left: Int32 = 0,
    top: Int32 = 0,
    right: Int32 = 0,
    bottom: Int32 = 0,
};
pub const Rect = struct_Rect;
pub const struct_ISamplerVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
};
pub const struct_ISampler = extern struct {
    pVtbl: [*c]struct_ISamplerVtbl = null,
};
const union_unnamed_1 = extern union {
    FirstArraySlice: Uint32,
    FirstDepthSlice: Uint32,
};
const union_unnamed_2 = extern union {
    NumArraySlices: Uint32,
    NumDepthSlices: Uint32,
};
pub const UAV_ACCESS_FLAG = Uint8;
pub const TEXTURE_VIEW_FLAGS = Uint8;
pub const TEXTURE_COMPONENT_SWIZZLE = Uint8;
pub const struct_TextureComponentMapping = extern struct {
    R: TEXTURE_COMPONENT_SWIZZLE = 0,
    G: TEXTURE_COMPONENT_SWIZZLE = 0,
    B: TEXTURE_COMPONENT_SWIZZLE = 0,
    A: TEXTURE_COMPONENT_SWIZZLE = 0,
};
pub const TextureComponentMapping = struct_TextureComponentMapping;
pub const struct_TextureViewDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    ViewType: TEXTURE_VIEW_TYPE = 0,
    TextureDim: RESOURCE_DIMENSION = 0,
    Format: TEXTURE_FORMAT = 0,
    MostDetailedMip: Uint32 = 0,
    NumMipLevels: Uint32 = 0,
    unnamed_0: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
    unnamed_1: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
    AccessFlags: UAV_ACCESS_FLAG = 0,
    Flags: TEXTURE_VIEW_FLAGS = 0,
    Swizzle: TextureComponentMapping = @import("std").mem.zeroes(TextureComponentMapping),
};
pub const TextureViewDesc = struct_TextureViewDesc;
pub const struct_SparseTextureProperties = extern struct {
    AddressSpaceSize: Uint64 = 0,
    MipTailOffset: Uint64 = 0,
    MipTailStride: Uint64 = 0,
    MipTailSize: Uint64 = 0,
    FirstMipInTail: Uint32 = 0,
    TileSize: [3]Uint32 = @import("std").mem.zeroes([3]Uint32),
    BlockSize: Uint32 = 0,
    Flags: SPARSE_TEXTURE_FLAGS = 0,
};
pub const SparseTextureProperties = struct_SparseTextureProperties;
pub const struct_ITextureMethods = extern struct {
    CreateView: ?*const fn ([*c]struct_ITexture, ViewDesc: [*c]const TextureViewDesc, ppView: [*c][*c]ITextureView) callconv(.c) void = null,
    GetDefaultView: ?*const fn ([*c]struct_ITexture, ViewType: TEXTURE_VIEW_TYPE) callconv(.c) [*c]ITextureView = null,
    GetNativeHandle: ?*const fn ([*c]struct_ITexture) callconv(.c) Uint64 = null,
    SetState: ?*const fn ([*c]struct_ITexture, State: RESOURCE_STATE) callconv(.c) void = null,
    GetState: ?*const fn ([*c]struct_ITexture) callconv(.c) RESOURCE_STATE = null,
    GetSparseProperties: ?*const fn ([*c]struct_ITexture) callconv(.c) [*c]const SparseTextureProperties = null,
};
pub const ITextureMethods = struct_ITextureMethods;
pub const struct_ITextureVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    Texture: ITextureMethods = @import("std").mem.zeroes(ITextureMethods),
};
pub const struct_ITexture = extern struct {
    pVtbl: [*c]struct_ITextureVtbl = null,
};
pub const struct_ITextureViewMethods = extern struct {
    SetSampler: ?*const fn ([*c]struct_ITextureView, pSampler: [*c]struct_ISampler) callconv(.c) void = null,
    GetSampler: ?*const fn ([*c]struct_ITextureView) callconv(.c) [*c]struct_ISampler = null,
    GetTexture: ?*const fn ([*c]struct_ITextureView) callconv(.c) [*c]struct_ITexture = null,
};
pub const ITextureViewMethods = struct_ITextureViewMethods;
pub const struct_ITextureViewVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    TextureView: ITextureViewMethods = @import("std").mem.zeroes(ITextureViewMethods),
};
pub const struct_ITextureView = extern struct {
    pVtbl: [*c]struct_ITextureViewVtbl = null,
};
pub const ITextureView = struct_ITextureView;
pub const struct_SetRenderTargetsAttribs = extern struct {
    NumRenderTargets: Uint32 = 0,
    ppRenderTargets: [*c][*c]ITextureView = null,
    pDepthStencil: [*c]ITextureView = null,
    pShadingRateMap: [*c]ITextureView = null,
    StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const SetRenderTargetsAttribs = struct_SetRenderTargetsAttribs;
pub const struct_IFramebufferVtbl = extern struct {
    Object: struct_IObjectMethods = @import("std").mem.zeroes(struct_IObjectMethods),
    DeviceObject: struct_IDeviceObjectMethods = @import("std").mem.zeroes(struct_IDeviceObjectMethods),
};
pub const struct_IFramebuffer = extern struct {
    pVtbl: [*c]struct_IFramebufferVtbl = null,
};
pub const IFramebuffer = struct_IFramebuffer;
pub const struct_BeginRenderPassAttribs = extern struct {
    pRenderPass: [*c]IRenderPass = null,
    pFramebuffer: [*c]IFramebuffer = null,
    ClearValueCount: Uint32 = 0,
    pClearValues: [*c]OptimizedClearValue = null,
    StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const BeginRenderPassAttribs = struct_BeginRenderPassAttribs;
pub const DRAW_FLAGS = Uint8;
pub const struct_DrawAttribs = extern struct {
    NumVertices: Uint32 = 0,
    Flags: DRAW_FLAGS = 0,
    NumInstances: Uint32 = 0,
    StartVertexLocation: Uint32 = 0,
    FirstInstanceLocation: Uint32 = 0,
};
pub const DrawAttribs = struct_DrawAttribs;
pub const struct_DrawIndexedAttribs = extern struct {
    NumIndices: Uint32 = 0,
    IndexType: VALUE_TYPE = 0,
    Flags: DRAW_FLAGS = 0,
    NumInstances: Uint32 = 0,
    FirstIndexLocation: Uint32 = 0,
    BaseVertex: Uint32 = 0,
    FirstInstanceLocation: Uint32 = 0,
};
pub const DrawIndexedAttribs = struct_DrawIndexedAttribs;
pub const struct_DrawIndirectAttribs = extern struct {
    pAttribsBuffer: [*c]IBuffer = null,
    DrawArgsOffset: Uint64 = 0,
    Flags: DRAW_FLAGS = 0,
    DrawCount: Uint32 = 0,
    DrawArgsStride: Uint32 = 0,
    AttribsBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pCounterBuffer: [*c]IBuffer = null,
    CounterOffset: Uint64 = 0,
    CounterBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const DrawIndirectAttribs = struct_DrawIndirectAttribs;
pub const struct_DrawIndexedIndirectAttribs = extern struct {
    IndexType: VALUE_TYPE = 0,
    pAttribsBuffer: [*c]IBuffer = null,
    DrawArgsOffset: Uint64 = 0,
    Flags: DRAW_FLAGS = 0,
    DrawCount: Uint32 = 0,
    DrawArgsStride: Uint32 = 0,
    AttribsBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pCounterBuffer: [*c]IBuffer = null,
    CounterOffset: Uint64 = 0,
    CounterBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const DrawIndexedIndirectAttribs = struct_DrawIndexedIndirectAttribs;
pub const struct_DrawMeshAttribsMtl = extern struct {
    ObjectThreadGroupSizeX: Uint32 = 0,
    ObjectThreadGroupSizeY: Uint32 = 0,
    ObjectThreadGroupSizeZ: Uint32 = 0,
    MeshThreadGroupSizeX: Uint32 = 0,
    MeshThreadGroupSizeY: Uint32 = 0,
    MeshThreadGroupSizeZ: Uint32 = 0,
};
pub const DrawMeshAttribsMtl = struct_DrawMeshAttribsMtl;
pub const struct_DrawMeshAttribs = extern struct {
    ThreadGroupCountX: Uint32 = 0,
    ThreadGroupCountY: Uint32 = 0,
    ThreadGroupCountZ: Uint32 = 0,
    Flags: DRAW_FLAGS = 0,
    pMtlAttribs: [*c]const DrawMeshAttribsMtl = null,
};
pub const DrawMeshAttribs = struct_DrawMeshAttribs;
pub const struct_DrawMeshIndirectAttribs = extern struct {
    pAttribsBuffer: [*c]IBuffer = null,
    DrawArgsOffset: Uint64 = 0,
    Flags: DRAW_FLAGS = 0,
    CommandCount: Uint32 = 0,
    AttribsBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pCounterBuffer: [*c]IBuffer = null,
    CounterOffset: Uint64 = 0,
    CounterBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pMtlAttribs: [*c]const DrawMeshAttribsMtl = null,
};
pub const DrawMeshIndirectAttribs = struct_DrawMeshIndirectAttribs;
pub const struct_MultiDrawItem = extern struct {
    NumVertices: Uint32 = 0,
    StartVertexLocation: Uint32 = 0,
};
pub const MultiDrawItem = struct_MultiDrawItem;
pub const struct_MultiDrawAttribs = extern struct {
    DrawCount: Uint32 = 0,
    pDrawItems: [*c]const MultiDrawItem = null,
    Flags: DRAW_FLAGS = 0,
    NumInstances: Uint32 = 0,
    FirstInstanceLocation: Uint32 = 0,
};
pub const MultiDrawAttribs = struct_MultiDrawAttribs;
pub const struct_MultiDrawIndexedItem = extern struct {
    NumIndices: Uint32 = 0,
    FirstIndexLocation: Uint32 = 0,
    BaseVertex: Uint32 = 0,
};
pub const MultiDrawIndexedItem = struct_MultiDrawIndexedItem;
pub const struct_MultiDrawIndexedAttribs = extern struct {
    DrawCount: Uint32 = 0,
    pDrawItems: [*c]const MultiDrawIndexedItem = null,
    IndexType: VALUE_TYPE = 0,
    Flags: DRAW_FLAGS = 0,
    NumInstances: Uint32 = 0,
    FirstInstanceLocation: Uint32 = 0,
};
pub const MultiDrawIndexedAttribs = struct_MultiDrawIndexedAttribs;
pub const struct_DispatchComputeAttribs = extern struct {
    ThreadGroupCountX: Uint32 = 0,
    ThreadGroupCountY: Uint32 = 0,
    ThreadGroupCountZ: Uint32 = 0,
    MtlThreadGroupSizeX: Uint32 = 0,
    MtlThreadGroupSizeY: Uint32 = 0,
    MtlThreadGroupSizeZ: Uint32 = 0,
};
pub const DispatchComputeAttribs = struct_DispatchComputeAttribs;
pub const struct_DispatchComputeIndirectAttribs = extern struct {
    pAttribsBuffer: [*c]IBuffer = null,
    AttribsBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    DispatchArgsByteOffset: Uint64 = 0,
    MtlThreadGroupSizeX: Uint32 = 0,
    MtlThreadGroupSizeY: Uint32 = 0,
    MtlThreadGroupSizeZ: Uint32 = 0,
};
pub const DispatchComputeIndirectAttribs = struct_DispatchComputeIndirectAttribs;
pub const struct_DispatchTileAttribs = extern struct {
    ThreadsPerTileX: Uint32 = 0,
    ThreadsPerTileY: Uint32 = 0,
    Flags: DRAW_FLAGS = 0,
};
pub const DispatchTileAttribs = struct_DispatchTileAttribs;
pub const CLEAR_DEPTH_STENCIL_FLAGS = Uint32;
pub const struct_ICommandListVtbl = extern struct {
    Object: struct_IObjectMethods = @import("std").mem.zeroes(struct_IObjectMethods),
    DeviceObject: struct_IDeviceObjectMethods = @import("std").mem.zeroes(struct_IDeviceObjectMethods),
};
pub const struct_ICommandList = extern struct {
    pVtbl: [*c]struct_ICommandListVtbl = null,
};
pub const ICommandList = struct_ICommandList;
pub const struct_IFenceMethods = extern struct {
    GetCompletedValue: ?*const fn ([*c]struct_IFence) callconv(.c) Uint64 = null,
    Signal: ?*const fn ([*c]struct_IFence, Value: Uint64) callconv(.c) void = null,
    Wait: ?*const fn ([*c]struct_IFence, Value: Uint64) callconv(.c) void = null,
};
pub const IFenceMethods = struct_IFenceMethods;
pub const struct_IFenceVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    Fence: IFenceMethods = @import("std").mem.zeroes(IFenceMethods),
};
pub const struct_IFence = extern struct {
    pVtbl: [*c]struct_IFenceVtbl = null,
};
pub const IFence = struct_IFence;
pub const struct_IQueryMethods = extern struct {
    GetData: ?*const fn ([*c]struct_IQuery, pData: ?*anyopaque, DataSize: Uint32, AutoInvalidate: Bool) callconv(.c) Bool = null,
    Invalidate: ?*const fn ([*c]struct_IQuery) callconv(.c) void = null,
};
pub const IQueryMethods = struct_IQueryMethods;
pub const struct_IQueryVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    Query: IQueryMethods = @import("std").mem.zeroes(IQueryMethods),
};
pub const struct_IQuery = extern struct {
    pVtbl: [*c]struct_IQueryVtbl = null,
};
pub const IQuery = struct_IQuery;
pub const ITexture = struct_ITexture;
pub const struct_TextureSubResData = extern struct {
    pData: ?*const anyopaque = null,
    pSrcBuffer: [*c]struct_IBuffer = null,
    SrcOffset: Uint64 = 0,
    Stride: Uint64 = 0,
    DepthStride: Uint64 = 0,
};
pub const TextureSubResData = struct_TextureSubResData;
pub const struct_CopyTextureAttribs = extern struct {
    pSrcTexture: [*c]ITexture = null,
    SrcMipLevel: Uint32 = 0,
    SrcSlice: Uint32 = 0,
    pSrcBox: [*c]const Box = null,
    SrcTextureTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pDstTexture: [*c]ITexture = null,
    DstMipLevel: Uint32 = 0,
    DstSlice: Uint32 = 0,
    DstX: Uint32 = 0,
    DstY: Uint32 = 0,
    DstZ: Uint32 = 0,
    DstTextureTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const CopyTextureAttribs = struct_CopyTextureAttribs;
pub const struct_MappedTextureSubresource = extern struct {
    pData: PVoid = null,
    Stride: Uint64 = 0,
    DepthStride: Uint64 = 0,
};
pub const MappedTextureSubresource = struct_MappedTextureSubresource;
pub const STATE_TRANSITION_FLAGS = Uint8;
pub const struct_StateTransitionDesc = extern struct {
    pResourceBefore: [*c]IDeviceObject = null,
    pResource: [*c]IDeviceObject = null,
    FirstMipLevel: Uint32 = 0,
    MipLevelsCount: Uint32 = 0,
    FirstArraySlice: Uint32 = 0,
    ArraySliceCount: Uint32 = 0,
    OldState: RESOURCE_STATE = 0,
    NewState: RESOURCE_STATE = 0,
    TransitionType: STATE_TRANSITION_TYPE = 0,
    Flags: STATE_TRANSITION_FLAGS = 0,
};
pub const StateTransitionDesc = struct_StateTransitionDesc;
pub const struct_ResolveTextureSubresourceAttribs = extern struct {
    SrcMipLevel: Uint32 = 0,
    SrcSlice: Uint32 = 0,
    SrcTextureTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    DstMipLevel: Uint32 = 0,
    DstSlice: Uint32 = 0,
    DstTextureTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    Format: TEXTURE_FORMAT = 0,
};
pub const ResolveTextureSubresourceAttribs = struct_ResolveTextureSubresourceAttribs;
pub const struct_ScratchBufferSizes = extern struct {
    Build: Uint64 = 0,
    Update: Uint64 = 0,
};
pub const ScratchBufferSizes = struct_ScratchBufferSizes;
pub const struct_IBottomLevelASMethods = extern struct {
    GetGeometryDescIndex: ?*const fn ([*c]struct_IBottomLevelAS, Name: [*c]const Char) callconv(.c) Uint32 = null,
    GetGeometryIndex: ?*const fn ([*c]struct_IBottomLevelAS, Name: [*c]const Char) callconv(.c) Uint32 = null,
    GetActualGeometryCount: ?*const fn ([*c]struct_IBottomLevelAS) callconv(.c) Uint32 = null,
    GetScratchBufferSizes: ?*const fn ([*c]struct_IBottomLevelAS) callconv(.c) [*c]const ScratchBufferSizes = null,
    GetNativeHandle: ?*const fn ([*c]struct_IBottomLevelAS) callconv(.c) Uint64 = null,
    SetState: ?*const fn ([*c]struct_IBottomLevelAS, State: RESOURCE_STATE) callconv(.c) void = null,
    GetState: ?*const fn ([*c]struct_IBottomLevelAS) callconv(.c) RESOURCE_STATE = null,
};
pub const IBottomLevelASMethods = struct_IBottomLevelASMethods;
pub const struct_IBottomLevelASVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    BottomLevelAS: IBottomLevelASMethods = @import("std").mem.zeroes(IBottomLevelASMethods),
};
pub const struct_IBottomLevelAS = extern struct {
    pVtbl: [*c]struct_IBottomLevelASVtbl = null,
};
pub const IBottomLevelAS = struct_IBottomLevelAS;
pub const RAYTRACING_GEOMETRY_FLAGS = Uint8;
pub const struct_BLASBuildTriangleData = extern struct {
    GeometryName: [*c]const Char = null,
    pVertexBuffer: [*c]IBuffer = null,
    VertexOffset: Uint64 = 0,
    VertexStride: Uint32 = 0,
    VertexCount: Uint32 = 0,
    VertexValueType: VALUE_TYPE = 0,
    VertexComponentCount: Uint8 = 0,
    PrimitiveCount: Uint32 = 0,
    pIndexBuffer: [*c]IBuffer = null,
    IndexOffset: Uint64 = 0,
    IndexType: VALUE_TYPE = 0,
    pTransformBuffer: [*c]IBuffer = null,
    TransformBufferOffset: Uint64 = 0,
    Flags: RAYTRACING_GEOMETRY_FLAGS = 0,
};
pub const BLASBuildTriangleData = struct_BLASBuildTriangleData;
pub const struct_BLASBuildBoundingBoxData = extern struct {
    GeometryName: [*c]const Char = null,
    pBoxBuffer: [*c]IBuffer = null,
    BoxOffset: Uint64 = 0,
    BoxStride: Uint32 = 0,
    BoxCount: Uint32 = 0,
    Flags: RAYTRACING_GEOMETRY_FLAGS = 0,
};
pub const BLASBuildBoundingBoxData = struct_BLASBuildBoundingBoxData;
pub const struct_BuildBLASAttribs = extern struct {
    pBLAS: [*c]IBottomLevelAS = null,
    BLASTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    GeometryTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pTriangleData: [*c]const BLASBuildTriangleData = null,
    TriangleDataCount: Uint32 = 0,
    pBoxData: [*c]const BLASBuildBoundingBoxData = null,
    BoxDataCount: Uint32 = 0,
    pScratchBuffer: [*c]IBuffer = null,
    ScratchBufferOffset: Uint64 = 0,
    ScratchBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    Update: Bool = false,
};
pub const BuildBLASAttribs = struct_BuildBLASAttribs;
pub const struct_TLASInstanceDesc = extern struct {
    ContributionToHitGroupIndex: Uint32 = 0,
    InstanceIndex: Uint32 = 0,
    pBLAS: [*c]IBottomLevelAS = null,
};
pub const TLASInstanceDesc = struct_TLASInstanceDesc;
pub const HIT_GROUP_BINDING_MODE = Uint8;
pub const struct_TLASBuildInfo = extern struct {
    InstanceCount: Uint32 = 0,
    HitGroupStride: Uint32 = 0,
    BindingMode: HIT_GROUP_BINDING_MODE = 0,
    FirstContributionToHitGroupIndex: Uint32 = 0,
    LastContributionToHitGroupIndex: Uint32 = 0,
};
pub const TLASBuildInfo = struct_TLASBuildInfo;
pub const struct_ITopLevelASMethods = extern struct {
    GetInstanceDesc: ?*const fn ([*c]struct_ITopLevelAS, Name: [*c]const Char, Desc: [*c]TLASInstanceDesc) callconv(.c) Bool = null,
    GetBuildInfo: ?*const fn ([*c]struct_ITopLevelAS) callconv(.c) [*c]const TLASBuildInfo = null,
    GetScratchBufferSizes: ?*const fn ([*c]struct_ITopLevelAS) callconv(.c) [*c]const ScratchBufferSizes = null,
    GetNativeHandle: ?*const fn ([*c]struct_ITopLevelAS) callconv(.c) Uint64 = null,
    SetState: ?*const fn ([*c]struct_ITopLevelAS, State: RESOURCE_STATE) callconv(.c) void = null,
    GetState: ?*const fn ([*c]struct_ITopLevelAS) callconv(.c) RESOURCE_STATE = null,
};
pub const ITopLevelASMethods = struct_ITopLevelASMethods;
pub const struct_ITopLevelASVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    TopLevelAS: ITopLevelASMethods = @import("std").mem.zeroes(ITopLevelASMethods),
};
pub const struct_ITopLevelAS = extern struct {
    pVtbl: [*c]struct_ITopLevelASVtbl = null,
};
pub const ITopLevelAS = struct_ITopLevelAS;
pub const struct_InstanceMatrix = extern struct {
    data: [3][4]f32 = @import("std").mem.zeroes([3][4]f32),
};
pub const InstanceMatrix = struct_InstanceMatrix;
pub const RAYTRACING_INSTANCE_FLAGS = Uint8;
pub const struct_TLASBuildInstanceData = extern struct {
    InstanceName: [*c]const Char = null,
    pBLAS: [*c]IBottomLevelAS = null,
    Transform: InstanceMatrix = @import("std").mem.zeroes(InstanceMatrix),
    CustomId: Uint32 = 0,
    Flags: RAYTRACING_INSTANCE_FLAGS = 0,
    Mask: Uint8 = 0,
    ContributionToHitGroupIndex: Uint32 = 0,
};
pub const TLASBuildInstanceData = struct_TLASBuildInstanceData;
pub const struct_BuildTLASAttribs = extern struct {
    pTLAS: [*c]ITopLevelAS = null,
    TLASTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    BLASTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    pInstances: [*c]const TLASBuildInstanceData = null,
    InstanceCount: Uint32 = 0,
    pInstanceBuffer: [*c]IBuffer = null,
    InstanceBufferOffset: Uint64 = 0,
    InstanceBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    HitGroupStride: Uint32 = 0,
    BaseContributionToHitGroupIndex: Uint32 = 0,
    BindingMode: HIT_GROUP_BINDING_MODE = 0,
    pScratchBuffer: [*c]IBuffer = null,
    ScratchBufferOffset: Uint64 = 0,
    ScratchBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    Update: Bool = false,
};
pub const BuildTLASAttribs = struct_BuildTLASAttribs;
pub const COPY_AS_MODE = Uint8;
pub const struct_CopyBLASAttribs = extern struct {
    pSrc: [*c]IBottomLevelAS = null,
    pDst: [*c]IBottomLevelAS = null,
    Mode: COPY_AS_MODE = 0,
    SrcTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    DstTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const CopyBLASAttribs = struct_CopyBLASAttribs;
pub const struct_CopyTLASAttribs = extern struct {
    pSrc: [*c]ITopLevelAS = null,
    pDst: [*c]ITopLevelAS = null,
    Mode: COPY_AS_MODE = 0,
    SrcTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    DstTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const CopyTLASAttribs = struct_CopyTLASAttribs;
pub const struct_WriteBLASCompactedSizeAttribs = extern struct {
    pBLAS: [*c]IBottomLevelAS = null,
    pDestBuffer: [*c]IBuffer = null,
    DestBufferOffset: Uint64 = 0,
    BLASTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    BufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const WriteBLASCompactedSizeAttribs = struct_WriteBLASCompactedSizeAttribs;
pub const struct_WriteTLASCompactedSizeAttribs = extern struct {
    pTLAS: [*c]ITopLevelAS = null,
    pDestBuffer: [*c]IBuffer = null,
    DestBufferOffset: Uint64 = 0,
    TLASTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    BufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const WriteTLASCompactedSizeAttribs = struct_WriteTLASCompactedSizeAttribs;
pub const VERIFY_SBT_FLAGS = Uint32;
pub const struct_IShaderBindingTableMethods = extern struct {
    Verify: ?*const fn ([*c]struct_IShaderBindingTable, Flags: VERIFY_SBT_FLAGS) callconv(.c) Bool = null,
    Reset: ?*const fn ([*c]struct_IShaderBindingTable, pPSO: [*c]IPipelineState) callconv(.c) void = null,
    ResetHitGroups: ?*const fn ([*c]struct_IShaderBindingTable) callconv(.c) void = null,
    BindRayGenShader: ?*const fn ([*c]struct_IShaderBindingTable, pShaderGroupName: [*c]const Char, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindMissShader: ?*const fn ([*c]struct_IShaderBindingTable, pShaderGroupName: [*c]const Char, MissIndex: Uint32, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindHitGroupForGeometry: ?*const fn ([*c]struct_IShaderBindingTable, pTLAS: [*c]ITopLevelAS, pInstanceName: [*c]const Char, pGeometryName: [*c]const Char, RayOffsetInHitGroupIndex: Uint32, pShaderGroupName: [*c]const Char, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindHitGroupByIndex: ?*const fn ([*c]struct_IShaderBindingTable, BindingIndex: Uint32, pShaderGroupName: [*c]const Char, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindHitGroupForInstance: ?*const fn ([*c]struct_IShaderBindingTable, pTLAS: [*c]ITopLevelAS, pInstanceName: [*c]const Char, RayOffsetInHitGroupIndex: Uint32, pShaderGroupName: [*c]const Char, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindHitGroupForTLAS: ?*const fn ([*c]struct_IShaderBindingTable, pTLAS: [*c]ITopLevelAS, RayOffsetInHitGroupIndex: Uint32, pShaderGroupName: [*c]const Char, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
    BindCallableShader: ?*const fn ([*c]struct_IShaderBindingTable, pShaderGroupName: [*c]const Char, CallableIndex: Uint32, pData: ?*const anyopaque, DataSize: Uint32) callconv(.c) void = null,
};
pub const IShaderBindingTableMethods = struct_IShaderBindingTableMethods;
pub const struct_IShaderBindingTableVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    ShaderBindingTable: IShaderBindingTableMethods = @import("std").mem.zeroes(IShaderBindingTableMethods),
};
pub const struct_IShaderBindingTable = extern struct {
    pVtbl: [*c]struct_IShaderBindingTableVtbl = null,
};
pub const IShaderBindingTable = struct_IShaderBindingTable;
pub const struct_TraceRaysAttribs = extern struct {
    pSBT: [*c]const IShaderBindingTable = null,
    DimensionX: Uint32 = 0,
    DimensionY: Uint32 = 0,
    DimensionZ: Uint32 = 0,
};
pub const TraceRaysAttribs = struct_TraceRaysAttribs;
pub const struct_TraceRaysIndirectAttribs = extern struct {
    pSBT: [*c]const IShaderBindingTable = null,
    pAttribsBuffer: [*c]IBuffer = null,
    AttribsBufferStateTransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
    ArgsByteOffset: Uint64 = 0,
};
pub const TraceRaysIndirectAttribs = struct_TraceRaysIndirectAttribs;
pub const struct_UpdateIndirectRTBufferAttribs = extern struct {
    pAttribsBuffer: [*c]IBuffer = null,
    AttribsBufferOffset: Uint64 = 0,
    TransitionMode: RESOURCE_STATE_TRANSITION_MODE = 0,
};
pub const UpdateIndirectRTBufferAttribs = struct_UpdateIndirectRTBufferAttribs;
pub const struct_ICommandQueueMethods = extern struct {
    GetNextFenceValue: ?*const fn ([*c]struct_ICommandQueue) callconv(.c) Uint64 = null,
    GetCompletedFenceValue: ?*const fn ([*c]struct_ICommandQueue) callconv(.c) Uint64 = null,
    WaitForIdle: ?*const fn ([*c]struct_ICommandQueue) callconv(.c) Uint64 = null,
};
pub const ICommandQueueMethods = struct_ICommandQueueMethods;
pub const struct_ICommandQueueVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    CommandQueue: ICommandQueueMethods = @import("std").mem.zeroes(ICommandQueueMethods),
};
pub const struct_ICommandQueue = extern struct {
    pVtbl: [*c]struct_ICommandQueueVtbl = null,
};
pub const ICommandQueue = struct_ICommandQueue;
pub const struct_IDeviceMemoryMethods = extern struct {
    Resize: ?*const fn ([*c]struct_IDeviceMemory, NewSize: Uint64) callconv(.c) Bool = null,
    GetCapacity: ?*const fn ([*c]struct_IDeviceMemory) callconv(.c) Uint64 = null,
    IsCompatible: ?*const fn ([*c]struct_IDeviceMemory, pResource: [*c]IDeviceObject) callconv(.c) Bool = null,
};
pub const IDeviceMemoryMethods = struct_IDeviceMemoryMethods;
pub const struct_IDeviceMemoryVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    DeviceMemory: IDeviceMemoryMethods = @import("std").mem.zeroes(IDeviceMemoryMethods),
};
pub const struct_IDeviceMemory = extern struct {
    pVtbl: [*c]struct_IDeviceMemoryVtbl = null,
};
pub const IDeviceMemory = struct_IDeviceMemory;
pub const struct_SparseBufferMemoryBindRange = extern struct {
    BufferOffset: Uint64 = 0,
    MemoryOffset: Uint64 = 0,
    MemorySize: Uint64 = 0,
    pMemory: [*c]IDeviceMemory = null,
};
pub const SparseBufferMemoryBindRange = struct_SparseBufferMemoryBindRange;
pub const struct_SparseBufferMemoryBindInfo = extern struct {
    pBuffer: [*c]IBuffer = null,
    pRanges: [*c]const SparseBufferMemoryBindRange = null,
    NumRanges: Uint32 = 0,
};
pub const SparseBufferMemoryBindInfo = struct_SparseBufferMemoryBindInfo;
pub const struct_SparseTextureMemoryBindRange = extern struct {
    MipLevel: Uint32 = 0,
    ArraySlice: Uint32 = 0,
    Region: Box = @import("std").mem.zeroes(Box),
    OffsetInMipTail: Uint64 = 0,
    MemorySize: Uint64 = 0,
    MemoryOffset: Uint64 = 0,
    pMemory: [*c]IDeviceMemory = null,
};
pub const SparseTextureMemoryBindRange = struct_SparseTextureMemoryBindRange;
pub const struct_SparseTextureMemoryBindInfo = extern struct {
    pTexture: [*c]ITexture = null,
    pRanges: [*c]const SparseTextureMemoryBindRange = null,
    NumRanges: Uint32 = 0,
};
pub const SparseTextureMemoryBindInfo = struct_SparseTextureMemoryBindInfo;
pub const struct_BindSparseResourceMemoryAttribs = extern struct {
    pBufferBinds: [*c]const SparseBufferMemoryBindInfo = null,
    NumBufferBinds: Uint32 = 0,
    pTextureBinds: [*c]const SparseTextureMemoryBindInfo = null,
    NumTextureBinds: Uint32 = 0,
    ppWaitFences: [*c][*c]IFence = null,
    pWaitFenceValues: [*c]const Uint64 = null,
    NumWaitFences: Uint32 = 0,
    ppSignalFences: [*c][*c]IFence = null,
    pSignalFenceValues: [*c]const Uint64 = null,
    NumSignalFences: Uint32 = 0,
};
pub const BindSparseResourceMemoryAttribs = struct_BindSparseResourceMemoryAttribs;
pub const struct_DeviceContextCommandCounters = extern struct {
    SetPipelineState: Uint32 = 0,
    CommitShaderResources: Uint32 = 0,
    SetVertexBuffers: Uint32 = 0,
    SetIndexBuffer: Uint32 = 0,
    SetRenderTargets: Uint32 = 0,
    SetBlendFactors: Uint32 = 0,
    SetStencilRef: Uint32 = 0,
    SetViewports: Uint32 = 0,
    SetScissorRects: Uint32 = 0,
    ClearRenderTarget: Uint32 = 0,
    ClearDepthStencil: Uint32 = 0,
    Draw: Uint32 = 0,
    DrawIndexed: Uint32 = 0,
    DrawIndirect: Uint32 = 0,
    DrawIndexedIndirect: Uint32 = 0,
    MultiDraw: Uint32 = 0,
    MultiDrawIndexed: Uint32 = 0,
    DispatchCompute: Uint32 = 0,
    DispatchComputeIndirect: Uint32 = 0,
    DispatchTile: Uint32 = 0,
    DrawMesh: Uint32 = 0,
    DrawMeshIndirect: Uint32 = 0,
    BuildBLAS: Uint32 = 0,
    BuildTLAS: Uint32 = 0,
    CopyBLAS: Uint32 = 0,
    CopyTLAS: Uint32 = 0,
    WriteBLASCompactedSize: Uint32 = 0,
    WriteTLASCompactedSize: Uint32 = 0,
    TraceRays: Uint32 = 0,
    TraceRaysIndirect: Uint32 = 0,
    UpdateSBT: Uint32 = 0,
    UpdateBuffer: Uint32 = 0,
    CopyBuffer: Uint32 = 0,
    MapBuffer: Uint32 = 0,
    UpdateTexture: Uint32 = 0,
    CopyTexture: Uint32 = 0,
    MapTextureSubresource: Uint32 = 0,
    BeginQuery: Uint32 = 0,
    GenerateMips: Uint32 = 0,
    ResolveTextureSubresource: Uint32 = 0,
    BindSparseResourceMemory: Uint32 = 0,
};
pub const DeviceContextCommandCounters = struct_DeviceContextCommandCounters;
pub const struct_DeviceContextStats = extern struct {
    PrimitiveCounts: [42]Uint32 = @import("std").mem.zeroes([42]Uint32),
    CommandCounters: DeviceContextCommandCounters = @import("std").mem.zeroes(DeviceContextCommandCounters),
};
pub const DeviceContextStats = struct_DeviceContextStats;
pub const struct_IDeviceContextMethods = extern struct {
    GetDesc: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) [*c]const DeviceContextDesc = null,
    Begin: ?*const fn ([*c]struct_IDeviceContext, ImmediateContextId: Uint32) callconv(.c) void = null,
    SetPipelineState: ?*const fn ([*c]struct_IDeviceContext, pPipelineState: [*c]IPipelineState) callconv(.c) void = null,
    TransitionShaderResources: ?*const fn ([*c]struct_IDeviceContext, pShaderResourceBinding: [*c]IShaderResourceBinding) callconv(.c) void = null,
    CommitShaderResources: ?*const fn ([*c]struct_IDeviceContext, pShaderResourceBinding: [*c]IShaderResourceBinding, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    SetStencilRef: ?*const fn ([*c]struct_IDeviceContext, StencilRef: Uint32) callconv(.c) void = null,
    SetBlendFactors: ?*const fn ([*c]struct_IDeviceContext, pBlendFactors: [*c]const f32) callconv(.c) void = null,
    SetVertexBuffers: ?*const fn ([*c]struct_IDeviceContext, StartSlot: Uint32, NumBuffersSet: Uint32, ppBuffers: [*c]const [*c]IBuffer, pOffsets: [*c]const Uint64, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE, Flags: SET_VERTEX_BUFFERS_FLAGS) callconv(.c) void = null,
    InvalidateState: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    SetIndexBuffer: ?*const fn ([*c]struct_IDeviceContext, pIndexBuffer: [*c]IBuffer, ByteOffset: Uint64, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    SetViewports: ?*const fn ([*c]struct_IDeviceContext, NumViewports: Uint32, pViewports: [*c]const Viewport, RTWidth: Uint32, RTHeight: Uint32) callconv(.c) void = null,
    SetScissorRects: ?*const fn ([*c]struct_IDeviceContext, NumRects: Uint32, pRects: [*c]const Rect, RTWidth: Uint32, RTHeight: Uint32) callconv(.c) void = null,
    SetRenderTargets: ?*const fn ([*c]struct_IDeviceContext, NumRenderTargets: Uint32, ppRenderTargets: [*c][*c]ITextureView, pDepthStencil: [*c]ITextureView, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    SetRenderTargetsExt: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const SetRenderTargetsAttribs) callconv(.c) void = null,
    BeginRenderPass: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const BeginRenderPassAttribs) callconv(.c) void = null,
    NextSubpass: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    EndRenderPass: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    Draw: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawAttribs) callconv(.c) void = null,
    DrawIndexed: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawIndexedAttribs) callconv(.c) void = null,
    DrawIndirect: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawIndirectAttribs) callconv(.c) void = null,
    DrawIndexedIndirect: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawIndexedIndirectAttribs) callconv(.c) void = null,
    DrawMesh: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawMeshAttribs) callconv(.c) void = null,
    DrawMeshIndirect: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DrawMeshIndirectAttribs) callconv(.c) void = null,
    MultiDraw: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const MultiDrawAttribs) callconv(.c) void = null,
    MultiDrawIndexed: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const MultiDrawIndexedAttribs) callconv(.c) void = null,
    DispatchCompute: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DispatchComputeAttribs) callconv(.c) void = null,
    DispatchComputeIndirect: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DispatchComputeIndirectAttribs) callconv(.c) void = null,
    DispatchTile: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const DispatchTileAttribs) callconv(.c) void = null,
    GetTileSize: ?*const fn ([*c]struct_IDeviceContext, TileSizeX: [*c]Uint32, TileSizeY: [*c]Uint32) callconv(.c) void = null,
    ClearDepthStencil: ?*const fn ([*c]struct_IDeviceContext, pView: [*c]ITextureView, ClearFlags: CLEAR_DEPTH_STENCIL_FLAGS, fDepth: f32, Stencil: Uint8, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    ClearRenderTarget: ?*const fn ([*c]struct_IDeviceContext, pView: [*c]ITextureView, RGBA: ?*const anyopaque, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    FinishCommandList: ?*const fn ([*c]struct_IDeviceContext, ppCommandList: [*c][*c]ICommandList) callconv(.c) void = null,
    ExecuteCommandLists: ?*const fn ([*c]struct_IDeviceContext, NumCommandLists: Uint32, ppCommandLists: [*c]const [*c]ICommandList) callconv(.c) void = null,
    EnqueueSignal: ?*const fn ([*c]struct_IDeviceContext, pFence: [*c]IFence, Value: Uint64) callconv(.c) void = null,
    DeviceWaitForFence: ?*const fn ([*c]struct_IDeviceContext, pFence: [*c]IFence, Value: Uint64) callconv(.c) void = null,
    WaitForIdle: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    BeginQuery: ?*const fn ([*c]struct_IDeviceContext, pQuery: [*c]IQuery) callconv(.c) void = null,
    EndQuery: ?*const fn ([*c]struct_IDeviceContext, pQuery: [*c]IQuery) callconv(.c) void = null,
    Flush: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    UpdateBuffer: ?*const fn ([*c]struct_IDeviceContext, pBuffer: [*c]IBuffer, Offset: Uint64, Size: Uint64, pData: ?*const anyopaque, StateTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    CopyBuffer: ?*const fn ([*c]struct_IDeviceContext, pSrcBuffer: [*c]IBuffer, SrcOffset: Uint64, SrcBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE, pDstBuffer: [*c]IBuffer, DstOffset: Uint64, Size: Uint64, DstBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    MapBuffer: ?*const fn ([*c]struct_IDeviceContext, pBuffer: [*c]IBuffer, MapType: MAP_TYPE, MapFlags: MAP_FLAGS, pMappedData: [*c]PVoid) callconv(.c) void = null,
    UnmapBuffer: ?*const fn ([*c]struct_IDeviceContext, pBuffer: [*c]IBuffer, MapType: MAP_TYPE) callconv(.c) void = null,
    UpdateTexture: ?*const fn ([*c]struct_IDeviceContext, pTexture: [*c]ITexture, MipLevel: Uint32, Slice: Uint32, DstBox: [*c]const Box, SubresData: [*c]const TextureSubResData, SrcBufferTransitionMode: RESOURCE_STATE_TRANSITION_MODE, TextureTransitionMode: RESOURCE_STATE_TRANSITION_MODE) callconv(.c) void = null,
    CopyTexture: ?*const fn ([*c]struct_IDeviceContext, CopyAttribs: [*c]const CopyTextureAttribs) callconv(.c) void = null,
    MapTextureSubresource: ?*const fn ([*c]struct_IDeviceContext, pTexture: [*c]ITexture, MipLevel: Uint32, ArraySlice: Uint32, MapType: MAP_TYPE, MapFlags: MAP_FLAGS, pMapRegion: [*c]const Box, MappedData: [*c]MappedTextureSubresource) callconv(.c) void = null,
    UnmapTextureSubresource: ?*const fn ([*c]struct_IDeviceContext, pTexture: [*c]ITexture, MipLevel: Uint32, ArraySlice: Uint32) callconv(.c) void = null,
    GenerateMips: ?*const fn ([*c]struct_IDeviceContext, pTextureView: [*c]ITextureView) callconv(.c) void = null,
    FinishFrame: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    GetFrameNumber: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) Uint64 = null,
    TransitionResourceStates: ?*const fn ([*c]struct_IDeviceContext, BarrierCount: Uint32, pResourceBarriers: [*c]const StateTransitionDesc) callconv(.c) void = null,
    ResolveTextureSubresource: ?*const fn ([*c]struct_IDeviceContext, pSrcTexture: [*c]ITexture, pDstTexture: [*c]ITexture, ResolveAttribs: [*c]const ResolveTextureSubresourceAttribs) callconv(.c) void = null,
    BuildBLAS: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const BuildBLASAttribs) callconv(.c) void = null,
    BuildTLAS: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const BuildTLASAttribs) callconv(.c) void = null,
    CopyBLAS: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const CopyBLASAttribs) callconv(.c) void = null,
    CopyTLAS: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const CopyTLASAttribs) callconv(.c) void = null,
    WriteBLASCompactedSize: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const WriteBLASCompactedSizeAttribs) callconv(.c) void = null,
    WriteTLASCompactedSize: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const WriteTLASCompactedSizeAttribs) callconv(.c) void = null,
    TraceRays: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const TraceRaysAttribs) callconv(.c) void = null,
    TraceRaysIndirect: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const TraceRaysIndirectAttribs) callconv(.c) void = null,
    UpdateSBT: ?*const fn ([*c]struct_IDeviceContext, pSBT: [*c]IShaderBindingTable, pUpdateIndirectBufferAttribs: [*c]const UpdateIndirectRTBufferAttribs) callconv(.c) void = null,
    SetUserData: ?*const fn ([*c]struct_IDeviceContext, pUserData: [*c]IObject) callconv(.c) void = null,
    GetUserData: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) [*c]IObject = null,
    BeginDebugGroup: ?*const fn ([*c]struct_IDeviceContext, Name: [*c]const Char, pColor: [*c]const f32) callconv(.c) void = null,
    EndDebugGroup: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    InsertDebugLabel: ?*const fn ([*c]struct_IDeviceContext, Label: [*c]const Char, pColor: [*c]const f32) callconv(.c) void = null,
    LockCommandQueue: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) [*c]ICommandQueue = null,
    UnlockCommandQueue: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    SetShadingRate: ?*const fn ([*c]struct_IDeviceContext, BaseRate: SHADING_RATE, PrimitiveCombiner: SHADING_RATE_COMBINER, TextureCombiner: SHADING_RATE_COMBINER) callconv(.c) void = null,
    BindSparseResourceMemory: ?*const fn ([*c]struct_IDeviceContext, Attribs: [*c]const BindSparseResourceMemoryAttribs) callconv(.c) void = null,
    ClearStats: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) void = null,
    GetStats: ?*const fn ([*c]struct_IDeviceContext) callconv(.c) [*c]const DeviceContextStats = null,
};
pub const IDeviceContextMethods = struct_IDeviceContextMethods;
pub const struct_IDeviceContextVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceContext: IDeviceContextMethods = @import("std").mem.zeroes(IDeviceContextMethods),
};
pub const struct_IDeviceContext = extern struct {
    pVtbl: [*c]struct_IDeviceContextVtbl = null,
};
pub const struct_BufferData = extern struct {
    pData: ?*const anyopaque = null,
    DataSize: Uint64 = 0,
    pContext: [*c]struct_IDeviceContext = null,
};
pub const BufferData = struct_BufferData;
pub const IBufferVtbl = struct_IBufferVtbl;
pub const MAX_LAYOUT_ELEMENTS: Uint32 = DILIGENT_MAX_LAYOUT_ELEMENTS;
pub const LAYOUT_ELEMENT_AUTO_OFFSET: Uint32 = DILIGENT_LAYOUT_ELEMENT_AUTO_OFFSET;
pub const LAYOUT_ELEMENT_AUTO_STRIDE: Uint32 = DILIGENT_LAYOUT_ELEMENT_AUTO_STRIDE;
pub const INPUT_ELEMENT_FREQUENCY_UNDEFINED: c_int = 0;
pub const INPUT_ELEMENT_FREQUENCY_PER_VERTEX: c_int = 1;
pub const INPUT_ELEMENT_FREQUENCY_PER_INSTANCE: c_int = 2;
pub const INPUT_ELEMENT_FREQUENCY_NUM_FREQUENCIES: c_int = 3;
pub const enum__INPUT_ELEMENT_FREQUENCY = c_uint;
pub const IID_DataBlob: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 4118347533,
    .Data2 = 43986,
    .Data3 = 17684,
    .Data4 = [8]Uint8{
        157,
        50,
        124,
        180,
        84,
        212,
        167,
        59,
    },
};
pub const struct_IDataBlobMethods = extern struct {
    Resize: ?*const fn ([*c]struct_IDataBlob, NewSize: usize) callconv(.c) void = null,
    GetSize: ?*const fn ([*c]struct_IDataBlob) callconv(.c) usize = null,
    GetDataPtr: ?*const fn ([*c]struct_IDataBlob, Offset: usize) callconv(.c) ?*anyopaque = null,
    GetConstDataPtr: ?*const fn ([*c]struct_IDataBlob, Offset: usize) callconv(.c) ?*const anyopaque = null,
};
pub const IDataBlobMethods = struct_IDataBlobMethods;
pub const struct_IDataBlobVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DataBlob: IDataBlobMethods = @import("std").mem.zeroes(IDataBlobMethods),
};
pub const struct_IDataBlob = extern struct {
    pVtbl: [*c]struct_IDataBlobVtbl = null,
};
pub const IDataBlob = struct_IDataBlob;
pub const IDataBlobVtbl = struct_IDataBlobVtbl;
pub const IID_FileStream: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 3867097196,
    .Data2 = 27226,
    .Data3 = 18980,
    .Data4 = [8]Uint8{
        160,
        206,
        198,
        100,
        53,
        70,
        93,
        65,
    },
};
pub const struct_IFileStreamMethods = extern struct {
    Read: ?*const fn ([*c]struct_IFileStream, Data: ?*anyopaque, BufferSize: usize) callconv(.c) bool = null,
    ReadBlob: ?*const fn ([*c]struct_IFileStream, pData: [*c]IDataBlob) callconv(.c) void = null,
    Write: ?*const fn ([*c]struct_IFileStream, Data: ?*const anyopaque, Size: usize) callconv(.c) bool = null,
    GetSize: ?*const fn ([*c]struct_IFileStream) callconv(.c) usize = null,
    GetPos: ?*const fn ([*c]struct_IFileStream) callconv(.c) usize = null,
    SetPos: ?*const fn ([*c]struct_IFileStream, Offset: usize, Origin: c_int) callconv(.c) bool = null,
    IsValid: ?*const fn ([*c]struct_IFileStream) callconv(.c) bool = null,
};
pub const IFileStreamMethods = struct_IFileStreamMethods;
pub const struct_IFileStreamVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    FileStream: IFileStreamMethods = @import("std").mem.zeroes(IFileStreamMethods),
};
pub const struct_IFileStream = extern struct {
    pVtbl: [*c]struct_IFileStreamVtbl = null,
};
pub const IFileStream = struct_IFileStream;
pub const IFileStreamVtbl = struct_IFileStreamVtbl;
pub const IID_Shader: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 696890460,
    .Data2 = 5181,
    .Data3 = 18566,
    .Data4 = [8]Uint8{
        184,
        156,
        195,
        39,
        28,
        45,
        204,
        93,
    },
};
pub const ShaderVersion = struct_Version;
pub const SHADER_SOURCE_LANGUAGE = Uint32;
pub const SHADER_SOURCE_LANGUAGE_DEFAULT: c_int = 0;
pub const SHADER_SOURCE_LANGUAGE_HLSL: c_int = 1;
pub const SHADER_SOURCE_LANGUAGE_GLSL: c_int = 2;
pub const SHADER_SOURCE_LANGUAGE_GLSL_VERBATIM: c_int = 3;
pub const SHADER_SOURCE_LANGUAGE_MSL: c_int = 4;
pub const SHADER_SOURCE_LANGUAGE_MSL_VERBATIM: c_int = 5;
pub const SHADER_SOURCE_LANGUAGE_MTLB: c_int = 6;
pub const SHADER_SOURCE_LANGUAGE_WGSL: c_int = 7;
pub const SHADER_SOURCE_LANGUAGE_BYTECODE: c_int = 8;
pub const SHADER_SOURCE_LANGUAGE_COUNT: c_int = 9;
pub const enum__SHADER_SOURCE_LANGUAGE = c_uint;
pub const SHADER_COMPILER = Uint32;
pub const SHADER_COMPILER_DEFAULT: c_int = 0;
pub const SHADER_COMPILER_GLSLANG: c_int = 1;
pub const SHADER_COMPILER_DXC: c_int = 2;
pub const SHADER_COMPILER_FXC: c_int = 3;
pub const SHADER_COMPILER_LAST: c_int = 3;
pub const SHADER_COMPILER_COUNT: c_int = 4;
pub const enum__SHADER_COMPILER = c_uint;
pub const CREATE_SHADER_SOURCE_INPUT_STREAM_FLAGS = Uint32;
pub const CREATE_SHADER_SOURCE_INPUT_STREAM_FLAG_NONE: c_int = 0;
pub const CREATE_SHADER_SOURCE_INPUT_STREAM_FLAG_SILENT: c_int = 1;
pub const enum__CREATE_SHADER_SOURCE_INPUT_STREAM_FLAGS = c_uint;
pub const struct_ShaderDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    ShaderType: SHADER_TYPE = 0,
    UseCombinedTextureSamplers: Bool = false,
    CombinedSamplerSuffix: [*c]const Char = null,
};
pub const ShaderDesc = struct_ShaderDesc;
pub const SHADER_STATUS = Uint32;
pub const SHADER_STATUS_UNINITIALIZED: c_int = 0;
pub const SHADER_STATUS_COMPILING: c_int = 1;
pub const SHADER_STATUS_READY: c_int = 2;
pub const SHADER_STATUS_FAILED: c_int = 3;
pub const enum__SHADER_STATUS = c_uint;
pub const IID_IShaderSourceInputStreamFactory: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1051297665,
    .Data2 = 2095,
    .Data3 = 17427,
    .Data4 = [8]Uint8{
        140,
        48,
        185,
        186,
        109,
        130,
        219,
        183,
    },
};
pub const struct_IShaderSourceInputStreamFactoryMethods = extern struct {
    CreateInputStream: ?*const fn ([*c]struct_IShaderSourceInputStreamFactory, Name: [*c]const Char, ppStream: [*c][*c]IFileStream) callconv(.c) Bool = null,
    CreateInputStream2: ?*const fn ([*c]struct_IShaderSourceInputStreamFactory, Name: [*c]const Char, Flags: CREATE_SHADER_SOURCE_INPUT_STREAM_FLAGS, ppStream: [*c][*c]IFileStream) callconv(.c) Bool = null,
};
pub const IShaderSourceInputStreamFactoryMethods = struct_IShaderSourceInputStreamFactoryMethods;
pub const struct_IShaderSourceInputStreamFactoryVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    ShaderSourceInputStreamFactory: IShaderSourceInputStreamFactoryMethods = @import("std").mem.zeroes(IShaderSourceInputStreamFactoryMethods),
};
pub const struct_IShaderSourceInputStreamFactory = extern struct {
    pVtbl: [*c]struct_IShaderSourceInputStreamFactoryVtbl = null,
};
pub const IShaderSourceInputStreamFactory = struct_IShaderSourceInputStreamFactory;
pub const IShaderSourceInputStreamFactoryVtbl = struct_IShaderSourceInputStreamFactoryVtbl;
pub const struct_ShaderMacro = extern struct {
    Name: [*c]const Char = null,
    Definition: [*c]const Char = null,
};
pub const ShaderMacro = struct_ShaderMacro;
pub const struct_ShaderMacroArray = extern struct {
    Elements: [*c]const ShaderMacro = null,
    Count: Uint32 = 0,
};
pub const ShaderMacroArray = struct_ShaderMacroArray;
pub const SHADER_COMPILE_FLAGS = Uint32;
pub const SHADER_COMPILE_FLAG_NONE: c_int = 0;
pub const SHADER_COMPILE_FLAG_ENABLE_UNBOUNDED_ARRAYS: c_int = 1;
pub const SHADER_COMPILE_FLAG_SKIP_REFLECTION: c_int = 2;
pub const SHADER_COMPILE_FLAG_ASYNCHRONOUS: c_int = 4;
pub const SHADER_COMPILE_FLAG_PACK_MATRIX_ROW_MAJOR: c_int = 8;
pub const SHADER_COMPILE_FLAG_HLSL_TO_SPIRV_VIA_GLSL: c_int = 16;
pub const SHADER_COMPILE_FLAG_LAST: c_int = 16;
pub const enum__SHADER_COMPILE_FLAGS = c_uint;
pub const SHADER_OPTIMIZATION_LEVEL = Uint8;
pub const SHADER_OPTIMIZATION_LEVEL_DEFAULT: c_int = 0;
pub const SHADER_OPTIMIZATION_LEVEL_DISABLED: c_int = 1;
pub const SHADER_OPTIMIZATION_LEVEL_0: c_int = 2;
pub const SHADER_OPTIMIZATION_LEVEL_1: c_int = 3;
pub const SHADER_OPTIMIZATION_LEVEL_2: c_int = 4;
pub const SHADER_OPTIMIZATION_LEVEL_3: c_int = 5;
pub const SHADER_OPTIMIZATION_LEVEL_COUNT: c_int = 6;
pub const enum__SHADER_OPTIMIZATION_LEVEL = c_uint;
const union_unnamed_3 = extern union {
    SourceLength: usize,
    ByteCodeSize: usize,
};
pub const struct_ShaderCreateInfo = extern struct {
    FilePath: [*c]const Char = null,
    pShaderSourceStreamFactory: [*c]IShaderSourceInputStreamFactory = null,
    Source: [*c]const Char = null,
    ByteCode: ?*const anyopaque = null,
    unnamed_0: union_unnamed_3 = @import("std").mem.zeroes(union_unnamed_3),
    EntryPoint: [*c]const Char = null,
    Macros: ShaderMacroArray = @import("std").mem.zeroes(ShaderMacroArray),
    Desc: ShaderDesc = @import("std").mem.zeroes(ShaderDesc),
    SourceLanguage: SHADER_SOURCE_LANGUAGE = 0,
    ShaderCompiler: SHADER_COMPILER = 0,
    HLSLVersion: ShaderVersion = @import("std").mem.zeroes(ShaderVersion),
    GLSLVersion: ShaderVersion = @import("std").mem.zeroes(ShaderVersion),
    GLESSLVersion: ShaderVersion = @import("std").mem.zeroes(ShaderVersion),
    MSLVersion: ShaderVersion = @import("std").mem.zeroes(ShaderVersion),
    CompileFlags: SHADER_COMPILE_FLAGS = 0,
    ShaderOptimizationLevel: SHADER_OPTIMIZATION_LEVEL = 0,
    LoadConstantBufferReflection: bool = false,
    GLSLExtensions: [*c]const u8 = null,
    WebGPUEmulatedArrayIndexSuffix: [*c]const u8 = null,
};
pub const ShaderCreateInfo = struct_ShaderCreateInfo;
pub const SHADER_RESOURCE_TYPE_UNKNOWN: c_int = 0;
pub const SHADER_RESOURCE_TYPE_CONSTANT_BUFFER: c_int = 1;
pub const SHADER_RESOURCE_TYPE_TEXTURE_SRV: c_int = 2;
pub const SHADER_RESOURCE_TYPE_BUFFER_SRV: c_int = 3;
pub const SHADER_RESOURCE_TYPE_TEXTURE_UAV: c_int = 4;
pub const SHADER_RESOURCE_TYPE_BUFFER_UAV: c_int = 5;
pub const SHADER_RESOURCE_TYPE_SAMPLER: c_int = 6;
pub const SHADER_RESOURCE_TYPE_INPUT_ATTACHMENT: c_int = 7;
pub const SHADER_RESOURCE_TYPE_ACCEL_STRUCT: c_int = 8;
pub const SHADER_RESOURCE_TYPE_LAST: c_int = 8;
pub const enum__SHADER_RESOURCE_TYPE = c_uint;
pub const SHADER_CODE_BASIC_TYPE = Uint8;
pub const SHADER_CODE_BASIC_TYPE_UNKNOWN: c_int = 0;
pub const SHADER_CODE_BASIC_TYPE_VOID: c_int = 1;
pub const SHADER_CODE_BASIC_TYPE_BOOL: c_int = 2;
pub const SHADER_CODE_BASIC_TYPE_INT: c_int = 3;
pub const SHADER_CODE_BASIC_TYPE_INT8: c_int = 4;
pub const SHADER_CODE_BASIC_TYPE_INT16: c_int = 5;
pub const SHADER_CODE_BASIC_TYPE_INT64: c_int = 6;
pub const SHADER_CODE_BASIC_TYPE_UINT: c_int = 7;
pub const SHADER_CODE_BASIC_TYPE_UINT8: c_int = 8;
pub const SHADER_CODE_BASIC_TYPE_UINT16: c_int = 9;
pub const SHADER_CODE_BASIC_TYPE_UINT64: c_int = 10;
pub const SHADER_CODE_BASIC_TYPE_FLOAT: c_int = 11;
pub const SHADER_CODE_BASIC_TYPE_FLOAT16: c_int = 12;
pub const SHADER_CODE_BASIC_TYPE_DOUBLE: c_int = 13;
pub const SHADER_CODE_BASIC_TYPE_MIN8FLOAT: c_int = 14;
pub const SHADER_CODE_BASIC_TYPE_MIN10FLOAT: c_int = 15;
pub const SHADER_CODE_BASIC_TYPE_MIN16FLOAT: c_int = 16;
pub const SHADER_CODE_BASIC_TYPE_MIN12INT: c_int = 17;
pub const SHADER_CODE_BASIC_TYPE_MIN16INT: c_int = 18;
pub const SHADER_CODE_BASIC_TYPE_MIN16UINT: c_int = 19;
pub const SHADER_CODE_BASIC_TYPE_STRING: c_int = 20;
pub const SHADER_CODE_BASIC_TYPE_COUNT: c_int = 21;
pub const enum__SHADER_CODE_BASIC_TYPE = c_uint;
pub const SHADER_CODE_VARIABLE_CLASS = Uint8;
pub const SHADER_CODE_VARIABLE_CLASS_UNKNOWN: c_int = 0;
pub const SHADER_CODE_VARIABLE_CLASS_SCALAR: c_int = 1;
pub const SHADER_CODE_VARIABLE_CLASS_VECTOR: c_int = 2;
pub const SHADER_CODE_VARIABLE_CLASS_MATRIX_ROWS: c_int = 3;
pub const SHADER_CODE_VARIABLE_CLASS_MATRIX_COLUMNS: c_int = 4;
pub const SHADER_CODE_VARIABLE_CLASS_STRUCT: c_int = 5;
pub const SHADER_CODE_VARIABLE_CLASS_COUNT: c_int = 6;
pub const enum__SHADER_CODE_VARIABLE_CLASS = c_uint;
pub const struct_ShaderCodeVariableDesc = extern struct {
    Name: [*c]const u8 = null,
    TypeName: [*c]const u8 = null,
    Class: SHADER_CODE_VARIABLE_CLASS = 0,
    BasicType: SHADER_CODE_BASIC_TYPE = 0,
    NumRows: Uint8 = 0,
    NumColumns: Uint8 = 0,
    Offset: Uint32 = 0,
    ArraySize: Uint32 = 0,
    NumMembers: Uint32 = 0,
    pMembers: [*c]const struct_ShaderCodeVariableDesc = null,
};
pub const ShaderCodeVariableDesc = struct_ShaderCodeVariableDesc;
pub const struct_ShaderCodeBufferDesc = extern struct {
    Size: Uint32 = 0,
    NumVariables: Uint32 = 0,
    pVariables: [*c]const ShaderCodeVariableDesc = null,
};
pub const ShaderCodeBufferDesc = struct_ShaderCodeBufferDesc;
pub const struct_IShaderMethods = extern struct {
    GetResourceCount: ?*const fn ([*c]struct_IShader) callconv(.c) Uint32 = null,
    GetResourceDesc: ?*const fn ([*c]struct_IShader, Index: Uint32, ResourceDesc: [*c]ShaderResourceDesc) callconv(.c) void = null,
    GetConstantBufferDesc: ?*const fn ([*c]struct_IShader, Index: Uint32) callconv(.c) [*c]const ShaderCodeBufferDesc = null,
    GetBytecode: ?*const fn ([*c]struct_IShader, ppBytecode: [*c]?*const anyopaque, Size: [*c]Uint64) callconv(.c) void = null,
    GetStatus: ?*const fn ([*c]struct_IShader, WaitForCompletion: bool) callconv(.c) SHADER_STATUS = null,
};
pub const IShaderMethods = struct_IShaderMethods;
pub const struct_IShaderVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    Shader: IShaderMethods = @import("std").mem.zeroes(IShaderMethods),
};
pub const struct_IShader = extern struct {
    pVtbl: [*c]struct_IShaderVtbl = null,
};
pub const IShader = struct_IShader;
pub const IShaderVtbl = struct_IShaderVtbl;
pub const IID_TextureView: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1529782350,
    .Data2 = 33064,
    .Data3 = 17892,
    .Data4 = [8]Uint8{
        170,
        77,
        109,
        199,
        231,
        13,
        196,
        36,
    },
};
pub const UAV_ACCESS_UNSPECIFIED: c_int = 0;
pub const UAV_ACCESS_FLAG_READ: c_int = 1;
pub const UAV_ACCESS_FLAG_WRITE: c_int = 2;
pub const UAV_ACCESS_FLAG_READ_WRITE: c_int = 3;
pub const UAV_ACCESS_FLAG_LAST: c_int = 3;
pub const enum__UAV_ACCESS_FLAG = c_uint;
pub const TEXTURE_VIEW_FLAG_NONE: c_int = 0;
pub const TEXTURE_VIEW_FLAG_ALLOW_MIP_MAP_GENERATION: c_int = 1;
pub const TEXTURE_VIEW_FLAG_LAST: c_int = 1;
pub const enum__TEXTURE_VIEW_FLAGS = c_uint;
pub const TEXTURE_COMPONENT_SWIZZLE_IDENTITY: c_int = 0;
pub const TEXTURE_COMPONENT_SWIZZLE_ZERO: c_int = 1;
pub const TEXTURE_COMPONENT_SWIZZLE_ONE: c_int = 2;
pub const TEXTURE_COMPONENT_SWIZZLE_R: c_int = 3;
pub const TEXTURE_COMPONENT_SWIZZLE_G: c_int = 4;
pub const TEXTURE_COMPONENT_SWIZZLE_B: c_int = 5;
pub const TEXTURE_COMPONENT_SWIZZLE_A: c_int = 6;
pub const TEXTURE_COMPONENT_SWIZZLE_COUNT: c_int = 7;
pub const enum__TEXTURE_COMPONENT_SWIZZLE = c_uint;
pub const ITextureViewVtbl = struct_ITextureViewVtbl;
pub const IID_Texture: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 2789936736,
    .Data2 = 7006,
    .Data3 = 19709,
    .Data4 = [8]Uint8{
        184,
        128,
        102,
        58,
        26,
        220,
        190,
        152,
    },
};
pub const MISC_TEXTURE_FLAGS = Uint8;
pub const MISC_TEXTURE_FLAG_NONE: c_int = 0;
pub const MISC_TEXTURE_FLAG_GENERATE_MIPS: c_int = 1;
pub const MISC_TEXTURE_FLAG_MEMORYLESS: c_int = 2;
pub const MISC_TEXTURE_FLAG_SPARSE_ALIASING: c_int = 4;
pub const MISC_TEXTURE_FLAG_SUBSAMPLED: c_int = 8;
pub const enum__MISC_TEXTURE_FLAGS = c_uint;
const union_unnamed_4 = extern union {
    ArraySize: Uint32,
    Depth: Uint32,
};
pub const struct_TextureDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Type: RESOURCE_DIMENSION = 0,
    Width: Uint32 = 0,
    Height: Uint32 = 0,
    unnamed_0: union_unnamed_4 = @import("std").mem.zeroes(union_unnamed_4),
    Format: TEXTURE_FORMAT = 0,
    MipLevels: Uint32 = 0,
    SampleCount: Uint32 = 0,
    BindFlags: BIND_FLAGS = 0,
    Usage: USAGE = 0,
    CPUAccessFlags: CPU_ACCESS_FLAGS = 0,
    MiscFlags: MISC_TEXTURE_FLAGS = 0,
    ClearValue: OptimizedClearValue = @import("std").mem.zeroes(OptimizedClearValue),
    ImmediateContextMask: Uint64 = 0,
};
pub const TextureDesc = struct_TextureDesc;
pub const struct_TextureData = extern struct {
    pSubResources: [*c]TextureSubResData = null,
    NumSubresources: Uint32 = 0,
    pContext: [*c]struct_IDeviceContext = null,
};
pub const TextureData = struct_TextureData;
pub const ITextureVtbl = struct_ITextureVtbl;
pub const IID_Sampler: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1499093439,
    .Data2 = 64129,
    .Data3 = 18517,
    .Data4 = [8]Uint8{
        188,
        94,
        192,
        224,
        72,
        116,
        90,
        149,
    },
};
pub const SAMPLER_FLAGS = Uint8;
pub const SAMPLER_FLAG_NONE: c_int = 0;
pub const SAMPLER_FLAG_SUBSAMPLED: c_int = 1;
pub const SAMPLER_FLAG_SUBSAMPLED_COARSE_RECONSTRUCTION: c_int = 2;
pub const SAMPLER_FLAG_LAST: c_int = 2;
pub const enum__SAMPLER_FLAGS = c_uint;
pub const struct_SamplerDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    MinFilter: FILTER_TYPE = 0,
    MagFilter: FILTER_TYPE = 0,
    MipFilter: FILTER_TYPE = 0,
    AddressU: TEXTURE_ADDRESS_MODE = 0,
    AddressV: TEXTURE_ADDRESS_MODE = 0,
    AddressW: TEXTURE_ADDRESS_MODE = 0,
    Flags: SAMPLER_FLAGS = 0,
    UnnormalizedCoords: Bool = false,
    MipLODBias: Float32 = 0,
    MaxAnisotropy: Uint32 = 0,
    ComparisonFunc: COMPARISON_FUNCTION = 0,
    BorderColor: [4]Float32 = @import("std").mem.zeroes([4]Float32),
    MinLOD: f32 = 0,
    MaxLOD: f32 = 0,
};
pub const SamplerDesc = struct_SamplerDesc;
pub const ISamplerVtbl = struct_ISamplerVtbl;
pub const ISampler = struct_ISampler;
pub const IID_ResourceMapping: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1813694374,
    .Data2 = 46121,
    .Data3 = 16697,
    .Data4 = [8]Uint8{
        148,
        51,
        158,
        84,
        233,
        62,
        56,
        74,
    },
};
pub const struct_ResourceMappingEntry = extern struct {
    Name: [*c]const Char = null,
    pObject: [*c]IDeviceObject = null,
    ArrayIndex: Uint32 = 0,
};
pub const ResourceMappingEntry = struct_ResourceMappingEntry;
pub const struct_ResourceMappingCreateInfo = extern struct {
    pEntries: [*c]const ResourceMappingEntry = null,
    NumEntries: Uint32 = 0,
};
pub const ResourceMappingCreateInfo = struct_ResourceMappingCreateInfo;
pub const IResourceMappingVtbl = struct_IResourceMappingVtbl;
pub const STENCIL_OP_UNDEFINED: c_int = 0;
pub const STENCIL_OP_KEEP: c_int = 1;
pub const STENCIL_OP_ZERO: c_int = 2;
pub const STENCIL_OP_REPLACE: c_int = 3;
pub const STENCIL_OP_INCR_SAT: c_int = 4;
pub const STENCIL_OP_DECR_SAT: c_int = 5;
pub const STENCIL_OP_INVERT: c_int = 6;
pub const STENCIL_OP_INCR_WRAP: c_int = 7;
pub const STENCIL_OP_DECR_WRAP: c_int = 8;
pub const STENCIL_OP_NUM_OPS: c_int = 9;
pub const enum__STENCIL_OP = c_uint;
pub const BLEND_FACTOR_UNDEFINED: c_int = 0;
pub const BLEND_FACTOR_ZERO: c_int = 1;
pub const BLEND_FACTOR_ONE: c_int = 2;
pub const BLEND_FACTOR_SRC_COLOR: c_int = 3;
pub const BLEND_FACTOR_INV_SRC_COLOR: c_int = 4;
pub const BLEND_FACTOR_SRC_ALPHA: c_int = 5;
pub const BLEND_FACTOR_INV_SRC_ALPHA: c_int = 6;
pub const BLEND_FACTOR_DEST_ALPHA: c_int = 7;
pub const BLEND_FACTOR_INV_DEST_ALPHA: c_int = 8;
pub const BLEND_FACTOR_DEST_COLOR: c_int = 9;
pub const BLEND_FACTOR_INV_DEST_COLOR: c_int = 10;
pub const BLEND_FACTOR_SRC_ALPHA_SAT: c_int = 11;
pub const BLEND_FACTOR_BLEND_FACTOR: c_int = 12;
pub const BLEND_FACTOR_INV_BLEND_FACTOR: c_int = 13;
pub const BLEND_FACTOR_SRC1_COLOR: c_int = 14;
pub const BLEND_FACTOR_INV_SRC1_COLOR: c_int = 15;
pub const BLEND_FACTOR_SRC1_ALPHA: c_int = 16;
pub const BLEND_FACTOR_INV_SRC1_ALPHA: c_int = 17;
pub const BLEND_FACTOR_NUM_FACTORS: c_int = 18;
pub const enum__BLEND_FACTOR = c_uint;
pub const BLEND_OPERATION_UNDEFINED: c_int = 0;
pub const BLEND_OPERATION_ADD: c_int = 1;
pub const BLEND_OPERATION_SUBTRACT: c_int = 2;
pub const BLEND_OPERATION_REV_SUBTRACT: c_int = 3;
pub const BLEND_OPERATION_MIN: c_int = 4;
pub const BLEND_OPERATION_MAX: c_int = 5;
pub const BLEND_OPERATION_NUM_OPERATIONS: c_int = 6;
pub const enum__BLEND_OPERATION = c_uint;
pub const COLOR_MASK_NONE: c_int = 0;
pub const COLOR_MASK_RED: c_int = 1;
pub const COLOR_MASK_GREEN: c_int = 2;
pub const COLOR_MASK_BLUE: c_int = 4;
pub const COLOR_MASK_ALPHA: c_int = 8;
pub const COLOR_MASK_RGB: c_int = 7;
pub const COLOR_MASK_ALL: c_int = 15;
pub const enum__COLOR_MASK = c_uint;
pub const LOGIC_OP_CLEAR: c_int = 0;
pub const LOGIC_OP_SET: c_int = 1;
pub const LOGIC_OP_COPY: c_int = 2;
pub const LOGIC_OP_COPY_INVERTED: c_int = 3;
pub const LOGIC_OP_NOOP: c_int = 4;
pub const LOGIC_OP_INVERT: c_int = 5;
pub const LOGIC_OP_AND: c_int = 6;
pub const LOGIC_OP_NAND: c_int = 7;
pub const LOGIC_OP_OR: c_int = 8;
pub const LOGIC_OP_NOR: c_int = 9;
pub const LOGIC_OP_XOR: c_int = 10;
pub const LOGIC_OP_EQUIV: c_int = 11;
pub const LOGIC_OP_AND_REVERSE: c_int = 12;
pub const LOGIC_OP_AND_INVERTED: c_int = 13;
pub const LOGIC_OP_OR_REVERSE: c_int = 14;
pub const LOGIC_OP_OR_INVERTED: c_int = 15;
pub const LOGIC_OP_NUM_OPERATIONS: c_int = 16;
pub const enum__LOGIC_OPERATION = c_uint;
pub const FILL_MODE_UNDEFINED: c_int = 0;
pub const FILL_MODE_WIREFRAME: c_int = 1;
pub const FILL_MODE_SOLID: c_int = 2;
pub const FILL_MODE_NUM_MODES: c_int = 3;
pub const enum__FILL_MODE = c_uint;
pub const CULL_MODE_UNDEFINED: c_int = 0;
pub const CULL_MODE_NONE: c_int = 1;
pub const CULL_MODE_FRONT: c_int = 2;
pub const CULL_MODE_BACK: c_int = 3;
pub const CULL_MODE_NUM_MODES: c_int = 4;
pub const enum__CULL_MODE = c_uint;
pub const IID_ShaderResourceVariable: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 223862591,
    .Data2 = 38781,
    .Data3 = 19599,
    .Data4 = [8]Uint8{
        182,
        76,
        102,
        117,
        129,
        75,
        200,
        12,
    },
};
pub const SHADER_RESOURCE_VARIABLE_TYPE_STATIC: c_int = 0;
pub const SHADER_RESOURCE_VARIABLE_TYPE_MUTABLE: c_int = 1;
pub const SHADER_RESOURCE_VARIABLE_TYPE_DYNAMIC: c_int = 2;
pub const SHADER_RESOURCE_VARIABLE_TYPE_NUM_TYPES: c_int = 3;
pub const enum__SHADER_RESOURCE_VARIABLE_TYPE = c_uint;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_NONE: c_int = 0;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_STATIC: c_int = 1;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_MUTABLE: c_int = 2;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_DYNAMIC: c_int = 4;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_MUT_DYN: c_int = 6;
pub const SHADER_RESOURCE_VARIABLE_TYPE_FLAG_ALL: c_int = 7;
pub const enum__SHADER_RESOURCE_VARIABLE_TYPE_FLAGS = c_uint;
pub const BIND_SHADER_RESOURCES_UPDATE_STATIC: c_int = 1;
pub const BIND_SHADER_RESOURCES_UPDATE_MUTABLE: c_int = 2;
pub const BIND_SHADER_RESOURCES_UPDATE_DYNAMIC: c_int = 4;
pub const BIND_SHADER_RESOURCES_UPDATE_ALL: c_int = 7;
pub const BIND_SHADER_RESOURCES_KEEP_EXISTING: c_int = 8;
pub const BIND_SHADER_RESOURCES_VERIFY_ALL_RESOLVED: c_int = 16;
pub const BIND_SHADER_RESOURCES_ALLOW_OVERWRITE: c_int = 32;
pub const enum__BIND_SHADER_RESOURCES_FLAGS = c_uint;
pub const SET_SHADER_RESOURCE_FLAG_NONE: c_int = 0;
pub const SET_SHADER_RESOURCE_FLAG_ALLOW_OVERWRITE: c_int = 1;
pub const enum__SET_SHADER_RESOURCE_FLAGS = c_uint;
pub const IShaderResourceVariableVtbl = struct_IShaderResourceVariableVtbl;
pub const IID_ShaderResourceBinding: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 102729588,
    .Data2 = 39433,
    .Data3 = 18664,
    .Data4 = [8]Uint8{
        132,
        17,
        181,
        189,
        32,
        86,
        1,
        4,
    },
};
pub const IShaderResourceBindingVtbl = struct_IShaderResourceBindingVtbl;
pub const IID_RenderPass: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 3088637639,
    .Data2 = 5965,
    .Data3 = 17530,
    .Data4 = [8]Uint8{
        168,
        228,
        148,
        210,
        28,
        87,
        180,
        10,
    },
};
pub const ATTACHMENT_LOAD_OP = Uint8;
pub const ATTACHMENT_LOAD_OP_LOAD: c_int = 0;
pub const ATTACHMENT_LOAD_OP_CLEAR: c_int = 1;
pub const ATTACHMENT_LOAD_OP_DISCARD: c_int = 2;
pub const ATTACHMENT_LOAD_OP_COUNT: c_int = 3;
pub const enum__ATTACHMENT_LOAD_OP = c_uint;
pub const ATTACHMENT_STORE_OP = Uint8;
pub const ATTACHMENT_STORE_OP_STORE: c_int = 0;
pub const ATTACHMENT_STORE_OP_DISCARD: c_int = 1;
pub const ATTACHMENT_STORE_OP_COUNT: c_int = 2;
pub const enum__ATTACHMENT_STORE_OP = c_uint;
pub const struct_RenderPassAttachmentDesc = extern struct {
    Format: TEXTURE_FORMAT = 0,
    SampleCount: Uint8 = 0,
    LoadOp: ATTACHMENT_LOAD_OP = 0,
    StoreOp: ATTACHMENT_STORE_OP = 0,
    StencilLoadOp: ATTACHMENT_LOAD_OP = 0,
    StencilStoreOp: ATTACHMENT_STORE_OP = 0,
    InitialState: RESOURCE_STATE = 0,
    FinalState: RESOURCE_STATE = 0,
};
pub const RenderPassAttachmentDesc = struct_RenderPassAttachmentDesc;
pub const ATTACHMENT_UNUSED: Uint32 = DILIGENT_ATTACHMENT_UNUSED;
pub const struct_AttachmentReference = extern struct {
    AttachmentIndex: Uint32 = 0,
    State: RESOURCE_STATE = 0,
};
pub const AttachmentReference = struct_AttachmentReference;
pub const struct_ShadingRateAttachment = extern struct {
    Attachment: AttachmentReference = @import("std").mem.zeroes(AttachmentReference),
    TileSize: [2]Uint32 = @import("std").mem.zeroes([2]Uint32),
};
pub const ShadingRateAttachment = struct_ShadingRateAttachment;
pub const struct_SubpassDesc = extern struct {
    InputAttachmentCount: Uint32 = 0,
    pInputAttachments: [*c]const AttachmentReference = null,
    RenderTargetAttachmentCount: Uint32 = 0,
    pRenderTargetAttachments: [*c]const AttachmentReference = null,
    pResolveAttachments: [*c]const AttachmentReference = null,
    pDepthStencilAttachment: [*c]const AttachmentReference = null,
    PreserveAttachmentCount: Uint32 = 0,
    pPreserveAttachments: [*c]const Uint32 = null,
    pShadingRateAttachment: [*c]const ShadingRateAttachment = null,
};
pub const SubpassDesc = struct_SubpassDesc;
pub const SUBPASS_EXTERNAL: Uint32 = DILIGENT_SUBPASS_EXTERNAL;
pub const struct_SubpassDependencyDesc = extern struct {
    SrcSubpass: Uint32 = 0,
    DstSubpass: Uint32 = 0,
    SrcStageMask: PIPELINE_STAGE_FLAGS = 0,
    DstStageMask: PIPELINE_STAGE_FLAGS = 0,
    SrcAccessMask: ACCESS_FLAGS = 0,
    DstAccessMask: ACCESS_FLAGS = 0,
};
pub const SubpassDependencyDesc = struct_SubpassDependencyDesc;
pub const struct_RenderPassDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    AttachmentCount: Uint32 = 0,
    pAttachments: [*c]const RenderPassAttachmentDesc = null,
    SubpassCount: Uint32 = 0,
    pSubpasses: [*c]const SubpassDesc = null,
    DependencyCount: Uint32 = 0,
    pDependencies: [*c]const SubpassDependencyDesc = null,
};
pub const RenderPassDesc = struct_RenderPassDesc;
pub const struct_ImmutableSamplerDesc = extern struct {
    ShaderStages: SHADER_TYPE = 0,
    SamplerOrTextureName: [*c]const Char = null,
    Desc: struct_SamplerDesc = @import("std").mem.zeroes(struct_SamplerDesc),
};
pub const ImmutableSamplerDesc = struct_ImmutableSamplerDesc;
pub const PIPELINE_RESOURCE_FLAGS = Uint8;
pub const PIPELINE_RESOURCE_FLAG_NONE: c_int = 0;
pub const PIPELINE_RESOURCE_FLAG_NO_DYNAMIC_BUFFERS: c_int = 1;
pub const PIPELINE_RESOURCE_FLAG_INLINE_CONSTANTS: c_int = 2;
pub const PIPELINE_RESOURCE_FLAG_COMBINED_SAMPLER: c_int = 4;
pub const PIPELINE_RESOURCE_FLAG_FORMATTED_BUFFER: c_int = 8;
pub const PIPELINE_RESOURCE_FLAG_RUNTIME_ARRAY: c_int = 16;
pub const PIPELINE_RESOURCE_FLAG_GENERAL_INPUT_ATTACHMENT: c_int = 32;
pub const PIPELINE_RESOURCE_FLAG_LAST: c_int = 32;
pub const enum__PIPELINE_RESOURCE_FLAGS = c_uint;
pub const WEB_GPU_BINDING_TYPE = Uint8;
pub const WEB_GPU_BINDING_TYPE_DEFAULT: c_int = 0;
pub const WEB_GPU_BINDING_TYPE_FILTERING_SAMPLER: c_int = 1;
pub const WEB_GPU_BINDING_TYPE_NON_FILTERING_SAMPLER: c_int = 2;
pub const WEB_GPU_BINDING_TYPE_COMPARISON_SAMPLER: c_int = 3;
pub const WEB_GPU_BINDING_TYPE_FLOAT_TEXTURE: c_int = 4;
pub const WEB_GPU_BINDING_TYPE_UNFILTERABLE_FLOAT_TEXTURE: c_int = 5;
pub const WEB_GPU_BINDING_TYPE_DEPTH_TEXTURE: c_int = 6;
pub const WEB_GPU_BINDING_TYPE_SINT_TEXTURE: c_int = 7;
pub const WEB_GPU_BINDING_TYPE_UINT_TEXTURE: c_int = 8;
pub const WEB_GPU_BINDING_TYPE_FLOAT_TEXTURE_MS: c_int = 9;
pub const WEB_GPU_BINDING_TYPE_UNFILTERABLE_FLOAT_TEXTURE_MS: c_int = 10;
pub const WEB_GPU_BINDING_TYPE_DEPTH_TEXTURE_MS: c_int = 11;
pub const WEB_GPU_BINDING_TYPE_SINT_TEXTURE_MS: c_int = 12;
pub const WEB_GPU_BINDING_TYPE_UINT_TEXTURE_MS: c_int = 13;
pub const WEB_GPU_BINDING_TYPE_WRITE_ONLY_TEXTURE_UAV: c_int = 14;
pub const WEB_GPU_BINDING_TYPE_READ_ONLY_TEXTURE_UAV: c_int = 15;
pub const WEB_GPU_BINDING_TYPE_READ_WRITE_TEXTURE_UAV: c_int = 16;
pub const WEB_GPU_BINDING_TYPE_COUNT: c_int = 17;
pub const enum__WEB_GPU_BINDING_TYPE = c_uint;
pub const struct_WebGPUResourceAttribs = extern struct {
    BindingType: WEB_GPU_BINDING_TYPE = 0,
    TextureViewDim: RESOURCE_DIMENSION = 0,
    UAVTextureFormat: TEXTURE_FORMAT = 0,
};
pub const WebGPUResourceAttribs = struct_WebGPUResourceAttribs;
pub const struct_PipelineResourceDesc = extern struct {
    Name: [*c]const Char = null,
    ShaderStages: SHADER_TYPE = 0,
    ArraySize: Uint32 = 0,
    ResourceType: SHADER_RESOURCE_TYPE = 0,
    VarType: SHADER_RESOURCE_VARIABLE_TYPE = 0,
    Flags: PIPELINE_RESOURCE_FLAGS = 0,
    WebGPUAttribs: WebGPUResourceAttribs = @import("std").mem.zeroes(WebGPUResourceAttribs),
};
pub const PipelineResourceDesc = struct_PipelineResourceDesc;
pub const struct_PipelineResourceSignatureDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Resources: [*c]const PipelineResourceDesc = null,
    NumResources: Uint32 = 0,
    ImmutableSamplers: [*c]const ImmutableSamplerDesc = null,
    NumImmutableSamplers: Uint32 = 0,
    BindingIndex: Uint8 = 0,
    UseCombinedTextureSamplers: Bool = false,
    CombinedSamplerSuffix: [*c]const Char = null,
    SRBAllocationGranularity: Uint32 = 0,
};
pub const PipelineResourceSignatureDesc = struct_PipelineResourceSignatureDesc;
pub const IID_PipelineResourceSignature: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 3705969061,
    .Data2 = 63506,
    .Data3 = 19603,
    .Data4 = [8]Uint8{
        177,
        8,
        214,
        132,
        160,
        181,
        97,
        24,
    },
};
pub const IPipelineResourceSignatureVtbl = struct_IPipelineResourceSignatureVtbl;
pub const PSO_CACHE_MODE = Uint8;
pub const PSO_CACHE_MODE_LOAD: c_int = 1;
pub const PSO_CACHE_MODE_STORE: c_int = 2;
pub const PSO_CACHE_MODE_LOAD_STORE: c_int = 3;
pub const enum__PSO_CACHE_MODE = c_uint;
pub const PSO_CACHE_FLAGS = Uint8;
pub const PSO_CACHE_FLAG_NONE: c_int = 0;
pub const PSO_CACHE_FLAG_VERBOSE: c_int = 1;
pub const enum__PSO_CACHE_FLAGS = c_uint;
pub const struct_PipelineStateCacheDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Mode: PSO_CACHE_MODE = 0,
    Flags: PSO_CACHE_FLAGS = 0,
};
pub const PipelineStateCacheDesc = struct_PipelineStateCacheDesc;
pub const struct_PipelineStateCacheCreateInfo = extern struct {
    Desc: PipelineStateCacheDesc = @import("std").mem.zeroes(PipelineStateCacheDesc),
    pCacheData: ?*const anyopaque = null,
    CacheDataSize: Uint32 = 0,
};
pub const PipelineStateCacheCreateInfo = struct_PipelineStateCacheCreateInfo;
pub const IID_PipelineStateCache: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1791520546,
    .Data2 = 65524,
    .Data3 = 18748,
    .Data4 = [8]Uint8{
        140,
        31,
        197,
        57,
        217,
        52,
        244,
        188,
    },
};
pub const struct_IPipelineStateCacheMethods = extern struct {
    GetData: ?*const fn ([*c]struct_IPipelineStateCache, ppBlob: [*c][*c]IDataBlob) callconv(.c) void = null,
};
pub const IPipelineStateCacheMethods = struct_IPipelineStateCacheMethods;
pub const struct_IPipelineStateCacheVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    DeviceObject: IDeviceObjectMethods = @import("std").mem.zeroes(IDeviceObjectMethods),
    PipelineStateCache: IPipelineStateCacheMethods = @import("std").mem.zeroes(IPipelineStateCacheMethods),
};
pub const struct_IPipelineStateCache = extern struct {
    pVtbl: [*c]struct_IPipelineStateCacheVtbl = null,
};
pub const IPipelineStateCache = struct_IPipelineStateCache;
pub const IPipelineStateCacheVtbl = struct_IPipelineStateCacheVtbl;
pub const SHADER_VARIABLE_FLAGS = Uint8;
pub const SHADER_VARIABLE_FLAG_NONE: c_int = 0;
pub const SHADER_VARIABLE_FLAG_NO_DYNAMIC_BUFFERS: c_int = 1;
pub const SHADER_VARIABLE_FLAG_INLINE_CONSTANTS: c_int = 2;
pub const SHADER_VARIABLE_FLAG_GENERAL_INPUT_ATTACHMENT_VK: c_int = 4;
pub const SHADER_VARIABLE_FLAG_UNFILTERABLE_FLOAT_TEXTURE_WEBGPU: c_int = 8;
pub const SHADER_VARIABLE_FLAG_NON_FILTERING_SAMPLER_WEBGPU: c_int = 16;
pub const SHADER_VARIABLE_FLAG_LAST: c_int = 16;
pub const enum__SHADER_VARIABLE_FLAGS = c_uint;
pub const struct_ShaderResourceVariableDesc = extern struct {
    Name: [*c]const Char = null,
    ShaderStages: SHADER_TYPE = 0,
    Type: SHADER_RESOURCE_VARIABLE_TYPE = 0,
    Flags: SHADER_VARIABLE_FLAGS = 0,
};
pub const ShaderResourceVariableDesc = struct_ShaderResourceVariableDesc;
pub const PIPELINE_SHADING_RATE_FLAG_NONE: c_int = 0;
pub const PIPELINE_SHADING_RATE_FLAG_PER_PRIMITIVE: c_int = 1;
pub const PIPELINE_SHADING_RATE_FLAG_TEXTURE_BASED: c_int = 2;
pub const PIPELINE_SHADING_RATE_FLAG_LAST: c_int = 2;
pub const enum__PIPELINE_SHADING_RATE_FLAGS = c_uint;
pub const struct_PipelineResourceLayoutDesc = extern struct {
    DefaultVariableType: SHADER_RESOURCE_VARIABLE_TYPE = 0,
    DefaultVariableMergeStages: SHADER_TYPE = 0,
    NumVariables: Uint32 = 0,
    Variables: [*c]const ShaderResourceVariableDesc = null,
    NumImmutableSamplers: Uint32 = 0,
    ImmutableSamplers: [*c]const ImmutableSamplerDesc = null,
};
pub const PipelineResourceLayoutDesc = struct_PipelineResourceLayoutDesc;
pub const struct_RayTracingGeneralShaderGroup = extern struct {
    Name: [*c]const Char = null,
    pShader: [*c]IShader = null,
};
pub const RayTracingGeneralShaderGroup = struct_RayTracingGeneralShaderGroup;
pub const struct_RayTracingTriangleHitShaderGroup = extern struct {
    Name: [*c]const Char = null,
    pClosestHitShader: [*c]IShader = null,
    pAnyHitShader: [*c]IShader = null,
};
pub const RayTracingTriangleHitShaderGroup = struct_RayTracingTriangleHitShaderGroup;
pub const struct_RayTracingProceduralHitShaderGroup = extern struct {
    Name: [*c]const Char = null,
    pIntersectionShader: [*c]IShader = null,
    pClosestHitShader: [*c]IShader = null,
    pAnyHitShader: [*c]IShader = null,
};
pub const RayTracingProceduralHitShaderGroup = struct_RayTracingProceduralHitShaderGroup;
pub const PIPELINE_TYPE = Uint8;
pub const PIPELINE_TYPE_GRAPHICS: c_int = 0;
pub const PIPELINE_TYPE_COMPUTE: c_int = 1;
pub const PIPELINE_TYPE_MESH: c_int = 2;
pub const PIPELINE_TYPE_RAY_TRACING: c_int = 3;
pub const PIPELINE_TYPE_TILE: c_int = 4;
pub const PIPELINE_TYPE_LAST: c_int = 4;
pub const PIPELINE_TYPE_COUNT: c_int = 5;
pub const PIPELINE_TYPE_INVALID: c_int = 255;
pub const enum__PIPELINE_TYPE = c_uint;
pub const struct_PipelineStateDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    PipelineType: PIPELINE_TYPE = 0,
    SRBAllocationGranularity: Uint32 = 0,
    ImmediateContextMask: Uint64 = 0,
    ResourceLayout: PipelineResourceLayoutDesc = @import("std").mem.zeroes(PipelineResourceLayoutDesc),
};
pub const PipelineStateDesc = struct_PipelineStateDesc;
pub const PSO_CREATE_FLAGS = Uint32;
pub const PSO_CREATE_FLAG_NONE: c_int = 0;
pub const PSO_CREATE_FLAG_IGNORE_MISSING_VARIABLES: c_int = 1;
pub const PSO_CREATE_FLAG_IGNORE_MISSING_IMMUTABLE_SAMPLERS: c_int = 2;
pub const PSO_CREATE_FLAG_DONT_REMAP_SHADER_RESOURCES: c_int = 4;
pub const PSO_CREATE_FLAG_ASYNCHRONOUS: c_int = 8;
pub const PSO_CREATE_FLAG_LAST: c_int = 8;
pub const enum__PSO_CREATE_FLAGS = c_uint;
pub const struct_SpecializationConstant = extern struct {
    Name: [*c]const Char = null,
    ShaderStages: SHADER_TYPE = 0,
    Size: Uint32 = 0,
    pData: ?*const anyopaque = null,
};
pub const SpecializationConstant = struct_SpecializationConstant;
pub const struct_PipelineStateCreateInfo = extern struct {
    PSODesc: PipelineStateDesc = @import("std").mem.zeroes(PipelineStateDesc),
    Flags: PSO_CREATE_FLAGS = 0,
    ResourceSignaturesCount: Uint32 = 0,
    ppResourceSignatures: [*c][*c]IPipelineResourceSignature = null,
    NumSpecializationConstants: Uint32 = 0,
    pSpecializationConstants: [*c]const SpecializationConstant = null,
    pPSOCache: [*c]IPipelineStateCache = null,
    pInternalData: ?*anyopaque = null,
};
pub const PipelineStateCreateInfo = struct_PipelineStateCreateInfo;
pub const struct_GraphicsPipelineStateCreateInfo = extern struct {
    _PipelineStateCreateInfo: struct_PipelineStateCreateInfo = @import("std").mem.zeroes(struct_PipelineStateCreateInfo),
    GraphicsPipeline: GraphicsPipelineDesc = @import("std").mem.zeroes(GraphicsPipelineDesc),
    pVS: [*c]IShader = null,
    pPS: [*c]IShader = null,
    pDS: [*c]IShader = null,
    pHS: [*c]IShader = null,
    pGS: [*c]IShader = null,
    pAS: [*c]IShader = null,
    pMS: [*c]IShader = null,
};
pub const GraphicsPipelineStateCreateInfo = struct_GraphicsPipelineStateCreateInfo;
pub const struct_ComputePipelineStateCreateInfo = extern struct {
    _PipelineStateCreateInfo: struct_PipelineStateCreateInfo = @import("std").mem.zeroes(struct_PipelineStateCreateInfo),
    pCS: [*c]IShader = null,
};
pub const ComputePipelineStateCreateInfo = struct_ComputePipelineStateCreateInfo;
pub const struct_RayTracingPipelineStateCreateInfo = extern struct {
    _PipelineStateCreateInfo: struct_PipelineStateCreateInfo = @import("std").mem.zeroes(struct_PipelineStateCreateInfo),
    RayTracingPipeline: RayTracingPipelineDesc = @import("std").mem.zeroes(RayTracingPipelineDesc),
    pGeneralShaders: [*c]const RayTracingGeneralShaderGroup = null,
    GeneralShaderCount: Uint32 = 0,
    pTriangleHitShaders: [*c]const RayTracingTriangleHitShaderGroup = null,
    TriangleHitShaderCount: Uint32 = 0,
    pProceduralHitShaders: [*c]const RayTracingProceduralHitShaderGroup = null,
    ProceduralHitShaderCount: Uint32 = 0,
    pShaderRecordName: [*c]const Char = null,
    MaxAttributeSize: Uint32 = 0,
    MaxPayloadSize: Uint32 = 0,
};
pub const RayTracingPipelineStateCreateInfo = struct_RayTracingPipelineStateCreateInfo;
pub const struct_TilePipelineStateCreateInfo = extern struct {
    _PipelineStateCreateInfo: struct_PipelineStateCreateInfo = @import("std").mem.zeroes(struct_PipelineStateCreateInfo),
    TilePipeline: TilePipelineDesc = @import("std").mem.zeroes(TilePipelineDesc),
    pTS: [*c]IShader = null,
};
pub const TilePipelineStateCreateInfo = struct_TilePipelineStateCreateInfo;
pub const PIPELINE_STATE_STATUS_UNINITIALIZED: c_int = 0;
pub const PIPELINE_STATE_STATUS_COMPILING: c_int = 1;
pub const PIPELINE_STATE_STATUS_READY: c_int = 2;
pub const PIPELINE_STATE_STATUS_FAILED: c_int = 3;
pub const enum__PIPELINE_STATE_STATUS = c_uint;
pub const IID_PipelineState: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 101206757,
    .Data2 = 27249,
    .Data3 = 20456,
    .Data4 = [8]Uint8{
        132,
        185,
        57,
        93,
        212,
        137,
        162,
        140,
    },
};
pub const IPipelineStateVtbl = struct_IPipelineStateVtbl;
pub const IID_Fence: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 991500365,
    .Data2 = 12971,
    .Data3 = 18177,
    .Data4 = [8]Uint8{
        132,
        244,
        154,
        12,
        3,
        174,
        22,
        114,
    },
};
pub const FENCE_TYPE = Uint8;
pub const FENCE_TYPE_CPU_WAIT_ONLY: c_int = 0;
pub const FENCE_TYPE_GENERAL: c_int = 1;
pub const FENCE_TYPE_LAST: c_int = 1;
pub const enum__FENCE_TYPE = c_uint;
pub const struct_FenceDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Type: FENCE_TYPE = 0,
};
pub const FenceDesc = struct_FenceDesc;
pub const IFenceVtbl = struct_IFenceVtbl;
pub const IID_Query: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 1894951050,
    .Data2 = 63678,
    .Data3 = 18689,
    .Data4 = [8]Uint8{
        143,
        5,
        47,
        114,
        250,
        105,
        91,
        160,
    },
};
pub const struct_QueryDataOcclusion = extern struct {
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
    NumSamples: Uint64 = 0,
};
pub const QueryDataOcclusion = struct_QueryDataOcclusion;
pub const struct_QueryDataBinaryOcclusion = extern struct {
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
    AnySamplePassed: Bool = false,
};
pub const QueryDataBinaryOcclusion = struct_QueryDataBinaryOcclusion;
pub const struct_QueryDataTimestamp = extern struct {
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
    Counter: Uint64 = 0,
    Frequency: Uint64 = 0,
};
pub const QueryDataTimestamp = struct_QueryDataTimestamp;
pub const struct_QueryDataPipelineStatistics = extern struct {
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
    InputVertices: Uint64 = 0,
    InputPrimitives: Uint64 = 0,
    GSPrimitives: Uint64 = 0,
    ClippingInvocations: Uint64 = 0,
    ClippingPrimitives: Uint64 = 0,
    VSInvocations: Uint64 = 0,
    GSInvocations: Uint64 = 0,
    PSInvocations: Uint64 = 0,
    HSInvocations: Uint64 = 0,
    DSInvocations: Uint64 = 0,
    CSInvocations: Uint64 = 0,
};
pub const QueryDataPipelineStatistics = struct_QueryDataPipelineStatistics;
pub const struct_QueryDataDuration = extern struct {
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
    Duration: Uint64 = 0,
    Frequency: Uint64 = 0,
};
pub const QueryDataDuration = struct_QueryDataDuration;
pub const struct_QueryDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Type: enum_QUERY_TYPE = @import("std").mem.zeroes(enum_QUERY_TYPE),
};
pub const QueryDesc = struct_QueryDesc;
pub const IQueryVtbl = struct_IQueryVtbl;
pub const IID_Framebuffer: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 98213447,
    .Data2 = 15526,
    .Data3 = 20374,
    .Data4 = [8]Uint8{
        169,
        103,
        29,
        221,
        197,
        49,
        129,
        166,
    },
};
pub const struct_FramebufferDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    pRenderPass: [*c]IRenderPass = null,
    AttachmentCount: Uint32 = 0,
    ppAttachments: [*c]const [*c]ITextureView = null,
    Width: Uint32 = 0,
    Height: Uint32 = 0,
    NumArraySlices: Uint32 = 0,
};
pub const FramebufferDesc = struct_FramebufferDesc;
pub const IID_CommandList: struct_INTERFACE_ID = struct_INTERFACE_ID{
    .Data1 = 3280759026,
    .Data2 = 35468,
    .Data3 = 20181,
    .Data4 = [8]Uint8{
        183,
        238,
        105,
        18,
        110,
        117,
        220,
        216,
    },
};
pub const IID_SwapChain: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 477117303,
    .Data2 = 26119,
    .Data3 = 20204,
    .Data4 = [8]Uint8{
        177,
        254,
        21,
        200,
        45,
        59,
        65,
        48,
    },
};
pub const struct_ISwapChainMethods = extern struct {
    Present: ?*const fn ([*c]struct_ISwapChain, SyncInterval: Uint32) callconv(.c) void = null,
    GetDesc: ?*const fn ([*c]struct_ISwapChain) callconv(.c) [*c]const SwapChainDesc = null,
    Resize: ?*const fn ([*c]struct_ISwapChain, NewWidth: Uint32, NewHeight: Uint32, NewTransform: SURFACE_TRANSFORM) callconv(.c) void = null,
    SetFullscreenMode: ?*const fn ([*c]struct_ISwapChain, DisplayMode: [*c]const DisplayModeAttribs) callconv(.c) void = null,
    SetWindowedMode: ?*const fn ([*c]struct_ISwapChain) callconv(.c) void = null,
    SetMaximumFrameLatency: ?*const fn ([*c]struct_ISwapChain, MaxLatency: Uint32) callconv(.c) void = null,
    GetCurrentBackBufferRTV: ?*const fn ([*c]struct_ISwapChain) callconv(.c) [*c]ITextureView = null,
    GetDepthBufferDSV: ?*const fn ([*c]struct_ISwapChain) callconv(.c) [*c]ITextureView = null,
};
pub const ISwapChainMethods = struct_ISwapChainMethods;
pub const struct_ISwapChainVtbl = extern struct {
    Object: IObjectMethods = @import("std").mem.zeroes(IObjectMethods),
    SwapChain: ISwapChainMethods = @import("std").mem.zeroes(ISwapChainMethods),
};
pub const struct_ISwapChain = extern struct {
    pVtbl: [*c]struct_ISwapChainVtbl = null,
};
pub const ISwapChain = struct_ISwapChain;
pub const ISwapChainVtbl = struct_ISwapChainVtbl;
pub const IID_BottomLevelAS: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 3849279317,
    .Data2 = 65118,
    .Data3 = 18796,
    .Data4 = [8]Uint8{
        191,
        167,
        188,
        213,
        53,
        54,
        15,
        247,
    },
};
pub const INVALID_INDEX: Uint32 = DILIGENT_INVALID_INDEX;
pub const struct_BLASTriangleDesc = extern struct {
    GeometryName: [*c]const Char = null,
    MaxVertexCount: Uint32 = 0,
    VertexValueType: VALUE_TYPE = 0,
    VertexComponentCount: Uint8 = 0,
    MaxPrimitiveCount: Uint32 = 0,
    IndexType: VALUE_TYPE = 0,
    AllowsTransforms: Bool = false,
};
pub const BLASTriangleDesc = struct_BLASTriangleDesc;
pub const struct_BLASBoundingBoxDesc = extern struct {
    GeometryName: [*c]const Char = null,
    MaxBoxCount: Uint32 = 0,
};
pub const BLASBoundingBoxDesc = struct_BLASBoundingBoxDesc;
pub const RAYTRACING_BUILD_AS_FLAGS = Uint8;
pub const RAYTRACING_BUILD_AS_NONE: c_int = 0;
pub const RAYTRACING_BUILD_AS_ALLOW_UPDATE: c_int = 1;
pub const RAYTRACING_BUILD_AS_ALLOW_COMPACTION: c_int = 2;
pub const RAYTRACING_BUILD_AS_PREFER_FAST_TRACE: c_int = 4;
pub const RAYTRACING_BUILD_AS_PREFER_FAST_BUILD: c_int = 8;
pub const RAYTRACING_BUILD_AS_LOW_MEMORY: c_int = 16;
pub const RAYTRACING_BUILD_AS_FLAG_LAST: c_int = 16;
pub const enum__RAYTRACING_BUILD_AS_FLAGS = c_uint;
pub const struct_BottomLevelASDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    pTriangles: [*c]const BLASTriangleDesc = null,
    TriangleCount: Uint32 = 0,
    pBoxes: [*c]const BLASBoundingBoxDesc = null,
    BoxCount: Uint32 = 0,
    Flags: RAYTRACING_BUILD_AS_FLAGS = 0,
    CompactedSize: Uint64 = 0,
    ImmediateContextMask: Uint64 = 0,
};
pub const BottomLevelASDesc = struct_BottomLevelASDesc;
pub const IBottomLevelASVtbl = struct_IBottomLevelASVtbl;
pub const IID_TopLevelAS: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 374741089,
    .Data2 = 10571,
    .Data3 = 18436,
    .Data4 = [8]Uint8{
        150,
        250,
        23,
        23,
        51,
        63,
        118,
        154,
    },
};
pub const struct_TopLevelASDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    MaxInstanceCount: Uint32 = 0,
    Flags: RAYTRACING_BUILD_AS_FLAGS = 0,
    CompactedSize: Uint64 = 0,
    ImmediateContextMask: Uint64 = 0,
};
pub const TopLevelASDesc = struct_TopLevelASDesc;
pub const HIT_GROUP_BINDING_MODE_PER_GEOMETRY: c_int = 0;
pub const HIT_GROUP_BINDING_MODE_PER_INSTANCE: c_int = 1;
pub const HIT_GROUP_BINDING_MODE_PER_TLAS: c_int = 2;
pub const HIT_GROUP_BINDING_MODE_USER_DEFINED: c_int = 3;
pub const HIT_GROUP_BINDING_MODE_LAST: c_int = 3;
pub const enum__HIT_GROUP_BINDING_MODE = c_uint;
pub const ITopLevelASVtbl = struct_ITopLevelASVtbl;
pub const IID_ShaderBindingTable: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 518070529,
    .Data2 = 28688,
    .Data3 = 18469,
    .Data4 = [8]Uint8{
        170,
        142,
        172,
        107,
        185,
        133,
        139,
        214,
    },
};
pub const struct_ShaderBindingTableDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    pPSO: [*c]IPipelineState = null,
};
pub const ShaderBindingTableDesc = struct_ShaderBindingTableDesc;
pub const VERIFY_SBT_FLAG_SHADER_ONLY: c_int = 1;
pub const VERIFY_SBT_FLAG_SHADER_RECORD: c_int = 2;
pub const VERIFY_SBT_FLAG_TLAS: c_int = 4;
pub const VERIFY_SBT_FLAG_ALL: c_int = 7;
pub const enum__VERIFY_SBT_FLAGS = c_uint;
pub const IShaderBindingTableVtbl = struct_IShaderBindingTableVtbl;
pub const IID_DeviceMemory: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 2170518241,
    .Data2 = 33960,
    .Data3 = 19165,
    .Data4 = [8]Uint8{
        169,
        59,
        62,
        40,
        193,
        113,
        29,
        94,
    },
};
pub const DEVICE_MEMORY_TYPE = Uint8;
pub const DEVICE_MEMORY_TYPE_UNDEFINED: c_int = 0;
pub const DEVICE_MEMORY_TYPE_SPARSE: c_int = 1;
pub const enum__DEVICE_MEMORY_TYPE = c_uint;
pub const struct_DeviceMemoryDesc = extern struct {
    _DeviceObjectAttribs: struct_DeviceObjectAttribs = @import("std").mem.zeroes(struct_DeviceObjectAttribs),
    Type: DEVICE_MEMORY_TYPE = 0,
    PageSize: Uint64 = 0,
    ImmediateContextMask: Uint64 = 0,
};
pub const DeviceMemoryDesc = struct_DeviceMemoryDesc;
pub const struct_DeviceMemoryCreateInfo = extern struct {
    Desc: DeviceMemoryDesc = @import("std").mem.zeroes(DeviceMemoryDesc),
    InitialSize: Uint64 = 0,
    ppCompatibleResources: [*c][*c]IDeviceObject = null,
    NumResources: Uint32 = 0,
};
pub const DeviceMemoryCreateInfo = struct_DeviceMemoryCreateInfo;
pub const IDeviceMemoryVtbl = struct_IDeviceMemoryVtbl;
pub const IID_CommandQueue: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 267659255,
    .Data2 = 25220,
    .Data3 = 16542,
    .Data4 = [8]Uint8{
        129,
        97,
        160,
        35,
        202,
        7,
        239,
        93,
    },
};
pub const ICommandQueueVtbl = struct_ICommandQueueVtbl;
pub const IID_DeviceContext: INTERFACE_ID = INTERFACE_ID{
    .Data1 = 3700584731,
    .Data2 = 41406,
    .Data3 = 17177,
    .Data4 = [8]Uint8{
        178,
        189,
        198,
        98,
        209,
        204,
        25,
        228,
    },
};
pub const DRAW_FLAG_NONE: c_int = 0;
pub const DRAW_FLAG_VERIFY_STATES: c_int = 1;
pub const DRAW_FLAG_VERIFY_DRAW_ATTRIBS: c_int = 2;
pub const DRAW_FLAG_VERIFY_ALL: c_int = 3;
pub const DRAW_FLAG_DYNAMIC_RESOURCE_BUFFERS_INTACT: c_int = 4;
pub const DRAW_FLAG_INLINE_CONSTANTS_INTACT: c_int = 8;
pub const DRAW_FLAG_DYNAMIC_BUFFERS_AND_INLINE_CONSTANTS_INTACT: c_int = 12;
pub const enum__DRAW_FLAGS = c_uint;
pub const RESOURCE_STATE_TRANSITION_MODE_NONE: c_int = 0;
pub const RESOURCE_STATE_TRANSITION_MODE_TRANSITION: c_int = 1;
pub const RESOURCE_STATE_TRANSITION_MODE_VERIFY: c_int = 2;
pub const enum__RESOURCE_STATE_TRANSITION_MODE = c_uint;
pub const CLEAR_DEPTH_FLAG_NONE: c_int = 0;
pub const CLEAR_DEPTH_FLAG: c_int = 1;
pub const CLEAR_STENCIL_FLAG: c_int = 2;
pub const enum__CLEAR_DEPTH_STENCIL_FLAGS = c_uint;
pub const SET_VERTEX_BUFFERS_FLAG_NONE: c_int = 0;
pub const SET_VERTEX_BUFFERS_FLAG_RESET: c_int = 1;
pub const enum__SET_VERTEX_BUFFERS_FLAGS = c_uint;
pub const RAYTRACING_INSTANCE_NONE: c_int = 0;
pub const RAYTRACING_INSTANCE_TRIANGLE_FACING_CULL_DISABLE: c_int = 1;
pub const RAYTRACING_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE: c_int = 2;
pub const RAYTRACING_INSTANCE_FORCE_OPAQUE: c_int = 4;
pub const RAYTRACING_INSTANCE_FORCE_NO_OPAQUE: c_int = 8;
pub const RAYTRACING_INSTANCE_FLAG_LAST: c_int = 8;
pub const enum__RAYTRACING_INSTANCE_FLAGS = c_uint;
pub const COPY_AS_MODE_CLONE: c_int = 0;
pub const COPY_AS_MODE_COMPACT: c_int = 1;
pub const COPY_AS_MODE_LAST: c_int = 1;
pub const enum__COPY_AS_MODE = c_uint;
pub const RAYTRACING_GEOMETRY_FLAG_NONE: c_int = 0;
pub const RAYTRACING_GEOMETRY_FLAG_OPAQUE: c_int = 1;
pub const RAYTRACING_GEOMETRY_FLAG_NO_DUPLICATE_ANY_HIT_INVOCATION: c_int = 2;
pub const RAYTRACING_GEOMETRY_FLAG_LAST: c_int = 2;
pub const enum__RAYTRACING_GEOMETRY_FLAGS = c_uint;
pub const TLAS_INSTANCE_OFFSET_AUTO: Uint32 = DILIGENT_TLAS_INSTANCE_OFFSET_AUTO;
pub const TLAS_INSTANCE_DATA_SIZE: Uint32 = DILIGENT_TLAS_INSTANCE_DATA_SIZE;
pub const REMAINING_MIP_LEVELS: Uint32 = DILIGENT_REMAINING_MIP_LEVELS;
pub const REMAINING_ARRAY_SLICES: Uint32 = DILIGENT_REMAINING_ARRAY_SLICES;
pub const STATE_TRANSITION_FLAG_NONE: c_int = 0;
pub const STATE_TRANSITION_FLAG_UPDATE_STATE: c_int = 1;
pub const STATE_TRANSITION_FLAG_DISCARD_CONTENT: c_int = 2;
pub const STATE_TRANSITION_FLAG_ALIASING: c_int = 4;
pub const enum__STATE_TRANSITION_FLAGS = c_uint;
pub const IDeviceContext = struct_IDeviceContext;
pub const IDeviceContextVtbl = struct_IDeviceContextVtbl;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_NO_THREADS__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_CLANG__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const TARGET_OS_WIN32 = @as(c_int, 0);
pub const TARGET_OS_WINDOWS = @as(c_int, 0);
pub const TARGET_OS_LINUX = @as(c_int, 0);
pub const TARGET_OS_UNIX = @as(c_int, 0);
pub const TARGET_OS_MAC = @as(c_int, 1);
pub const TARGET_OS_OSX = @as(c_int, 1);
pub const TARGET_OS_IPHONE = @as(c_int, 0);
pub const TARGET_OS_IOS = @as(c_int, 0);
pub const TARGET_OS_TV = @as(c_int, 0);
pub const TARGET_OS_WATCH = @as(c_int, 0);
pub const TARGET_OS_VISION = @as(c_int, 0);
pub const TARGET_OS_DRIVERKIT = @as(c_int, 0);
pub const TARGET_OS_MACCATALYST = @as(c_int, 0);
pub const TARGET_OS_SIMULATOR = @as(c_int, 0);
pub const TARGET_OS_EMBEDDED = @as(c_int, 0);
pub const TARGET_OS_NANO = @as(c_int, 0);
pub const TARGET_IPHONE_SIMULATOR = @as(c_int, 0);
pub const TARGET_OS_UIKITFORMAC = @as(c_int, 0);
pub const TARGET_OS_UEFI = @as(c_int, 0);
pub const __APPLE__ = @as(c_int, 1);
pub const __APPLE_CC__ = @as(c_int, 6000);
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = __helpers.promoteIntLiteral(c_int, 270200, .decimal);
pub const __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__ = __helpers.promoteIntLiteral(c_int, 270200, .decimal);
pub const __aarch64__ = @as(c_int, 1);
pub const __ARM_64BIT_STATE = @as(c_int, 1);
pub const __ARM_ARCH_ISA_A64 = @as(c_int, 1);
pub const __ARM_FEATURE_CLZ = @as(c_int, 1);
pub const __ARM_FEATURE_FMA = @as(c_int, 1);
pub const __ARM_FEATURE_LDREX = @as(c_int, 0xf);
pub const __ARM_FEATURE_IDIV = @as(c_int, 1);
pub const __ARM_FEATURE_DIV = @as(c_int, 1);
pub const __ARM_STATE_ZA = @as(c_int, 1);
pub const __ARM_STATE_ZT0 = @as(c_int, 1);
pub const __ARM_ALIGN_MAX_STACK_PWR = @as(c_int, 4);
pub const __ARM_FEATURE_NUMERIC_MAXMIN = @as(c_int, 1);
pub const __ARM_FEATURE_DIRECTED_ROUNDING = @as(c_int, 1);
pub inline fn __ARM_ACLE_VERSION(year: anytype, quarter: anytype, patch: anytype) @TypeOf(((@as(c_int, 100) * year) + (@as(c_int, 10) * quarter)) + patch) {
    _ = &year;
    _ = &quarter;
    _ = &patch;
    return ((@as(c_int, 100) * year) + (@as(c_int, 10) * quarter)) + patch;
}
pub const __ARM_ACLE = __helpers.promoteIntLiteral(c_int, 202420, .decimal);
pub const __ARM_ARCH = @as(c_int, 8);
pub const __ARM_ARCH_PROFILE = 'A';
pub const __ARM_FEATURE_COMPLEX = @as(c_int, 1);
pub const __ARM_FEATURE_JCVT = @as(c_int, 1);
pub const __AARCH64EL__ = @as(c_int, 1);
pub const __AARCH64_SIMD__ = @as(c_int, 1);
pub const __ARM64_ARCH_8__ = @as(c_int, 1);
pub const __ARM_NEON__ = @as(c_int, 1);
pub const __arm64 = @as(c_int, 1);
pub const __arm64__ = @as(c_int, 1);
pub const __AARCH64_CMODEL_SMALL__ = @as(c_int, 1);
pub const __ARM_FP = @as(c_int, 0xE);
pub const __ARM_NEON = @as(c_int, 1);
pub const __ARM_NEON_FP = @as(c_int, 0xE);
pub const __ARM_FEATURE_BF16 = @as(c_int, 1);
pub const __ARM_FEATURE_BF16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_BF16_FORMAT_ALTERNATIVE = @as(c_int, 1);
pub const __ARM_FEATURE_BF16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_SME = @as(c_int, 1);
pub const __ARM_FEATURE_LOCALLY_STREAMING = @as(c_int, 1);
pub const __ARM_FEATURE_SHA3 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA512 = @as(c_int, 1);
pub const __ARM_FEATURE_UNALIGNED = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_RCPC = @as(c_int, 1);
pub const __ARM_FEATURE_SME2 = @as(c_int, 1);
pub const __ARM_FEATURE_CRC32 = @as(c_int, 1);
pub const __ARM_FEATURE_AES = @as(c_int, 1);
pub const __ARM_FEATURE_SHA2 = @as(c_int, 1);
pub const __ARM_FEATURE_PAUTH = @as(c_int, 1);
pub const __ARM_FEATURE_BTI = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_DOTPROD = @as(c_int, 1);
pub const __ARM_FEATURE_MATMUL_INT8 = @as(c_int, 1);
pub const __ARM_FEATURE_ATOMICS = @as(c_int, 1);
pub const __ARM_FEATURE_SVE_MATMUL_INT8 = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_FML = @as(c_int, 1);
pub const __ARM_SIZEOF_MINIMAL_ENUM = @as(c_int, 4);
pub const __ARM_SIZEOF_WCHAR_T = @as(c_int, 4);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __MACH__ = @as(c_int, 1);
pub const __nonnull = @compileError("unable to translate C expr: unexpected token '_Nonnull'");
// <builtin>:106:9
pub const __null_unspecified = @compileError("unable to translate C expr: unexpected token '_Null_unspecified'");
// <builtin>:107:9
pub const __nullable = @compileError("unable to translate C expr: unexpected token '_Nullable'");
// <builtin>:108:9
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_long;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// <builtin>:173:9
pub const __INTMAX_C = __helpers.L_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// <builtin>:176:9
pub const __UINTMAX_C = __helpers.UL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_long;
pub const __SIZE_TYPE__ = c_ulong;
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_int;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// <builtin>:202:9
pub const __INT64_C = __helpers.LL_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// <builtin>:227:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// <builtin>:236:9
pub const __UINT64_C = __helpers.ULL_SUFFIX;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "lld";
pub const INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_LEAST64_FMTo__ = "llo";
pub const UINT_LEAST64_FMTu__ = "llu";
pub const UINT_LEAST64_FMTx__ = "llx";
pub const UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "lld";
pub const INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_FAST64_FMTo__ = "llo";
pub const UINT_FAST64_FMTu__ = "llu";
pub const UINT_FAST64_FMTx__ = "llx";
pub const UINT_FAST64_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 4.9406564584124654e-324);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 15);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 2.2204460492503131e-16);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 53);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __LDBL_MAX_EXP__ = @as(c_int, 1024);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __LDBL_MIN__ = @as(c_longdouble, 2.2250738585072014e-308);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __pic__ = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __BLOCKS__ = @as(c_int, 1);
pub const PLATFORM_MACOS = @as(c_int, 1);
pub const _STRING_H_ = "";
pub const _LIBC_BOUNDS_H_ = "";
pub const _CDEFS_H_ = "";
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __has_cpp_attribute(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    _ = &protos;
    return protos;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:116:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token ''");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:117:9
pub const __const = @compileError("unable to translate C expr: unexpected token 'const'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:119:9
pub const __signed = c_int;
pub const __volatile = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:121:9
pub const __dead2 = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:165:9
pub const __pure2 = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:166:9
pub const __stateful_pure = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:167:9
pub const __unused = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:172:9
pub const __used = @compileError("unable to translate macro: undefined identifier `__used__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:177:9
pub const __cold = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:183:9
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `returns_nonnull`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:190:9
pub const __exported = @compileError("unable to translate macro: undefined identifier `__visibility__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:200:9
pub const __exported_push = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:201:9
pub const __exported_push_hidden = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:203:9
pub const __exported_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:204:9
pub const __exported_hidden = @compileError("unable to translate macro: undefined identifier `__private_extern__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:205:9
pub const __deprecated = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:223:9
pub const __deprecated_msg = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:227:10
pub inline fn __deprecated_enum_msg(_msg: anytype) @TypeOf(__deprecated_msg(_msg)) {
    _ = &_msg;
    return __deprecated_msg(_msg);
}
pub inline fn __kpi_deprecated(_msg: anytype) void {
    _ = &_msg;
    return;
}
pub const __unavailable = @compileError("unable to translate macro: undefined identifier `__unavailable__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:244:9
pub const __kpi_unavailable = "";
pub const __kpi_deprecated_arm64_macos_unavailable = "";
pub const __dead = "";
pub const __pure = "";
pub const __restrict = @compileError("unable to translate C expr: unexpected token 'restrict'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:266:9
pub const __disable_tail_calls = "";
pub const __not_tail_called = "";
pub const __result_use_check = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:322:9
pub const __swift_unavailable = @compileError("unable to translate macro: undefined identifier `__availability__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:332:9
pub inline fn __swift_unavailable_from_async(_msg: anytype) void {
    _ = &_msg;
    return;
}
pub const __swift_nonisolated = "";
pub const __swift_nonisolated_unsafe = "";
pub const __abortlike = __dead2 ++ __cold;
pub const __header_inline = @compileError("unable to translate C expr: unexpected token 'extern'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:383:10
pub const __header_always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:392:10
pub const __unreachable_ok_push = "";
pub const __unreachable_ok_pop = "";
pub const __printflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:429:9
pub const __printf0like = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:431:9
pub const __scanflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:433:9
pub const __osloglike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:435:9
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token 'static'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:438:9
pub const __COPYRIGHT = @compileError("unable to translate macro: undefined identifier `copyright`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:441:9
pub const __RCSID = @compileError("unable to translate macro: undefined identifier `rcsid`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:445:9
pub const __SCCSID = @compileError("unable to translate macro: undefined identifier `sccsid`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:449:9
pub const __PROJECT_VERSION = @compileError("unable to translate macro: undefined identifier `project_version`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:453:9
pub inline fn __FBSDID(s: anytype) void {
    _ = &s;
    return;
}
pub const __DECONST = @compileError("unable to translate C expr: unexpected token 'const'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:462:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:466:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token 'const'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:470:9
pub const __alloc_align = @compileError("unable to translate macro: undefined identifier `alloc_align`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:479:9
pub const __alloc_size = @compileError("unable to translate macro: undefined identifier `alloc_size`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:500:9
pub const __has_safe_buffers = @as(c_int, 0);
pub const __unsafe_buffer_usage = "";
pub const __unsafe_buffer_usage_begin = "";
pub const __unsafe_buffer_usage_end = "";
pub const __DARWIN_ONLY_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const __DARWIN_ONLY_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_UNIX03 = @as(c_int, 1);
pub const __DARWIN_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_NON_CANCELABLE = @as(c_int, 0);
pub const __DARWIN_SUF_UNIX03 = "";
pub const __DARWIN_SUF_64_BIT_INO_T = "";
pub const __DARWIN_SUF_1050 = "";
pub const __DARWIN_SUF_NON_CANCELABLE = "";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub const __DARWIN_ALIAS = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:790:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:791:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:792:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:793:9
pub const __DARWIN_INODE64 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:794:9
pub const __DARWIN_1050 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:796:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:797:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:798:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:799:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:800:9
pub const __DARWIN_EXTSN = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:802:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:803:9
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_7(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_7(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_8(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_7(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_8(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_7(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_7(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_19_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_1(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_2(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_3(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_4(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_5(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_26_6(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_27_0(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_16(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_14_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_15_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_16_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_26_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_27_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate macro: undefined identifier `__DARWIN_ALIAS_STARTING_MAC_`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:813:9
pub const ___POSIX_C_DEPRECATED_STARTING_198808L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199009L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199209L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199309L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199506L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200112L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200809L = "";
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate macro: undefined identifier `___POSIX_C_DEPRECATED_STARTING_`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:876:9
pub const __DARWIN_C_ANSI = @as(c_long, 0o10000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = @as(c_int, 1);
pub const __DARWIN_NO_LONG_LONG = @as(c_int, 0);
pub const _DARWIN_FEATURE_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_VERS_1050 = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = @as(c_int, 3);
pub const __CAST_AWAY_QUALIFIER = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:974:9
pub const __XNU_PRIVATE_EXTERN = @compileError("unable to translate macro: undefined identifier `visibility`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:988:9
pub const __has_ptrcheck = @as(c_int, 0);
pub const __single = "";
pub const __unsafe_indexable = "";
pub inline fn __counted_by(N: anytype) void {
    _ = &N;
    return;
}
pub inline fn __counted_by_or_null(N: anytype) void {
    _ = &N;
    return;
}
pub inline fn __sized_by(N: anytype) void {
    _ = &N;
    return;
}
pub inline fn __sized_by_or_null(N: anytype) void {
    _ = &N;
    return;
}
pub inline fn __ended_by(E: anytype) void {
    _ = &E;
    return;
}
pub inline fn __terminated_by(T: anytype) void {
    _ = &T;
    return;
}
pub const __null_terminated = "";
pub inline fn __ptrcheck_abi_assume_single() void {
    return;
}
pub inline fn __ptrcheck_abi_assume_unsafe_indexable() void {
    return;
}
pub inline fn __unsafe_forge_bidi_indexable(T: anytype, P: anytype, S: anytype) @TypeOf(T(P)) {
    _ = &T;
    _ = &P;
    _ = &S;
    return T(P);
}
pub const __unsafe_forge_single = __helpers.CAST_OR_CALL;
pub inline fn __unsafe_forge_terminated_by(T: anytype, P: anytype, E: anytype) @TypeOf(T(P)) {
    _ = &T;
    _ = &P;
    _ = &E;
    return T(P);
}
pub const __unsafe_forge_null_terminated = __helpers.CAST_OR_CALL;
pub inline fn __terminated_by_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __unsafe_terminated_by_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __null_terminated_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __unsafe_null_terminated_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __unsafe_terminated_by_from_indexable(T: anytype, P: anytype) @TypeOf(P) {
    _ = &T;
    _ = &P;
    return P;
}
pub inline fn __unsafe_null_terminated_from_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub const __array_decay_dicards_count_in_parameters = "";
pub const __ptrcheck_unavailable = "";
pub inline fn __ptrcheck_unavailable_r(REPLACEMENT: anytype) void {
    _ = &REPLACEMENT;
    return;
}
pub const __ASSUME_PTR_ABI_SINGLE_BEGIN = __ptrcheck_abi_assume_single();
pub const __ASSUME_PTR_ABI_SINGLE_END = __ptrcheck_abi_assume_unsafe_indexable();
pub const __header_indexable = "";
pub const __header_bidi_indexable = "";
pub const __compiler_barrier = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:1073:9
pub const __enum_open = "";
pub const __enum_closed = "";
pub const __enum_options = "";
pub const __enum_decl = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:1106:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:1108:9
pub const __options_decl = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:1110:9
pub const __options_closed_decl = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/cdefs.h:1112:9
pub const __kernel_ptr_semantics = "";
pub const __kernel_data_semantics = "";
pub const __kernel_dual_semantics = "";
pub const __xnu_data_size = "";
pub const __xnu_returns_data_pointer = "";
pub inline fn _LIBC_COUNT(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _LIBC_COUNT_OR_NULL(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _LIBC_SIZE(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _LIBC_SIZE_OR_NULL(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _LIBC_ENDED_BY(x: anytype) void {
    _ = &x;
    return;
}
pub const _LIBC_SINGLE = "";
pub const _LIBC_UNSAFE_INDEXABLE = "";
pub const _LIBC_CSTR = "";
pub const _LIBC_NULL_TERMINATED = "";
pub inline fn _LIBC_FLEX_COUNT(FIELD: anytype, INTCOUNT: anytype) @TypeOf(INTCOUNT) {
    _ = &FIELD;
    _ = &INTCOUNT;
    return INTCOUNT;
}
pub inline fn _LIBC_SINGLE_BY_DEFAULT() void {
    return;
}
pub inline fn _LIBC_PTRCHECK_REPLACED(R: anytype) void {
    _ = &R;
    return;
}
pub inline fn _LIBC_FORGE_PTR(P: anytype, S: anytype) @TypeOf(P) {
    _ = &P;
    _ = &S;
    return P;
}
pub const __TYPES_H_ = "";
pub const _SYS__TYPES_H_ = "";
pub const _BSD_MACHINE__TYPES_H_ = "";
pub const _BSD_ARM__TYPES_H_ = "";
pub const __DARWIN_NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const _SYS__PTHREAD_TYPES_H_ = "";
pub const __PTHREAD_SIZE__ = @as(c_int, 8176);
pub const __PTHREAD_ATTR_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_MUTEXATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_MUTEX_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_CONDATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_COND_SIZE__ = @as(c_int, 40);
pub const __PTHREAD_ONCE_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_RWLOCK_SIZE__ = @as(c_int, 192);
pub const __PTHREAD_RWLOCKATTR_SIZE__ = @as(c_int, 16);
pub const __offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/_types.h:97:9
pub const __strfmonlike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/_types.h:34:9
pub const __strftimelike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/_types.h:36:9
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -__helpers.promoteIntLiteral(c_int, 0x7fffffff, .hex) - @as(c_int, 1);
pub const __DARWIN_WEOF = __helpers.cast(__darwin_wint_t, -@as(c_int, 1));
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const __AVAILABILITY__ = "";
pub const __API_TO_BE_DEPRECATED = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACOS = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACOSAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_IOS = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_IOSAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACCATALYST = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACCATALYSTAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_WATCHOS = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_WATCHOSAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_TVOS = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_TVOSAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_DRIVERKIT = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_VISIONOS = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_VISIONOSAPPLICATIONEXTENSION = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_KERNELKIT = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __AVAILABILITY_VERSIONS__ = "";
pub const __MAC_10_0 = @as(c_int, 1000);
pub const __MAC_10_1 = @as(c_int, 1010);
pub const __MAC_10_2 = @as(c_int, 1020);
pub const __MAC_10_3 = @as(c_int, 1030);
pub const __MAC_10_4 = @as(c_int, 1040);
pub const __MAC_10_5 = @as(c_int, 1050);
pub const __MAC_10_6 = @as(c_int, 1060);
pub const __MAC_10_7 = @as(c_int, 1070);
pub const __MAC_10_8 = @as(c_int, 1080);
pub const __MAC_10_9 = @as(c_int, 1090);
pub const __MAC_10_10 = __helpers.promoteIntLiteral(c_int, 101000, .decimal);
pub const __MAC_10_10_2 = __helpers.promoteIntLiteral(c_int, 101002, .decimal);
pub const __MAC_10_10_3 = __helpers.promoteIntLiteral(c_int, 101003, .decimal);
pub const __MAC_10_11 = __helpers.promoteIntLiteral(c_int, 101100, .decimal);
pub const __MAC_10_11_2 = __helpers.promoteIntLiteral(c_int, 101102, .decimal);
pub const __MAC_10_11_3 = __helpers.promoteIntLiteral(c_int, 101103, .decimal);
pub const __MAC_10_11_4 = __helpers.promoteIntLiteral(c_int, 101104, .decimal);
pub const __MAC_10_12 = __helpers.promoteIntLiteral(c_int, 101200, .decimal);
pub const __MAC_10_12_1 = __helpers.promoteIntLiteral(c_int, 101201, .decimal);
pub const __MAC_10_12_2 = __helpers.promoteIntLiteral(c_int, 101202, .decimal);
pub const __MAC_10_12_4 = __helpers.promoteIntLiteral(c_int, 101204, .decimal);
pub const __MAC_10_13 = __helpers.promoteIntLiteral(c_int, 101300, .decimal);
pub const __MAC_10_13_1 = __helpers.promoteIntLiteral(c_int, 101301, .decimal);
pub const __MAC_10_13_2 = __helpers.promoteIntLiteral(c_int, 101302, .decimal);
pub const __MAC_10_13_4 = __helpers.promoteIntLiteral(c_int, 101304, .decimal);
pub const __MAC_10_14 = __helpers.promoteIntLiteral(c_int, 101400, .decimal);
pub const __MAC_10_14_1 = __helpers.promoteIntLiteral(c_int, 101401, .decimal);
pub const __MAC_10_14_4 = __helpers.promoteIntLiteral(c_int, 101404, .decimal);
pub const __MAC_10_14_5 = __helpers.promoteIntLiteral(c_int, 101405, .decimal);
pub const __MAC_10_14_6 = __helpers.promoteIntLiteral(c_int, 101406, .decimal);
pub const __MAC_10_15 = __helpers.promoteIntLiteral(c_int, 101500, .decimal);
pub const __MAC_10_15_1 = __helpers.promoteIntLiteral(c_int, 101501, .decimal);
pub const __MAC_10_15_4 = __helpers.promoteIntLiteral(c_int, 101504, .decimal);
pub const __MAC_10_16 = __helpers.promoteIntLiteral(c_int, 101600, .decimal);
pub const __MAC_11_0 = __helpers.promoteIntLiteral(c_int, 110000, .decimal);
pub const __MAC_11_1 = __helpers.promoteIntLiteral(c_int, 110100, .decimal);
pub const __MAC_11_3 = __helpers.promoteIntLiteral(c_int, 110300, .decimal);
pub const __MAC_11_4 = __helpers.promoteIntLiteral(c_int, 110400, .decimal);
pub const __MAC_11_5 = __helpers.promoteIntLiteral(c_int, 110500, .decimal);
pub const __MAC_11_6 = __helpers.promoteIntLiteral(c_int, 110600, .decimal);
pub const __MAC_12_0 = __helpers.promoteIntLiteral(c_int, 120000, .decimal);
pub const __MAC_12_1 = __helpers.promoteIntLiteral(c_int, 120100, .decimal);
pub const __MAC_12_2 = __helpers.promoteIntLiteral(c_int, 120200, .decimal);
pub const __MAC_12_3 = __helpers.promoteIntLiteral(c_int, 120300, .decimal);
pub const __MAC_12_4 = __helpers.promoteIntLiteral(c_int, 120400, .decimal);
pub const __MAC_12_5 = __helpers.promoteIntLiteral(c_int, 120500, .decimal);
pub const __MAC_12_6 = __helpers.promoteIntLiteral(c_int, 120600, .decimal);
pub const __MAC_12_7 = __helpers.promoteIntLiteral(c_int, 120700, .decimal);
pub const __MAC_13_0 = __helpers.promoteIntLiteral(c_int, 130000, .decimal);
pub const __MAC_13_1 = __helpers.promoteIntLiteral(c_int, 130100, .decimal);
pub const __MAC_13_2 = __helpers.promoteIntLiteral(c_int, 130200, .decimal);
pub const __MAC_13_3 = __helpers.promoteIntLiteral(c_int, 130300, .decimal);
pub const __MAC_13_4 = __helpers.promoteIntLiteral(c_int, 130400, .decimal);
pub const __MAC_13_5 = __helpers.promoteIntLiteral(c_int, 130500, .decimal);
pub const __MAC_13_6 = __helpers.promoteIntLiteral(c_int, 130600, .decimal);
pub const __MAC_13_7 = __helpers.promoteIntLiteral(c_int, 130700, .decimal);
pub const __MAC_14_0 = __helpers.promoteIntLiteral(c_int, 140000, .decimal);
pub const __MAC_14_1 = __helpers.promoteIntLiteral(c_int, 140100, .decimal);
pub const __MAC_14_2 = __helpers.promoteIntLiteral(c_int, 140200, .decimal);
pub const __MAC_14_3 = __helpers.promoteIntLiteral(c_int, 140300, .decimal);
pub const __MAC_14_4 = __helpers.promoteIntLiteral(c_int, 140400, .decimal);
pub const __MAC_14_5 = __helpers.promoteIntLiteral(c_int, 140500, .decimal);
pub const __MAC_14_6 = __helpers.promoteIntLiteral(c_int, 140600, .decimal);
pub const __MAC_14_7 = __helpers.promoteIntLiteral(c_int, 140700, .decimal);
pub const __MAC_15_0 = __helpers.promoteIntLiteral(c_int, 150000, .decimal);
pub const __MAC_15_1 = __helpers.promoteIntLiteral(c_int, 150100, .decimal);
pub const __MAC_15_2 = __helpers.promoteIntLiteral(c_int, 150200, .decimal);
pub const __MAC_15_3 = __helpers.promoteIntLiteral(c_int, 150300, .decimal);
pub const __MAC_15_4 = __helpers.promoteIntLiteral(c_int, 150400, .decimal);
pub const __MAC_15_5 = __helpers.promoteIntLiteral(c_int, 150500, .decimal);
pub const __MAC_15_6 = __helpers.promoteIntLiteral(c_int, 150600, .decimal);
pub const __MAC_16_0 = __helpers.promoteIntLiteral(c_int, 160000, .decimal);
pub const __MAC_26_0 = __helpers.promoteIntLiteral(c_int, 260000, .decimal);
pub const __MAC_26_1 = __helpers.promoteIntLiteral(c_int, 260100, .decimal);
pub const __MAC_26_2 = __helpers.promoteIntLiteral(c_int, 260200, .decimal);
pub const __MAC_26_3 = __helpers.promoteIntLiteral(c_int, 260300, .decimal);
pub const __MAC_26_4 = __helpers.promoteIntLiteral(c_int, 260400, .decimal);
pub const __MAC_26_5 = __helpers.promoteIntLiteral(c_int, 260500, .decimal);
pub const __MAC_26_6 = __helpers.promoteIntLiteral(c_int, 260600, .decimal);
pub const __MAC_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const __IPHONE_2_0 = @as(c_int, 20000);
pub const __IPHONE_2_1 = @as(c_int, 20100);
pub const __IPHONE_2_2 = @as(c_int, 20200);
pub const __IPHONE_3_0 = @as(c_int, 30000);
pub const __IPHONE_3_1 = @as(c_int, 30100);
pub const __IPHONE_3_2 = @as(c_int, 30200);
pub const __IPHONE_4_0 = __helpers.promoteIntLiteral(c_int, 40000, .decimal);
pub const __IPHONE_4_1 = __helpers.promoteIntLiteral(c_int, 40100, .decimal);
pub const __IPHONE_4_2 = __helpers.promoteIntLiteral(c_int, 40200, .decimal);
pub const __IPHONE_4_3 = __helpers.promoteIntLiteral(c_int, 40300, .decimal);
pub const __IPHONE_5_0 = __helpers.promoteIntLiteral(c_int, 50000, .decimal);
pub const __IPHONE_5_1 = __helpers.promoteIntLiteral(c_int, 50100, .decimal);
pub const __IPHONE_6_0 = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const __IPHONE_6_1 = __helpers.promoteIntLiteral(c_int, 60100, .decimal);
pub const __IPHONE_7_0 = __helpers.promoteIntLiteral(c_int, 70000, .decimal);
pub const __IPHONE_7_1 = __helpers.promoteIntLiteral(c_int, 70100, .decimal);
pub const __IPHONE_8_0 = __helpers.promoteIntLiteral(c_int, 80000, .decimal);
pub const __IPHONE_8_1 = __helpers.promoteIntLiteral(c_int, 80100, .decimal);
pub const __IPHONE_8_2 = __helpers.promoteIntLiteral(c_int, 80200, .decimal);
pub const __IPHONE_8_3 = __helpers.promoteIntLiteral(c_int, 80300, .decimal);
pub const __IPHONE_8_4 = __helpers.promoteIntLiteral(c_int, 80400, .decimal);
pub const __IPHONE_9_0 = __helpers.promoteIntLiteral(c_int, 90000, .decimal);
pub const __IPHONE_9_1 = __helpers.promoteIntLiteral(c_int, 90100, .decimal);
pub const __IPHONE_9_2 = __helpers.promoteIntLiteral(c_int, 90200, .decimal);
pub const __IPHONE_9_3 = __helpers.promoteIntLiteral(c_int, 90300, .decimal);
pub const __IPHONE_10_0 = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __IPHONE_10_1 = __helpers.promoteIntLiteral(c_int, 100100, .decimal);
pub const __IPHONE_10_2 = __helpers.promoteIntLiteral(c_int, 100200, .decimal);
pub const __IPHONE_10_3 = __helpers.promoteIntLiteral(c_int, 100300, .decimal);
pub const __IPHONE_11_0 = __helpers.promoteIntLiteral(c_int, 110000, .decimal);
pub const __IPHONE_11_1 = __helpers.promoteIntLiteral(c_int, 110100, .decimal);
pub const __IPHONE_11_2 = __helpers.promoteIntLiteral(c_int, 110200, .decimal);
pub const __IPHONE_11_3 = __helpers.promoteIntLiteral(c_int, 110300, .decimal);
pub const __IPHONE_11_4 = __helpers.promoteIntLiteral(c_int, 110400, .decimal);
pub const __IPHONE_12_0 = __helpers.promoteIntLiteral(c_int, 120000, .decimal);
pub const __IPHONE_12_1 = __helpers.promoteIntLiteral(c_int, 120100, .decimal);
pub const __IPHONE_12_2 = __helpers.promoteIntLiteral(c_int, 120200, .decimal);
pub const __IPHONE_12_3 = __helpers.promoteIntLiteral(c_int, 120300, .decimal);
pub const __IPHONE_12_4 = __helpers.promoteIntLiteral(c_int, 120400, .decimal);
pub const __IPHONE_13_0 = __helpers.promoteIntLiteral(c_int, 130000, .decimal);
pub const __IPHONE_13_1 = __helpers.promoteIntLiteral(c_int, 130100, .decimal);
pub const __IPHONE_13_2 = __helpers.promoteIntLiteral(c_int, 130200, .decimal);
pub const __IPHONE_13_3 = __helpers.promoteIntLiteral(c_int, 130300, .decimal);
pub const __IPHONE_13_4 = __helpers.promoteIntLiteral(c_int, 130400, .decimal);
pub const __IPHONE_13_5 = __helpers.promoteIntLiteral(c_int, 130500, .decimal);
pub const __IPHONE_13_6 = __helpers.promoteIntLiteral(c_int, 130600, .decimal);
pub const __IPHONE_13_7 = __helpers.promoteIntLiteral(c_int, 130700, .decimal);
pub const __IPHONE_14_0 = __helpers.promoteIntLiteral(c_int, 140000, .decimal);
pub const __IPHONE_14_1 = __helpers.promoteIntLiteral(c_int, 140100, .decimal);
pub const __IPHONE_14_2 = __helpers.promoteIntLiteral(c_int, 140200, .decimal);
pub const __IPHONE_14_3 = __helpers.promoteIntLiteral(c_int, 140300, .decimal);
pub const __IPHONE_14_5 = __helpers.promoteIntLiteral(c_int, 140500, .decimal);
pub const __IPHONE_14_6 = __helpers.promoteIntLiteral(c_int, 140600, .decimal);
pub const __IPHONE_14_7 = __helpers.promoteIntLiteral(c_int, 140700, .decimal);
pub const __IPHONE_14_8 = __helpers.promoteIntLiteral(c_int, 140800, .decimal);
pub const __IPHONE_15_0 = __helpers.promoteIntLiteral(c_int, 150000, .decimal);
pub const __IPHONE_15_1 = __helpers.promoteIntLiteral(c_int, 150100, .decimal);
pub const __IPHONE_15_2 = __helpers.promoteIntLiteral(c_int, 150200, .decimal);
pub const __IPHONE_15_3 = __helpers.promoteIntLiteral(c_int, 150300, .decimal);
pub const __IPHONE_15_4 = __helpers.promoteIntLiteral(c_int, 150400, .decimal);
pub const __IPHONE_15_5 = __helpers.promoteIntLiteral(c_int, 150500, .decimal);
pub const __IPHONE_15_6 = __helpers.promoteIntLiteral(c_int, 150600, .decimal);
pub const __IPHONE_15_7 = __helpers.promoteIntLiteral(c_int, 150700, .decimal);
pub const __IPHONE_15_8 = __helpers.promoteIntLiteral(c_int, 150800, .decimal);
pub const __IPHONE_16_0 = __helpers.promoteIntLiteral(c_int, 160000, .decimal);
pub const __IPHONE_16_1 = __helpers.promoteIntLiteral(c_int, 160100, .decimal);
pub const __IPHONE_16_2 = __helpers.promoteIntLiteral(c_int, 160200, .decimal);
pub const __IPHONE_16_3 = __helpers.promoteIntLiteral(c_int, 160300, .decimal);
pub const __IPHONE_16_4 = __helpers.promoteIntLiteral(c_int, 160400, .decimal);
pub const __IPHONE_16_5 = __helpers.promoteIntLiteral(c_int, 160500, .decimal);
pub const __IPHONE_16_6 = __helpers.promoteIntLiteral(c_int, 160600, .decimal);
pub const __IPHONE_16_7 = __helpers.promoteIntLiteral(c_int, 160700, .decimal);
pub const __IPHONE_17_0 = __helpers.promoteIntLiteral(c_int, 170000, .decimal);
pub const __IPHONE_17_1 = __helpers.promoteIntLiteral(c_int, 170100, .decimal);
pub const __IPHONE_17_2 = __helpers.promoteIntLiteral(c_int, 170200, .decimal);
pub const __IPHONE_17_3 = __helpers.promoteIntLiteral(c_int, 170300, .decimal);
pub const __IPHONE_17_4 = __helpers.promoteIntLiteral(c_int, 170400, .decimal);
pub const __IPHONE_17_5 = __helpers.promoteIntLiteral(c_int, 170500, .decimal);
pub const __IPHONE_17_6 = __helpers.promoteIntLiteral(c_int, 170600, .decimal);
pub const __IPHONE_17_7 = __helpers.promoteIntLiteral(c_int, 170700, .decimal);
pub const __IPHONE_18_0 = __helpers.promoteIntLiteral(c_int, 180000, .decimal);
pub const __IPHONE_18_1 = __helpers.promoteIntLiteral(c_int, 180100, .decimal);
pub const __IPHONE_18_2 = __helpers.promoteIntLiteral(c_int, 180200, .decimal);
pub const __IPHONE_18_3 = __helpers.promoteIntLiteral(c_int, 180300, .decimal);
pub const __IPHONE_18_4 = __helpers.promoteIntLiteral(c_int, 180400, .decimal);
pub const __IPHONE_18_5 = __helpers.promoteIntLiteral(c_int, 180500, .decimal);
pub const __IPHONE_18_6 = __helpers.promoteIntLiteral(c_int, 180600, .decimal);
pub const __IPHONE_19_0 = __helpers.promoteIntLiteral(c_int, 190000, .decimal);
pub const __IPHONE_26_0 = __helpers.promoteIntLiteral(c_int, 260000, .decimal);
pub const __IPHONE_26_1 = __helpers.promoteIntLiteral(c_int, 260100, .decimal);
pub const __IPHONE_26_2 = __helpers.promoteIntLiteral(c_int, 260200, .decimal);
pub const __IPHONE_26_3 = __helpers.promoteIntLiteral(c_int, 260300, .decimal);
pub const __IPHONE_26_4 = __helpers.promoteIntLiteral(c_int, 260400, .decimal);
pub const __IPHONE_26_5 = __helpers.promoteIntLiteral(c_int, 260500, .decimal);
pub const __IPHONE_26_6 = __helpers.promoteIntLiteral(c_int, 260600, .decimal);
pub const __IPHONE_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const __WATCHOS_1_0 = @as(c_int, 10000);
pub const __WATCHOS_2_0 = @as(c_int, 20000);
pub const __WATCHOS_2_1 = @as(c_int, 20100);
pub const __WATCHOS_2_2 = @as(c_int, 20200);
pub const __WATCHOS_3_0 = @as(c_int, 30000);
pub const __WATCHOS_3_1 = @as(c_int, 30100);
pub const __WATCHOS_3_1_1 = @as(c_int, 30101);
pub const __WATCHOS_3_2 = @as(c_int, 30200);
pub const __WATCHOS_4_0 = __helpers.promoteIntLiteral(c_int, 40000, .decimal);
pub const __WATCHOS_4_1 = __helpers.promoteIntLiteral(c_int, 40100, .decimal);
pub const __WATCHOS_4_2 = __helpers.promoteIntLiteral(c_int, 40200, .decimal);
pub const __WATCHOS_4_3 = __helpers.promoteIntLiteral(c_int, 40300, .decimal);
pub const __WATCHOS_5_0 = __helpers.promoteIntLiteral(c_int, 50000, .decimal);
pub const __WATCHOS_5_1 = __helpers.promoteIntLiteral(c_int, 50100, .decimal);
pub const __WATCHOS_5_2 = __helpers.promoteIntLiteral(c_int, 50200, .decimal);
pub const __WATCHOS_5_3 = __helpers.promoteIntLiteral(c_int, 50300, .decimal);
pub const __WATCHOS_6_0 = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const __WATCHOS_6_1 = __helpers.promoteIntLiteral(c_int, 60100, .decimal);
pub const __WATCHOS_6_2 = __helpers.promoteIntLiteral(c_int, 60200, .decimal);
pub const __WATCHOS_7_0 = __helpers.promoteIntLiteral(c_int, 70000, .decimal);
pub const __WATCHOS_7_1 = __helpers.promoteIntLiteral(c_int, 70100, .decimal);
pub const __WATCHOS_7_2 = __helpers.promoteIntLiteral(c_int, 70200, .decimal);
pub const __WATCHOS_7_3 = __helpers.promoteIntLiteral(c_int, 70300, .decimal);
pub const __WATCHOS_7_4 = __helpers.promoteIntLiteral(c_int, 70400, .decimal);
pub const __WATCHOS_7_5 = __helpers.promoteIntLiteral(c_int, 70500, .decimal);
pub const __WATCHOS_7_6 = __helpers.promoteIntLiteral(c_int, 70600, .decimal);
pub const __WATCHOS_8_0 = __helpers.promoteIntLiteral(c_int, 80000, .decimal);
pub const __WATCHOS_8_1 = __helpers.promoteIntLiteral(c_int, 80100, .decimal);
pub const __WATCHOS_8_3 = __helpers.promoteIntLiteral(c_int, 80300, .decimal);
pub const __WATCHOS_8_4 = __helpers.promoteIntLiteral(c_int, 80400, .decimal);
pub const __WATCHOS_8_5 = __helpers.promoteIntLiteral(c_int, 80500, .decimal);
pub const __WATCHOS_8_6 = __helpers.promoteIntLiteral(c_int, 80600, .decimal);
pub const __WATCHOS_8_7 = __helpers.promoteIntLiteral(c_int, 80700, .decimal);
pub const __WATCHOS_8_8 = __helpers.promoteIntLiteral(c_int, 80800, .decimal);
pub const __WATCHOS_9_0 = __helpers.promoteIntLiteral(c_int, 90000, .decimal);
pub const __WATCHOS_9_1 = __helpers.promoteIntLiteral(c_int, 90100, .decimal);
pub const __WATCHOS_9_2 = __helpers.promoteIntLiteral(c_int, 90200, .decimal);
pub const __WATCHOS_9_3 = __helpers.promoteIntLiteral(c_int, 90300, .decimal);
pub const __WATCHOS_9_4 = __helpers.promoteIntLiteral(c_int, 90400, .decimal);
pub const __WATCHOS_9_5 = __helpers.promoteIntLiteral(c_int, 90500, .decimal);
pub const __WATCHOS_9_6 = __helpers.promoteIntLiteral(c_int, 90600, .decimal);
pub const __WATCHOS_10_0 = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __WATCHOS_10_1 = __helpers.promoteIntLiteral(c_int, 100100, .decimal);
pub const __WATCHOS_10_2 = __helpers.promoteIntLiteral(c_int, 100200, .decimal);
pub const __WATCHOS_10_3 = __helpers.promoteIntLiteral(c_int, 100300, .decimal);
pub const __WATCHOS_10_4 = __helpers.promoteIntLiteral(c_int, 100400, .decimal);
pub const __WATCHOS_10_5 = __helpers.promoteIntLiteral(c_int, 100500, .decimal);
pub const __WATCHOS_10_6 = __helpers.promoteIntLiteral(c_int, 100600, .decimal);
pub const __WATCHOS_10_7 = __helpers.promoteIntLiteral(c_int, 100700, .decimal);
pub const __WATCHOS_11_0 = __helpers.promoteIntLiteral(c_int, 110000, .decimal);
pub const __WATCHOS_11_1 = __helpers.promoteIntLiteral(c_int, 110100, .decimal);
pub const __WATCHOS_11_2 = __helpers.promoteIntLiteral(c_int, 110200, .decimal);
pub const __WATCHOS_11_3 = __helpers.promoteIntLiteral(c_int, 110300, .decimal);
pub const __WATCHOS_11_4 = __helpers.promoteIntLiteral(c_int, 110400, .decimal);
pub const __WATCHOS_11_5 = __helpers.promoteIntLiteral(c_int, 110500, .decimal);
pub const __WATCHOS_11_6 = __helpers.promoteIntLiteral(c_int, 110600, .decimal);
pub const __WATCHOS_12_0 = __helpers.promoteIntLiteral(c_int, 120000, .decimal);
pub const __WATCHOS_26_0 = __helpers.promoteIntLiteral(c_int, 260000, .decimal);
pub const __WATCHOS_26_1 = __helpers.promoteIntLiteral(c_int, 260100, .decimal);
pub const __WATCHOS_26_2 = __helpers.promoteIntLiteral(c_int, 260200, .decimal);
pub const __WATCHOS_26_3 = __helpers.promoteIntLiteral(c_int, 260300, .decimal);
pub const __WATCHOS_26_4 = __helpers.promoteIntLiteral(c_int, 260400, .decimal);
pub const __WATCHOS_26_5 = __helpers.promoteIntLiteral(c_int, 260500, .decimal);
pub const __WATCHOS_26_6 = __helpers.promoteIntLiteral(c_int, 260600, .decimal);
pub const __WATCHOS_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const __TVOS_9_0 = __helpers.promoteIntLiteral(c_int, 90000, .decimal);
pub const __TVOS_9_1 = __helpers.promoteIntLiteral(c_int, 90100, .decimal);
pub const __TVOS_9_2 = __helpers.promoteIntLiteral(c_int, 90200, .decimal);
pub const __TVOS_10_0 = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __TVOS_10_0_1 = __helpers.promoteIntLiteral(c_int, 100001, .decimal);
pub const __TVOS_10_1 = __helpers.promoteIntLiteral(c_int, 100100, .decimal);
pub const __TVOS_10_2 = __helpers.promoteIntLiteral(c_int, 100200, .decimal);
pub const __TVOS_11_0 = __helpers.promoteIntLiteral(c_int, 110000, .decimal);
pub const __TVOS_11_1 = __helpers.promoteIntLiteral(c_int, 110100, .decimal);
pub const __TVOS_11_2 = __helpers.promoteIntLiteral(c_int, 110200, .decimal);
pub const __TVOS_11_3 = __helpers.promoteIntLiteral(c_int, 110300, .decimal);
pub const __TVOS_11_4 = __helpers.promoteIntLiteral(c_int, 110400, .decimal);
pub const __TVOS_12_0 = __helpers.promoteIntLiteral(c_int, 120000, .decimal);
pub const __TVOS_12_1 = __helpers.promoteIntLiteral(c_int, 120100, .decimal);
pub const __TVOS_12_2 = __helpers.promoteIntLiteral(c_int, 120200, .decimal);
pub const __TVOS_12_3 = __helpers.promoteIntLiteral(c_int, 120300, .decimal);
pub const __TVOS_12_4 = __helpers.promoteIntLiteral(c_int, 120400, .decimal);
pub const __TVOS_13_0 = __helpers.promoteIntLiteral(c_int, 130000, .decimal);
pub const __TVOS_13_2 = __helpers.promoteIntLiteral(c_int, 130200, .decimal);
pub const __TVOS_13_3 = __helpers.promoteIntLiteral(c_int, 130300, .decimal);
pub const __TVOS_13_4 = __helpers.promoteIntLiteral(c_int, 130400, .decimal);
pub const __TVOS_14_0 = __helpers.promoteIntLiteral(c_int, 140000, .decimal);
pub const __TVOS_14_1 = __helpers.promoteIntLiteral(c_int, 140100, .decimal);
pub const __TVOS_14_2 = __helpers.promoteIntLiteral(c_int, 140200, .decimal);
pub const __TVOS_14_3 = __helpers.promoteIntLiteral(c_int, 140300, .decimal);
pub const __TVOS_14_5 = __helpers.promoteIntLiteral(c_int, 140500, .decimal);
pub const __TVOS_14_6 = __helpers.promoteIntLiteral(c_int, 140600, .decimal);
pub const __TVOS_14_7 = __helpers.promoteIntLiteral(c_int, 140700, .decimal);
pub const __TVOS_15_0 = __helpers.promoteIntLiteral(c_int, 150000, .decimal);
pub const __TVOS_15_1 = __helpers.promoteIntLiteral(c_int, 150100, .decimal);
pub const __TVOS_15_2 = __helpers.promoteIntLiteral(c_int, 150200, .decimal);
pub const __TVOS_15_3 = __helpers.promoteIntLiteral(c_int, 150300, .decimal);
pub const __TVOS_15_4 = __helpers.promoteIntLiteral(c_int, 150400, .decimal);
pub const __TVOS_15_5 = __helpers.promoteIntLiteral(c_int, 150500, .decimal);
pub const __TVOS_15_6 = __helpers.promoteIntLiteral(c_int, 150600, .decimal);
pub const __TVOS_16_0 = __helpers.promoteIntLiteral(c_int, 160000, .decimal);
pub const __TVOS_16_1 = __helpers.promoteIntLiteral(c_int, 160100, .decimal);
pub const __TVOS_16_2 = __helpers.promoteIntLiteral(c_int, 160200, .decimal);
pub const __TVOS_16_3 = __helpers.promoteIntLiteral(c_int, 160300, .decimal);
pub const __TVOS_16_4 = __helpers.promoteIntLiteral(c_int, 160400, .decimal);
pub const __TVOS_16_5 = __helpers.promoteIntLiteral(c_int, 160500, .decimal);
pub const __TVOS_16_6 = __helpers.promoteIntLiteral(c_int, 160600, .decimal);
pub const __TVOS_17_0 = __helpers.promoteIntLiteral(c_int, 170000, .decimal);
pub const __TVOS_17_1 = __helpers.promoteIntLiteral(c_int, 170100, .decimal);
pub const __TVOS_17_2 = __helpers.promoteIntLiteral(c_int, 170200, .decimal);
pub const __TVOS_17_3 = __helpers.promoteIntLiteral(c_int, 170300, .decimal);
pub const __TVOS_17_4 = __helpers.promoteIntLiteral(c_int, 170400, .decimal);
pub const __TVOS_17_5 = __helpers.promoteIntLiteral(c_int, 170500, .decimal);
pub const __TVOS_17_6 = __helpers.promoteIntLiteral(c_int, 170600, .decimal);
pub const __TVOS_18_0 = __helpers.promoteIntLiteral(c_int, 180000, .decimal);
pub const __TVOS_18_1 = __helpers.promoteIntLiteral(c_int, 180100, .decimal);
pub const __TVOS_18_2 = __helpers.promoteIntLiteral(c_int, 180200, .decimal);
pub const __TVOS_18_3 = __helpers.promoteIntLiteral(c_int, 180300, .decimal);
pub const __TVOS_18_4 = __helpers.promoteIntLiteral(c_int, 180400, .decimal);
pub const __TVOS_18_5 = __helpers.promoteIntLiteral(c_int, 180500, .decimal);
pub const __TVOS_18_6 = __helpers.promoteIntLiteral(c_int, 180600, .decimal);
pub const __TVOS_19_0 = __helpers.promoteIntLiteral(c_int, 190000, .decimal);
pub const __TVOS_26_0 = __helpers.promoteIntLiteral(c_int, 260000, .decimal);
pub const __TVOS_26_1 = __helpers.promoteIntLiteral(c_int, 260100, .decimal);
pub const __TVOS_26_2 = __helpers.promoteIntLiteral(c_int, 260200, .decimal);
pub const __TVOS_26_3 = __helpers.promoteIntLiteral(c_int, 260300, .decimal);
pub const __TVOS_26_4 = __helpers.promoteIntLiteral(c_int, 260400, .decimal);
pub const __TVOS_26_5 = __helpers.promoteIntLiteral(c_int, 260500, .decimal);
pub const __TVOS_26_6 = __helpers.promoteIntLiteral(c_int, 260600, .decimal);
pub const __TVOS_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const __BRIDGEOS_2_0 = @as(c_int, 20000);
pub const __BRIDGEOS_3_0 = @as(c_int, 30000);
pub const __BRIDGEOS_3_1 = @as(c_int, 30100);
pub const __BRIDGEOS_3_4 = @as(c_int, 30400);
pub const __BRIDGEOS_4_0 = __helpers.promoteIntLiteral(c_int, 40000, .decimal);
pub const __BRIDGEOS_4_1 = __helpers.promoteIntLiteral(c_int, 40100, .decimal);
pub const __BRIDGEOS_5_0 = __helpers.promoteIntLiteral(c_int, 50000, .decimal);
pub const __BRIDGEOS_5_1 = __helpers.promoteIntLiteral(c_int, 50100, .decimal);
pub const __BRIDGEOS_5_3 = __helpers.promoteIntLiteral(c_int, 50300, .decimal);
pub const __BRIDGEOS_6_0 = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const __BRIDGEOS_6_2 = __helpers.promoteIntLiteral(c_int, 60200, .decimal);
pub const __BRIDGEOS_6_4 = __helpers.promoteIntLiteral(c_int, 60400, .decimal);
pub const __BRIDGEOS_6_5 = __helpers.promoteIntLiteral(c_int, 60500, .decimal);
pub const __BRIDGEOS_6_6 = __helpers.promoteIntLiteral(c_int, 60600, .decimal);
pub const __BRIDGEOS_7_0 = __helpers.promoteIntLiteral(c_int, 70000, .decimal);
pub const __BRIDGEOS_7_1 = __helpers.promoteIntLiteral(c_int, 70100, .decimal);
pub const __BRIDGEOS_7_2 = __helpers.promoteIntLiteral(c_int, 70200, .decimal);
pub const __BRIDGEOS_7_3 = __helpers.promoteIntLiteral(c_int, 70300, .decimal);
pub const __BRIDGEOS_7_4 = __helpers.promoteIntLiteral(c_int, 70400, .decimal);
pub const __BRIDGEOS_7_6 = __helpers.promoteIntLiteral(c_int, 70600, .decimal);
pub const __BRIDGEOS_8_0 = __helpers.promoteIntLiteral(c_int, 80000, .decimal);
pub const __BRIDGEOS_8_1 = __helpers.promoteIntLiteral(c_int, 80100, .decimal);
pub const __BRIDGEOS_8_2 = __helpers.promoteIntLiteral(c_int, 80200, .decimal);
pub const __BRIDGEOS_8_3 = __helpers.promoteIntLiteral(c_int, 80300, .decimal);
pub const __BRIDGEOS_8_4 = __helpers.promoteIntLiteral(c_int, 80400, .decimal);
pub const __BRIDGEOS_8_5 = __helpers.promoteIntLiteral(c_int, 80500, .decimal);
pub const __BRIDGEOS_8_6 = __helpers.promoteIntLiteral(c_int, 80600, .decimal);
pub const __BRIDGEOS_9_0 = __helpers.promoteIntLiteral(c_int, 90000, .decimal);
pub const __BRIDGEOS_9_1 = __helpers.promoteIntLiteral(c_int, 90100, .decimal);
pub const __BRIDGEOS_9_2 = __helpers.promoteIntLiteral(c_int, 90200, .decimal);
pub const __BRIDGEOS_9_3 = __helpers.promoteIntLiteral(c_int, 90300, .decimal);
pub const __BRIDGEOS_9_4 = __helpers.promoteIntLiteral(c_int, 90400, .decimal);
pub const __BRIDGEOS_9_5 = __helpers.promoteIntLiteral(c_int, 90500, .decimal);
pub const __BRIDGEOS_9_6 = __helpers.promoteIntLiteral(c_int, 90600, .decimal);
pub const __BRIDGEOS_10_0 = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const __BRIDGEOS_10_1 = __helpers.promoteIntLiteral(c_int, 100100, .decimal);
pub const __BRIDGEOS_10_2 = __helpers.promoteIntLiteral(c_int, 100200, .decimal);
pub const __BRIDGEOS_10_3 = __helpers.promoteIntLiteral(c_int, 100300, .decimal);
pub const __BRIDGEOS_10_4 = __helpers.promoteIntLiteral(c_int, 100400, .decimal);
pub const __BRIDGEOS_10_5 = __helpers.promoteIntLiteral(c_int, 100500, .decimal);
pub const __BRIDGEOS_10_6 = __helpers.promoteIntLiteral(c_int, 100600, .decimal);
pub const __DRIVERKIT_19_0 = __helpers.promoteIntLiteral(c_int, 190000, .decimal);
pub const __DRIVERKIT_20_0 = __helpers.promoteIntLiteral(c_int, 200000, .decimal);
pub const __DRIVERKIT_21_0 = __helpers.promoteIntLiteral(c_int, 210000, .decimal);
pub const __DRIVERKIT_22_0 = __helpers.promoteIntLiteral(c_int, 220000, .decimal);
pub const __DRIVERKIT_22_4 = __helpers.promoteIntLiteral(c_int, 220400, .decimal);
pub const __DRIVERKIT_22_5 = __helpers.promoteIntLiteral(c_int, 220500, .decimal);
pub const __DRIVERKIT_22_6 = __helpers.promoteIntLiteral(c_int, 220600, .decimal);
pub const __DRIVERKIT_23_0 = __helpers.promoteIntLiteral(c_int, 230000, .decimal);
pub const __DRIVERKIT_23_1 = __helpers.promoteIntLiteral(c_int, 230100, .decimal);
pub const __DRIVERKIT_23_2 = __helpers.promoteIntLiteral(c_int, 230200, .decimal);
pub const __DRIVERKIT_23_3 = __helpers.promoteIntLiteral(c_int, 230300, .decimal);
pub const __DRIVERKIT_23_4 = __helpers.promoteIntLiteral(c_int, 230400, .decimal);
pub const __DRIVERKIT_23_5 = __helpers.promoteIntLiteral(c_int, 230500, .decimal);
pub const __DRIVERKIT_23_6 = __helpers.promoteIntLiteral(c_int, 230600, .decimal);
pub const __DRIVERKIT_24_0 = __helpers.promoteIntLiteral(c_int, 240000, .decimal);
pub const __DRIVERKIT_24_1 = __helpers.promoteIntLiteral(c_int, 240100, .decimal);
pub const __DRIVERKIT_24_2 = __helpers.promoteIntLiteral(c_int, 240200, .decimal);
pub const __DRIVERKIT_24_3 = __helpers.promoteIntLiteral(c_int, 240300, .decimal);
pub const __DRIVERKIT_24_4 = __helpers.promoteIntLiteral(c_int, 240400, .decimal);
pub const __DRIVERKIT_24_5 = __helpers.promoteIntLiteral(c_int, 240500, .decimal);
pub const __DRIVERKIT_24_6 = __helpers.promoteIntLiteral(c_int, 240600, .decimal);
pub const __DRIVERKIT_25_0 = __helpers.promoteIntLiteral(c_int, 250000, .decimal);
pub const __DRIVERKIT_25_1 = __helpers.promoteIntLiteral(c_int, 250100, .decimal);
pub const __DRIVERKIT_25_2 = __helpers.promoteIntLiteral(c_int, 250200, .decimal);
pub const __DRIVERKIT_25_3 = __helpers.promoteIntLiteral(c_int, 250300, .decimal);
pub const __DRIVERKIT_25_4 = __helpers.promoteIntLiteral(c_int, 250400, .decimal);
pub const __DRIVERKIT_25_5 = __helpers.promoteIntLiteral(c_int, 250500, .decimal);
pub const __DRIVERKIT_25_6 = __helpers.promoteIntLiteral(c_int, 250600, .decimal);
pub const __DRIVERKIT_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const __VISIONOS_1_0 = @as(c_int, 10000);
pub const __VISIONOS_1_1 = @as(c_int, 10100);
pub const __VISIONOS_1_2 = @as(c_int, 10200);
pub const __VISIONOS_1_3 = @as(c_int, 10300);
pub const __VISIONOS_2_0 = @as(c_int, 20000);
pub const __VISIONOS_2_1 = @as(c_int, 20100);
pub const __VISIONOS_2_2 = @as(c_int, 20200);
pub const __VISIONOS_2_3 = @as(c_int, 20300);
pub const __VISIONOS_2_4 = @as(c_int, 20400);
pub const __VISIONOS_2_5 = @as(c_int, 20500);
pub const __VISIONOS_2_6 = @as(c_int, 20600);
pub const __VISIONOS_3_0 = @as(c_int, 30000);
pub const __VISIONOS_26_0 = __helpers.promoteIntLiteral(c_int, 260000, .decimal);
pub const __VISIONOS_26_1 = __helpers.promoteIntLiteral(c_int, 260100, .decimal);
pub const __VISIONOS_26_2 = __helpers.promoteIntLiteral(c_int, 260200, .decimal);
pub const __VISIONOS_26_3 = __helpers.promoteIntLiteral(c_int, 260300, .decimal);
pub const __VISIONOS_26_4 = __helpers.promoteIntLiteral(c_int, 260400, .decimal);
pub const __VISIONOS_26_5 = __helpers.promoteIntLiteral(c_int, 260500, .decimal);
pub const __VISIONOS_26_6 = __helpers.promoteIntLiteral(c_int, 260600, .decimal);
pub const __VISIONOS_27_0 = __helpers.promoteIntLiteral(c_int, 270000, .decimal);
pub const MAC_OS_X_VERSION_10_0 = __MAC_10_0;
pub const MAC_OS_X_VERSION_10_1 = __MAC_10_1;
pub const MAC_OS_X_VERSION_10_2 = __MAC_10_2;
pub const MAC_OS_X_VERSION_10_3 = __MAC_10_3;
pub const MAC_OS_X_VERSION_10_4 = __MAC_10_4;
pub const MAC_OS_X_VERSION_10_5 = __MAC_10_5;
pub const MAC_OS_X_VERSION_10_6 = __MAC_10_6;
pub const MAC_OS_X_VERSION_10_7 = __MAC_10_7;
pub const MAC_OS_X_VERSION_10_8 = __MAC_10_8;
pub const MAC_OS_X_VERSION_10_9 = __MAC_10_9;
pub const MAC_OS_X_VERSION_10_10 = __MAC_10_10;
pub const MAC_OS_X_VERSION_10_10_2 = __MAC_10_10_2;
pub const MAC_OS_X_VERSION_10_10_3 = __MAC_10_10_3;
pub const MAC_OS_X_VERSION_10_11 = __MAC_10_11;
pub const MAC_OS_X_VERSION_10_11_2 = __MAC_10_11_2;
pub const MAC_OS_X_VERSION_10_11_3 = __MAC_10_11_3;
pub const MAC_OS_X_VERSION_10_11_4 = __MAC_10_11_4;
pub const MAC_OS_X_VERSION_10_12 = __MAC_10_12;
pub const MAC_OS_X_VERSION_10_12_1 = __MAC_10_12_1;
pub const MAC_OS_X_VERSION_10_12_2 = __MAC_10_12_2;
pub const MAC_OS_X_VERSION_10_12_4 = __MAC_10_12_4;
pub const MAC_OS_X_VERSION_10_13 = __MAC_10_13;
pub const MAC_OS_X_VERSION_10_13_1 = __MAC_10_13_1;
pub const MAC_OS_X_VERSION_10_13_2 = __MAC_10_13_2;
pub const MAC_OS_X_VERSION_10_13_4 = __MAC_10_13_4;
pub const MAC_OS_X_VERSION_10_14 = __MAC_10_14;
pub const MAC_OS_X_VERSION_10_14_1 = __MAC_10_14_1;
pub const MAC_OS_X_VERSION_10_14_4 = __MAC_10_14_4;
pub const MAC_OS_X_VERSION_10_14_5 = __MAC_10_14_5;
pub const MAC_OS_X_VERSION_10_14_6 = __MAC_10_14_6;
pub const MAC_OS_X_VERSION_10_15 = __MAC_10_15;
pub const MAC_OS_X_VERSION_10_15_1 = __MAC_10_15_1;
pub const MAC_OS_X_VERSION_10_15_4 = __MAC_10_15_4;
pub const MAC_OS_X_VERSION_10_16 = __MAC_10_16;
pub const MAC_OS_VERSION_11_0 = __MAC_11_0;
pub const MAC_OS_VERSION_11_1 = __MAC_11_1;
pub const MAC_OS_VERSION_11_3 = __MAC_11_3;
pub const MAC_OS_VERSION_11_4 = __MAC_11_4;
pub const MAC_OS_VERSION_11_5 = __MAC_11_5;
pub const MAC_OS_VERSION_11_6 = __MAC_11_6;
pub const MAC_OS_VERSION_12_0 = __MAC_12_0;
pub const MAC_OS_VERSION_12_1 = __MAC_12_1;
pub const MAC_OS_VERSION_12_2 = __MAC_12_2;
pub const MAC_OS_VERSION_12_3 = __MAC_12_3;
pub const MAC_OS_VERSION_12_4 = __MAC_12_4;
pub const MAC_OS_VERSION_12_5 = __MAC_12_5;
pub const MAC_OS_VERSION_12_6 = __MAC_12_6;
pub const MAC_OS_VERSION_12_7 = __MAC_12_7;
pub const MAC_OS_VERSION_13_0 = __MAC_13_0;
pub const MAC_OS_VERSION_13_1 = __MAC_13_1;
pub const MAC_OS_VERSION_13_2 = __MAC_13_2;
pub const MAC_OS_VERSION_13_3 = __MAC_13_3;
pub const MAC_OS_VERSION_13_4 = __MAC_13_4;
pub const MAC_OS_VERSION_13_5 = __MAC_13_5;
pub const MAC_OS_VERSION_13_6 = __MAC_13_6;
pub const MAC_OS_VERSION_13_7 = __MAC_13_7;
pub const MAC_OS_VERSION_14_0 = __MAC_14_0;
pub const MAC_OS_VERSION_14_1 = __MAC_14_1;
pub const MAC_OS_VERSION_14_2 = __MAC_14_2;
pub const MAC_OS_VERSION_14_3 = __MAC_14_3;
pub const MAC_OS_VERSION_14_4 = __MAC_14_4;
pub const MAC_OS_VERSION_14_5 = __MAC_14_5;
pub const MAC_OS_VERSION_14_6 = __MAC_14_6;
pub const MAC_OS_VERSION_14_7 = __MAC_14_7;
pub const MAC_OS_VERSION_15_0 = __MAC_15_0;
pub const MAC_OS_VERSION_15_1 = __MAC_15_1;
pub const MAC_OS_VERSION_15_2 = __MAC_15_2;
pub const MAC_OS_VERSION_15_3 = __MAC_15_3;
pub const MAC_OS_VERSION_15_4 = __MAC_15_4;
pub const MAC_OS_VERSION_15_5 = __MAC_15_5;
pub const MAC_OS_VERSION_15_6 = __MAC_15_6;
pub const MAC_OS_VERSION_16_0 = __MAC_16_0;
pub const MAC_OS_VERSION_26_0 = __MAC_26_0;
pub const MAC_OS_VERSION_26_1 = __MAC_26_1;
pub const MAC_OS_VERSION_26_2 = __MAC_26_2;
pub const MAC_OS_VERSION_26_3 = __MAC_26_3;
pub const MAC_OS_VERSION_26_4 = __MAC_26_4;
pub const MAC_OS_VERSION_26_5 = __MAC_26_5;
pub const MAC_OS_VERSION_26_6 = __MAC_26_6;
pub const MAC_OS_VERSION_27_0 = __MAC_27_0;
pub const __AVAILABILITY_VERSIONS_VERSION_HASH = __helpers.promoteIntLiteral(c_uint, 93585900, .decimal);
pub const __AVAILABILITY_VERSIONS_VERSION_STRING = "Local";
pub const __AVAILABILITY_FILE = "AvailabilityVersions.h";
pub const __AVAILABILITY_INTERNAL__ = "";
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_27_0;
pub const __IPHONE_OS_VERSION_MIN_REQUIRED = __IPHONE_17_1;
pub const __IPHONE_OS_VERSION_MAX_ALLOWED = __IPHONE_27_0;
pub const __WATCH_OS_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __WATCH_OS_VERSION_MAX_ALLOWED = __WATCHOS_27_0;
pub const __TV_OS_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __TV_OS_VERSION_MAX_ALLOWED = __TVOS_27_0;
pub const __DRIVERKIT_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __DRIVERKIT_VERSION_MAX_ALLOWED = __DRIVERKIT_27_0;
pub const __VISION_OS_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __VISION_OS_VERSION_MAX_ALLOWED = __VISIONOS_27_0;
pub const __AVAILABILITY_INTERNAL_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:142:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:145:17
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `unavailable`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:154:9
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = @compileError("unable to translate macro: undefined identifier `weak_import`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:155:9
pub const __AVAILABILITY_INTERNAL_REGULAR = "";
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:160:12
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:161:12
pub const __API_OBSOLETED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:162:12
pub const __API_UNAVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:163:12
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:164:12
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:165:12
pub const __API_OBSOLETED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:166:12
pub const __API_UNAVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:167:12
pub const __API_AVAILABLE_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:168:12
pub const __API_DEPRECATED_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:169:12
pub const __API_OBSOLETED_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:170:12
pub const __API_UNAVAILABLE_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:171:12
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:172:12
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:173:12
pub const __API_OBSOLETED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:174:12
pub const __API_UNAVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:175:12
pub const __API_AVAILABLE_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:176:12
pub const __API_DEPRECATED_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:177:12
pub const __API_OBSOLETED_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:178:12
pub const __API_UNAVAILABLE_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:179:12
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:180:12
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:181:12
pub const __API_OBSOLETED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:182:12
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:183:12
pub const __API_AVAILABLE_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:184:12
pub const __API_DEPRECATED_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:185:12
pub const __API_OBSOLETED_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:186:12
pub const __API_UNAVAILABLE_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:187:12
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:188:12
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:189:12
pub const __API_OBSOLETED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:190:12
pub const __API_UNAVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:191:12
pub const __API_AVAILABLE_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:192:12
pub const __API_DEPRECATED_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:193:12
pub const __API_OBSOLETED_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:194:12
pub const __API_UNAVAILABLE_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:195:12
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:196:12
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:197:12
pub const __API_OBSOLETED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:198:12
pub const __API_UNAVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:199:12
pub const __API_AVAILABLE_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:200:12
pub const __API_DEPRECATED_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:201:12
pub const __API_OBSOLETED_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:202:12
pub const __API_UNAVAILABLE_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:203:12
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:205:12
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:206:12
pub const __API_OBSOLETED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:207:12
pub const __API_UNAVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:208:12
pub const __API_AVAILABLE_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:209:12
pub const __API_DEPRECATED_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:210:12
pub const __API_OBSOLETED_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:211:12
pub const __API_UNAVAILABLE_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:212:12
pub const __API_AVAILABLE_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:213:12
pub const __API_DEPRECATED_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:214:12
pub const __API_OBSOLETED_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:215:12
pub const __API_UNAVAILABLE_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:216:12
pub const __API_UNAVAILABLE_PLATFORM_kernelkit = @compileError("unable to translate macro: undefined identifier `kernelkit`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:218:12
pub const __API_AVAILABLE_PLATFORM_anyappleos = @compileError("unable to translate macro: undefined identifier `anyAppleOS`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:224:12
pub const __API_DEPRECATED_PLATFORM_anyappleos = @compileError("unable to translate macro: undefined identifier `anyAppleOS`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:225:12
pub const __API_UNAVAILABLE_PLATFORM_anyappleos = @compileError("unable to translate macro: undefined identifier `anyAppleOS`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:226:12
pub const __API_APPLY_TO = @compileError("unable to translate macro: undefined identifier `any`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:236:11
pub inline fn __API_RANGE_STRINGIFY(x: anytype) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    _ = &x;
    return __API_RANGE_STRINGIFY2(x);
}
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token ''");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:238:11
pub const __API_A = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:252:13
pub inline fn __API_AVAILABLE0(arg0: anytype) @TypeOf(__API_A(arg0)) {
    _ = &arg0;
    return __API_A(arg0);
}
pub inline fn __API_AVAILABLE1(arg0: anytype, arg1: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_A(arg0) ++ __API_A(arg1);
}
pub inline fn __API_AVAILABLE2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2);
}
pub inline fn __API_AVAILABLE3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3);
}
pub inline fn __API_AVAILABLE4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4);
}
pub inline fn __API_AVAILABLE5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5);
}
pub inline fn __API_AVAILABLE6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6);
}
pub inline fn __API_AVAILABLE7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7);
}
pub inline fn __API_AVAILABLE8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8);
}
pub inline fn __API_AVAILABLE9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9);
}
pub inline fn __API_AVAILABLE10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10);
}
pub inline fn __API_AVAILABLE11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11);
}
pub inline fn __API_AVAILABLE12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12);
}
pub inline fn __API_AVAILABLE13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13);
}
pub inline fn __API_AVAILABLE14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14);
}
pub inline fn __API_AVAILABLE15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14) ++ __API_A(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14) ++ __API_A(arg15);
}
pub inline fn __API_AVAILABLE_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &NAME;
    return NAME;
}
pub const __API_A_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:272:13
pub inline fn __API_AVAILABLE_BEGIN0(arg0: anytype) @TypeOf(__API_A_BEGIN(arg0)) {
    _ = &arg0;
    return __API_A_BEGIN(arg0);
}
pub inline fn __API_AVAILABLE_BEGIN1(arg0: anytype, arg1: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1);
}
pub inline fn __API_AVAILABLE_BEGIN2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2);
}
pub inline fn __API_AVAILABLE_BEGIN3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3);
}
pub inline fn __API_AVAILABLE_BEGIN4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4);
}
pub inline fn __API_AVAILABLE_BEGIN5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5);
}
pub inline fn __API_AVAILABLE_BEGIN6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6);
}
pub inline fn __API_AVAILABLE_BEGIN7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7);
}
pub inline fn __API_AVAILABLE_BEGIN8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8);
}
pub inline fn __API_AVAILABLE_BEGIN9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9);
}
pub inline fn __API_AVAILABLE_BEGIN10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10);
}
pub inline fn __API_AVAILABLE_BEGIN11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11);
}
pub inline fn __API_AVAILABLE_BEGIN12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12);
}
pub inline fn __API_AVAILABLE_BEGIN13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13);
}
pub inline fn __API_AVAILABLE_BEGIN14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14);
}
pub inline fn __API_AVAILABLE_BEGIN15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14) ++ __API_A_BEGIN(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14) ++ __API_A_BEGIN(arg15);
}
pub inline fn __API_AVAILABLE_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &NAME;
    return NAME;
}
pub const __API_D = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:294:13
pub inline fn __API_DEPRECATED_MSG0(msg: anytype, arg0: anytype) @TypeOf(__API_D(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_D(msg, arg0);
}
pub inline fn __API_DEPRECATED_MSG1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1);
}
pub inline fn __API_DEPRECATED_MSG2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2);
}
pub inline fn __API_DEPRECATED_MSG3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3);
}
pub inline fn __API_DEPRECATED_MSG4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4);
}
pub inline fn __API_DEPRECATED_MSG5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5);
}
pub inline fn __API_DEPRECATED_MSG6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6);
}
pub inline fn __API_DEPRECATED_MSG7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7);
}
pub inline fn __API_DEPRECATED_MSG8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8);
}
pub inline fn __API_DEPRECATED_MSG9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9);
}
pub inline fn __API_DEPRECATED_MSG10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10);
}
pub inline fn __API_DEPRECATED_MSG11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11);
}
pub inline fn __API_DEPRECATED_MSG12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12);
}
pub inline fn __API_DEPRECATED_MSG13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13);
}
pub inline fn __API_DEPRECATED_MSG14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14);
}
pub inline fn __API_DEPRECATED_MSG15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14) ++ __API_D(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14) ++ __API_D(msg, arg15);
}
pub inline fn __API_DEPRECATED_MSG_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_D_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:314:13
pub inline fn __API_DEPRECATED_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_D_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_D_BEGIN(msg, arg0);
}
pub inline fn __API_DEPRECATED_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1);
}
pub inline fn __API_DEPRECATED_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2);
}
pub inline fn __API_DEPRECATED_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3);
}
pub inline fn __API_DEPRECATED_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4);
}
pub inline fn __API_DEPRECATED_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5);
}
pub inline fn __API_DEPRECATED_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6);
}
pub inline fn __API_DEPRECATED_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7);
}
pub inline fn __API_DEPRECATED_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8);
}
pub inline fn __API_DEPRECATED_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9);
}
pub inline fn __API_DEPRECATED_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10);
}
pub inline fn __API_DEPRECATED_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11);
}
pub inline fn __API_DEPRECATED_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12);
}
pub inline fn __API_DEPRECATED_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13);
}
pub inline fn __API_DEPRECATED_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14);
}
pub inline fn __API_DEPRECATED_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14) ++ __API_D_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14) ++ __API_D_BEGIN(msg, arg15);
}
pub inline fn __API_DEPRECATED_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_DR = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:335:17
pub inline fn __API_DEPRECATED_REP0(msg: anytype, arg0: anytype) @TypeOf(__API_DR(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_DR(msg, arg0);
}
pub inline fn __API_DEPRECATED_REP1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1);
}
pub inline fn __API_DEPRECATED_REP2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2);
}
pub inline fn __API_DEPRECATED_REP3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3);
}
pub inline fn __API_DEPRECATED_REP4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4);
}
pub inline fn __API_DEPRECATED_REP5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5);
}
pub inline fn __API_DEPRECATED_REP6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6);
}
pub inline fn __API_DEPRECATED_REP7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7);
}
pub inline fn __API_DEPRECATED_REP8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8);
}
pub inline fn __API_DEPRECATED_REP9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9);
}
pub inline fn __API_DEPRECATED_REP10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10);
}
pub inline fn __API_DEPRECATED_REP11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11);
}
pub inline fn __API_DEPRECATED_REP12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12);
}
pub inline fn __API_DEPRECATED_REP13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13);
}
pub inline fn __API_DEPRECATED_REP14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14);
}
pub inline fn __API_DEPRECATED_REP15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14) ++ __API_DR(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14) ++ __API_DR(msg, arg15);
}
pub inline fn __API_DEPRECATED_REP_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_DR_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:359:17
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_DR_BEGIN(msg, arg0);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14) ++ __API_DR_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14) ++ __API_DR_BEGIN(msg, arg15);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_O = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:384:9
pub inline fn __API_OBSOLETED_MSG0(msg: anytype, arg0: anytype) @TypeOf(__API_O(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_O(msg, arg0);
}
pub inline fn __API_OBSOLETED_MSG1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1);
}
pub inline fn __API_OBSOLETED_MSG2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2);
}
pub inline fn __API_OBSOLETED_MSG3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3);
}
pub inline fn __API_OBSOLETED_MSG4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4);
}
pub inline fn __API_OBSOLETED_MSG5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5);
}
pub inline fn __API_OBSOLETED_MSG6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6);
}
pub inline fn __API_OBSOLETED_MSG7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7);
}
pub inline fn __API_OBSOLETED_MSG8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8);
}
pub inline fn __API_OBSOLETED_MSG9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9);
}
pub inline fn __API_OBSOLETED_MSG10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10);
}
pub inline fn __API_OBSOLETED_MSG11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11);
}
pub inline fn __API_OBSOLETED_MSG12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12);
}
pub inline fn __API_OBSOLETED_MSG13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13);
}
pub inline fn __API_OBSOLETED_MSG14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14);
}
pub inline fn __API_OBSOLETED_MSG15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14) ++ __API_O(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14) ++ __API_O(msg, arg15);
}
pub inline fn __API_OBSOLETED_MSG_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_O_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:404:9
pub inline fn __API_OBSOLETED_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_O_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_O_BEGIN(msg, arg0);
}
pub inline fn __API_OBSOLETED_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1);
}
pub inline fn __API_OBSOLETED_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2);
}
pub inline fn __API_OBSOLETED_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3);
}
pub inline fn __API_OBSOLETED_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4);
}
pub inline fn __API_OBSOLETED_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5);
}
pub inline fn __API_OBSOLETED_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6);
}
pub inline fn __API_OBSOLETED_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7);
}
pub inline fn __API_OBSOLETED_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8);
}
pub inline fn __API_OBSOLETED_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9);
}
pub inline fn __API_OBSOLETED_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10);
}
pub inline fn __API_OBSOLETED_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11);
}
pub inline fn __API_OBSOLETED_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12);
}
pub inline fn __API_OBSOLETED_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13);
}
pub inline fn __API_OBSOLETED_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14);
}
pub inline fn __API_OBSOLETED_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14) ++ __API_O_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14) ++ __API_O_BEGIN(msg, arg15);
}
pub inline fn __API_OBSOLETED_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_OR = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:425:13
pub inline fn __API_OBSOLETED_REP0(msg: anytype, arg0: anytype) @TypeOf(__API_OR(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_OR(msg, arg0);
}
pub inline fn __API_OBSOLETED_REP1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1);
}
pub inline fn __API_OBSOLETED_REP2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2);
}
pub inline fn __API_OBSOLETED_REP3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3);
}
pub inline fn __API_OBSOLETED_REP4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4);
}
pub inline fn __API_OBSOLETED_REP5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5);
}
pub inline fn __API_OBSOLETED_REP6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6);
}
pub inline fn __API_OBSOLETED_REP7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7);
}
pub inline fn __API_OBSOLETED_REP8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8);
}
pub inline fn __API_OBSOLETED_REP9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9);
}
pub inline fn __API_OBSOLETED_REP10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10);
}
pub inline fn __API_OBSOLETED_REP11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11);
}
pub inline fn __API_OBSOLETED_REP12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12);
}
pub inline fn __API_OBSOLETED_REP13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13);
}
pub inline fn __API_OBSOLETED_REP14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14);
}
pub inline fn __API_OBSOLETED_REP15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14) ++ __API_OR(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14) ++ __API_OR(msg, arg15);
}
pub inline fn __API_OBSOLETED_REP_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_OR_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:449:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN0 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:454:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN1 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:455:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN2 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:456:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN3 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:457:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN4 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:458:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN5 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:459:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN6 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:460:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN7 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:461:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN8 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:462:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN9 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:463:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN10 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:464:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN11 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:465:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN12 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:466:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN13 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:467:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN14 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:468:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN15 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:469:13
pub inline fn __API_OBSOLETED_WITH_REPLACEMENT_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, _16: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &_16;
    _ = &NAME;
    return NAME;
}
pub const __API_U = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:481:13
pub inline fn __API_UNAVAILABLE0(arg0: anytype) @TypeOf(__API_U(arg0)) {
    _ = &arg0;
    return __API_U(arg0);
}
pub inline fn __API_UNAVAILABLE1(arg0: anytype, arg1: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_U(arg0) ++ __API_U(arg1);
}
pub inline fn __API_UNAVAILABLE2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2);
}
pub inline fn __API_UNAVAILABLE3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3);
}
pub inline fn __API_UNAVAILABLE4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4);
}
pub inline fn __API_UNAVAILABLE5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5);
}
pub inline fn __API_UNAVAILABLE6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6);
}
pub inline fn __API_UNAVAILABLE7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7);
}
pub inline fn __API_UNAVAILABLE8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8);
}
pub inline fn __API_UNAVAILABLE9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9);
}
pub inline fn __API_UNAVAILABLE10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10);
}
pub inline fn __API_UNAVAILABLE11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11);
}
pub inline fn __API_UNAVAILABLE12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12);
}
pub inline fn __API_UNAVAILABLE13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13);
}
pub inline fn __API_UNAVAILABLE14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14);
}
pub inline fn __API_UNAVAILABLE15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14) ++ __API_U(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14) ++ __API_U(arg15);
}
pub inline fn __API_UNAVAILABLE_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &NAME;
    return NAME;
}
pub const __API_U_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternal.h:501:13
pub inline fn __API_UNAVAILABLE_BEGIN0(arg0: anytype) @TypeOf(__API_U_BEGIN(arg0)) {
    _ = &arg0;
    return __API_U_BEGIN(arg0);
}
pub inline fn __API_UNAVAILABLE_BEGIN1(arg0: anytype, arg1: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1);
}
pub inline fn __API_UNAVAILABLE_BEGIN2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2);
}
pub inline fn __API_UNAVAILABLE_BEGIN3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3);
}
pub inline fn __API_UNAVAILABLE_BEGIN4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4);
}
pub inline fn __API_UNAVAILABLE_BEGIN5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5);
}
pub inline fn __API_UNAVAILABLE_BEGIN6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6);
}
pub inline fn __API_UNAVAILABLE_BEGIN7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7);
}
pub inline fn __API_UNAVAILABLE_BEGIN8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8);
}
pub inline fn __API_UNAVAILABLE_BEGIN9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9);
}
pub inline fn __API_UNAVAILABLE_BEGIN10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10);
}
pub inline fn __API_UNAVAILABLE_BEGIN11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11);
}
pub inline fn __API_UNAVAILABLE_BEGIN12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12);
}
pub inline fn __API_UNAVAILABLE_BEGIN13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13);
}
pub inline fn __API_UNAVAILABLE_BEGIN14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14);
}
pub inline fn __API_UNAVAILABLE_BEGIN15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14) ++ __API_U_BEGIN(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14) ++ __API_U_BEGIN(arg15);
}
pub inline fn __API_UNAVAILABLE_BEGIN_GET_MACRO_93585900(_0: anytype, _1: anytype, _2: anytype, _3: anytype, _4: anytype, _5: anytype, _6: anytype, _7: anytype, _8: anytype, _9: anytype, _10: anytype, _11: anytype, _12: anytype, _13: anytype, _14: anytype, _15: anytype, NAME: anytype) @TypeOf(NAME) {
    _ = &_0;
    _ = &_1;
    _ = &_2;
    _ = &_3;
    _ = &_4;
    _ = &_5;
    _ = &_6;
    _ = &_7;
    _ = &_8;
    _ = &_9;
    _ = &_10;
    _ = &_11;
    _ = &_12;
    _ = &_13;
    _ = &_14;
    _ = &_15;
    _ = &NAME;
    return NAME;
}
pub inline fn __swift_compiler_version_at_least() @TypeOf(@as(c_int, 1)) {
    return @as(c_int, 1);
}
pub const __AVAILABILITY_INTERNAL_LEGACY__ = "";
pub const __ENABLE_LEGACY_IPHONE_AVAILABILITY = @as(c_int, 1);
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:67:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:68:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:70:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:74:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:76:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:80:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:82:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:86:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:88:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_11_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:92:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:93:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:95:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:99:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:101:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:105:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_2_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:107:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:111:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:113:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:117:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:119:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:123:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:125:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:129:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:131:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:135:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:137:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:141:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:143:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:147:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:149:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:153:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:155:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:159:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:161:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:165:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:167:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:171:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:173:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:177:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:179:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:183:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:185:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:189:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:191:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:195:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:197:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:201:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:203:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:207:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:209:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:213:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:215:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:219:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:221:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:225:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:227:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:231:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:233:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:237:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:239:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:243:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:244:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:245:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:246:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:248:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:252:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:254:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:258:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:260:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:264:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:266:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_2_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:270:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_2_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:272:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_2_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:276:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_2_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:278:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:282:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:284:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:288:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:290:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:294:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:296:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:300:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:302:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:306:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:308:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:312:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:314:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:318:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:320:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:324:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:326:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:330:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:332:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:336:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:338:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:342:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:344:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:348:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:350:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:354:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:356:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:360:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:362:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:366:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:368:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:372:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:374:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:378:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:380:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:384:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:386:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:390:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:392:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:396:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:398:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:402:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:404:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:408:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:410:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:414:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:415:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:416:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:417:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:419:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:423:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:425:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:429:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:431:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:435:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:437:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_2_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:441:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_2_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:443:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:447:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:449:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:453:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:455:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:459:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:461:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:465:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:467:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:471:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:473:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:477:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:479:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:483:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:485:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:489:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:491:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:495:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:497:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:501:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:503:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:507:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:509:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:513:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:515:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:519:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:521:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:525:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:527:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:531:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:533:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:537:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:539:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:543:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:545:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:549:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:551:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:555:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:557:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:561:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:563:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:567:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:569:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:573:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:575:25
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:579:21
pub const __AVAILABILITY_INTERNAL__IPHONE_2_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:580:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:581:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:582:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:584:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:588:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:590:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:594:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:596:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:600:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:602:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:606:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:608:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:612:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:614:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:618:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:620:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:624:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:626:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:630:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:632:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:636:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:638:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:642:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:644:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:648:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:650:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:654:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:656:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:660:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:662:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:666:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:668:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:672:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:674:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:678:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:680:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:684:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:686:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:690:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:692:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:696:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:698:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:702:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:704:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:708:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:710:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:714:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:716:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:720:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:722:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:726:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:728:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:732:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:734:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:738:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:739:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:740:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:741:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:743:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:747:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:749:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:753:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:755:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:759:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:761:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_3_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:765:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_3_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:767:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:771:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:773:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:777:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:779:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:783:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:785:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:789:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:791:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:795:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:797:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:801:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:803:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:807:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:809:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:813:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:815:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:819:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:821:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:825:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:827:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:831:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:833:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:837:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:839:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:843:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:845:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:849:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:851:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:855:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:857:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:861:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:863:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:867:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:869:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:873:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:875:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:879:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:881:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:885:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:887:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:891:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:892:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:893:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:894:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:896:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:900:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:902:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:906:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:908:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:912:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:914:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_3_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:918:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_3_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:920:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:924:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:926:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:930:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:932:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:936:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:938:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:942:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:944:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:948:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:950:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:954:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:956:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:960:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:962:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:966:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:968:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:972:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:974:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:978:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:980:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:984:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:986:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:990:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:992:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:996:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:998:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1002:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1004:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1008:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1010:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1014:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1016:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1020:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1022:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1026:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1028:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1032:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1034:25
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1038:21
pub const __AVAILABILITY_INTERNAL__IPHONE_3_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1039:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1040:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1041:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1043:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1047:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1049:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1053:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1055:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1059:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1061:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_12_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1066:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1070:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1072:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1076:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1078:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1082:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1084:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1088:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1090:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1094:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1096:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1100:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1102:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1106:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1108:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1112:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1114:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1118:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1120:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1124:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1126:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1130:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1132:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1136:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1138:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1142:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1144:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1148:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1150:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1154:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1156:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1160:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1162:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1166:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1168:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1172:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1174:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1178:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1180:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1184:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1185:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1186:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1187:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1189:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1193:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1195:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1199:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1201:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1205:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1207:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1211:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1213:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1217:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1219:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1223:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1225:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1229:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1231:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1235:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1237:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1241:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1243:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1247:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1249:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1253:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1255:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1259:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1261:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1265:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1267:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1271:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1273:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1277:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1279:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1283:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1285:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1289:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1291:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1295:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1297:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1301:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1303:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1307:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1309:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1313:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1315:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1319:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1320:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1321:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1322:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1324:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1328:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1330:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1334:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1336:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1340:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1342:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_4_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1346:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_4_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1348:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1352:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1354:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1358:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1360:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1364:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1366:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1370:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1372:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1376:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1378:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1382:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1384:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1388:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1390:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1394:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1396:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1400:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1402:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1406:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1408:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1412:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1414:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1418:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1420:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1424:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1426:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1430:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1432:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1436:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1438:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1442:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1444:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1448:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1449:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1450:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1451:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1453:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1457:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1459:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1463:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1465:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1469:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1471:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_4_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1475:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_4_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1477:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1481:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1483:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1487:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1489:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1493:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1495:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1499:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1501:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1505:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1507:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1511:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1513:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1517:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1519:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1523:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1525:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1529:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1531:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1535:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1537:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1541:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1543:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1547:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1549:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1553:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1555:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1559:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1561:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1565:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1567:25
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1571:21
pub const __AVAILABILITY_INTERNAL__IPHONE_4_3_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1572:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1573:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1574:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1576:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1580:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1582:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1586:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1588:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1592:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1594:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_11_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1598:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_5_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1599:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_5_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1601:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1605:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1607:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1611:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1613:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1617:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1619:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1623:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1625:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1629:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1631:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1635:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1637:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1641:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1643:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1647:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1649:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1653:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1655:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1659:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1661:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1665:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1667:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1671:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1673:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1677:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1679:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1683:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1685:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1689:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1690:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1691:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1692:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1694:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1698:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1700:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1704:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1706:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1710:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1712:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_5_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1716:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_5_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1718:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1722:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1724:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1728:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1730:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1734:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1736:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1740:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1742:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1746:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1748:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1752:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1754:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1758:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1760:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1764:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1766:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1770:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1772:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1776:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1778:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1782:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1784:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1788:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1790:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1794:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1796:25
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1800:21
pub const __AVAILABILITY_INTERNAL__IPHONE_5_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1801:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1802:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1803:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1805:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1809:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1811:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1815:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1817:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1821:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1823:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_6_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1827:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_6_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1829:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1833:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1835:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1839:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1841:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1845:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1847:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1851:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1853:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1857:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1859:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1863:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1865:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1869:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1871:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1875:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1877:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1881:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1883:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1887:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1889:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1893:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1895:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1899:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1901:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1905:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1906:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1907:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1908:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1910:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1914:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1916:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1920:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1922:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1926:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1928:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_6_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1932:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_6_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1934:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1938:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1940:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1944:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1946:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1950:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1952:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1956:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1958:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1962:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1964:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1968:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1970:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1974:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1976:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1980:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1982:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1986:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1988:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1992:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1994:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:1998:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2000:25
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2004:21
pub const __AVAILABILITY_INTERNAL__IPHONE_6_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2005:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2006:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2007:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2009:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2013:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2015:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2019:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2021:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2025:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2027:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_11_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2031:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2032:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_12_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2034:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_7_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2038:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_7_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2040:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2044:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2046:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2050:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2052:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2056:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2058:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2062:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2064:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2068:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2070:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2074:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2076:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2080:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2082:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2086:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2088:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2092:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2094:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2098:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2100:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2104:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2105:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2106:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2107:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2109:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2113:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2115:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2119:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2121:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2125:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2127:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_7_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2131:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_7_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2133:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2137:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2139:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2143:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2145:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2149:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2151:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2155:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2157:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2161:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2163:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2167:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2169:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2173:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2175:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2179:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2181:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2185:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2187:25
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2191:21
pub const __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2192:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2193:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2194:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2196:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2200:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2202:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2206:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2208:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2212:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2214:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_11_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2219:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2223:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_12_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2224:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2225:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2227:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2231:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2233:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2237:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2239:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2243:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2245:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2249:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2251:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2255:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2257:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2261:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2263:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2267:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2269:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2273:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2275:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2279:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2280:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2281:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2282:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2284:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2288:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2290:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2294:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2296:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2300:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2302:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2306:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2308:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2312:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2314:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2318:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2320:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2324:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2326:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2330:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2332:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2336:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2338:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2342:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2344:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2348:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2350:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2354:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2355:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2356:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2357:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2359:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2363:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2365:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2369:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2371:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2375:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2377:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2381:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2383:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2387:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2389:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2393:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2395:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2399:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2401:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2405:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2407:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2411:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2413:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2417:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2419:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2423:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2424:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2425:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2426:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2428:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2432:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2434:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2438:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2440:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2444:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2446:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_8_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2450:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_8_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2452:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2456:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2458:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2462:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2464:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2468:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2470:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2474:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2476:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2480:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2482:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2486:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_3_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2487:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2488:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2489:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2491:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2495:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2497:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2501:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2503:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2507:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2509:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_8_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2513:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_8_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2515:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2519:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2521:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2525:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2527:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2531:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2533:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2537:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2539:25
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2543:21
pub const __AVAILABILITY_INTERNAL__IPHONE_8_4_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2544:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2545:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2546:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2548:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2552:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2554:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2558:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2560:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2564:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2566:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2570:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2572:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2576:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2578:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2582:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2584:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2588:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2590:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2594:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2595:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2596:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2597:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2599:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2603:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2605:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2609:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2611:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2615:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2617:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2621:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2623:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2627:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2629:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2633:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2635:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2639:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2640:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2641:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2642:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2644:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2648:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2650:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2654:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2656:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2660:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2662:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_9_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2666:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_9_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2668:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2672:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2674:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2678:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2679:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2680:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2681:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2683:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2687:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2689:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2693:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2695:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2699:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2701:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_9_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2705:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_9_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2707:25
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2711:21
pub const __AVAILABILITY_INTERNAL__IPHONE_9_3_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2712:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2713:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2714:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2716:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2720:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2722:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2726:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2728:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2732:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2734:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_11_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2738:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_12_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2739:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2740:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_0_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2741:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2742:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2743:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2745:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2749:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2751:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2755:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2757:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2761:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_1_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2762:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2763:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2764:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2766:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2770:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2772:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2776:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_2_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2777:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2778:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_3_DEP__IPHONE_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2779:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_3_DEP__IPHONE_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2781:25
pub const __AVAILABILITY_INTERNAL__IPHONE_10_3_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2785:21
pub const __AVAILABILITY_INTERNAL__IPHONE_10_3_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2786:21
pub const __AVAILABILITY_INTERNAL__IPHONE_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2787:21
pub const __AVAILABILITY_INTERNAL__IPHONE_11_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2788:21
pub const __AVAILABILITY_INTERNAL__IPHONE_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2789:21
pub const __AVAILABILITY_INTERNAL__IPHONE_12_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2790:21
pub const __AVAILABILITY_INTERNAL__IPHONE_13_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2791:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2793:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2794:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2795:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2796:21
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2817:25
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2818:25
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/AvailabilityInternalLegacy.h:2820:25
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:204:13
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:205:13
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:207:13
pub const __OS_AVAILABILITY = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:263:13
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:264:13
pub const __OSX_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx_app_extension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:281:13
pub const __IOS_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios_app_extension`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:282:13
pub inline fn __OS_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg)) {
    _ = &_msg;
    return __OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg);
}
pub const __OSX_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:299:13
pub const __OSX_AVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:300:13
pub const __OSX_DEPRECATED = @compileError("unable to translate macro: undefined identifier `macosx`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:301:13
pub const __IOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:325:13
pub const __IOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:327:15
pub const __IOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:329:13
pub const __IOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `ios`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:330:13
pub const __TVOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:354:13
pub const __TVOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:356:15
pub const __TVOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:358:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `tvos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:359:13
pub const __WATCHOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:383:13
pub const __WATCHOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:385:15
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:387:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `watchos`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:388:13
pub const __SWIFT_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `swift`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:411:13
pub const __SWIFT_UNAVAILABLE_MSG = @compileError("unable to translate macro: undefined identifier `swift`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:412:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:457:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:459:13
pub const __API_AVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:460:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:483:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:484:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:486:13
pub const __API_DEPRECATED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:487:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:489:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:490:13
pub const __API_OBSOLETED = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:494:13
pub const __API_OBSOLETED_WITH_REPLACEMENT = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:495:13
pub const __API_OBSOLETED_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:497:13
pub const __API_OBSOLETED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:498:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:500:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:501:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:512:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:514:13
pub const __API_UNAVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/Availability.h:515:13
pub inline fn __SPI_AVAILABLE() void {
    return;
}
pub inline fn __SPI_AVAILABLE_BEGIN() void {
    return;
}
pub const __SPI_AVAILABLE_END = "";
pub inline fn __SPI_DEPRECATED() void {
    return;
}
pub inline fn __SPI_DEPRECATED_WITH_REPLACEMENT() void {
    return;
}
pub const _SIZE_T = "";
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const _RSIZE_T = "";
pub const _BSD_MACHINE_TYPES_H_ = "";
pub const _ARM_MACHTYPES_H_ = "";
pub const _MACHTYPES_H_ = "";
pub const _INT8_T = "";
pub const _INT16_T = "";
pub const _INT32_T = "";
pub const _INT64_T = "";
pub const _U_INT8_T = "";
pub const _U_INT16_T = "";
pub const _U_INT32_T = "";
pub const _U_INT64_T = "";
pub const _INTPTR_T = "";
pub const _UINTPTR_T = "";
pub const USER_ADDR_NULL = __helpers.cast(user_addr_t, @as(c_int, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) user_addr_t {
    _ = &a_ptr;
    return __helpers.cast(user_addr_t, __helpers.cast(usize, a_ptr));
}
pub const _ERRNO_T = "";
pub const _SSIZE_T = "";
pub const __STRINGS_H_ = "";
pub const _SECURE__STRINGS_H_ = "";
pub const _SECURE__COMMON_H_ = "";
pub const _USE_FORTIFY_LEVEL = @as(c_int, 2);
pub inline fn __darwin_obsz0(object: anytype) @TypeOf(__builtin.object_size(object, @as(c_int, 0))) {
    _ = &object;
    return __builtin.object_size(object, @as(c_int, 0));
}
pub inline fn __darwin_obsz(object: anytype) @TypeOf(__builtin.object_size(object, if (__helpers.cast(bool, _USE_FORTIFY_LEVEL > @as(c_int, 1))) @as(c_int, 1) else @as(c_int, 0))) {
    _ = &object;
    return __builtin.object_size(object, if (__helpers.cast(bool, _USE_FORTIFY_LEVEL > @as(c_int, 1))) @as(c_int, 1) else @as(c_int, 0));
}
pub const __darwin_pass_obsz0 = @compileError("unable to translate macro: undefined identifier `__pass_object_size__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_common.h:42:9
pub const __darwin_pass_obsz = @compileError("unable to translate macro: undefined identifier `__pass_object_size__`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_common.h:43:9
pub const __bcopy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___memmove_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_strings.h:65:9
pub const __bzero_chk_func = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_strings.h:70:9
pub const _SECURE__STRING_H_ = "";
pub const __memcpy_chk_func = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:126:9
pub const __memmove_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___memmove_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:131:9
pub const __memset_chk_func = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:136:9
pub const __stpncpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___stpncpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:141:9
pub const __strncpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strncpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:146:9
pub const __strlcpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strlcpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:153:9
pub const __strlcat_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strlcat_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:158:9
pub const __memccpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___memccpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:163:9
pub const __strcpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strcpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:171:9
pub const __stpcpy_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___stpcpy_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:176:9
pub const __strcat_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strcat_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:181:9
pub const __strncat_chk_func = @compileError("unable to translate macro: undefined identifier `__builtin___strncat_chk`");
// /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/secure/_string.h:187:9
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H_ = "";
pub const __WORDSIZE = @as(c_int, 64);
pub const _UINT8_T = "";
pub const _UINT16_T = "";
pub const _UINT32_T = "";
pub const _UINT64_T = "";
pub const _INTMAX_T = "";
pub const _UINTMAX_T = "";
pub inline fn INT8_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn INT16_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn INT32_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub const INT64_C = __helpers.LL_SUFFIX;
pub inline fn UINT8_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn UINT16_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub const UINT32_C = __helpers.U_SUFFIX;
pub const UINT64_C = __helpers.ULL_SUFFIX;
pub const INTMAX_C = __helpers.L_SUFFIX;
pub const UINTMAX_C = __helpers.UL_SUFFIX;
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -__helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -INT32_MAX - @as(c_int, 1);
pub const INT64_MIN = -INT64_MAX - @as(c_int, 1);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = @as(c_ulonglong, 18446744073709551615);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MAX = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INTPTR_MIN = -INTPTR_MAX - @as(c_int, 1);
pub const UINTPTR_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MAX = INTMAX_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = UINTMAX_C(__helpers.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTMAX_MIN = -INTMAX_MAX - @as(c_int, 1);
pub const PTRDIFF_MIN = INTMAX_MIN;
pub const PTRDIFF_MAX = INTMAX_MAX;
pub const SIZE_MAX = UINTPTR_MAX;
pub const RSIZE_MAX = SIZE_MAX >> @as(c_int, 1);
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WCHAR_MIN = -WCHAR_MAX - @as(c_int, 1);
pub const WINT_MIN = INT32_MIN;
pub const WINT_MAX = INT32_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const DILIGENT_C_INTERFACE = @as(c_int, 1);
pub const DILIGENT_CALL_TYPE = "";
pub const DILIGENT_PLATFORM_64 = @as(c_int, 1);
pub inline fn DILIGENT_BEGIN_NAMESPACE(Name: anytype) void {
    _ = &Name;
    return;
}
pub const DILIGENT_END_NAMESPACE = "";
pub const DILIGENT_TYPED_ENUM = @compileError("unable to translate macro: undefined identifier `_`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:63:13
pub const DILIGENT_DERIVE = @compileError("unable to translate macro: untranslatable usage of arg `TypeName`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:67:13
pub inline fn DEFAULT_INITIALIZER() void {
    return;
}
pub const DILIGENT_GLOBAL_FUNCTION = @compileError("unable to translate macro: undefined identifier `Diligent_`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:73:13
pub const DILIGENT_BEGIN_INTERFACE = @compileError("unable to translate macro: untranslatable usage of arg `Iface`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:75:13
pub inline fn DEFAULT_VALUE() void {
    return;
}
pub const CALL_IFACE_METHOD = @compileError("unable to translate macro: undefined identifier `I`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:84:13
pub const DILIGENT_CONCATENATE0 = @compileError("unable to translate C expr: unexpected token '##'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:87:13
pub inline fn DILIGENT_CONCATENATE(X: anytype, Y: anytype) @TypeOf(DILIGENT_CONCATENATE0(X, Y)) {
    _ = &X;
    _ = &Y;
    return DILIGENT_CONCATENATE0(X, Y);
}
pub const DILIGENT_CONSTEXPR = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/CommonDefinitions.h:90:13
pub const DILIGENT_CPP_INTERFACE = @as(c_int, 0);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`");
// /opt/homebrew/Cellar/zig/0.17.0/lib/zig/compiler/aro/include/stddef.h:18:9
pub const IReferenceCounters_AddStrongRef = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:170:13
pub const IReferenceCounters_ReleaseStrongRef = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:171:13
pub const IReferenceCounters_AddWeakRef = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:172:13
pub const IReferenceCounters_ReleaseWeakRef = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:173:13
pub const IReferenceCounters_QueryObject = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:174:13
pub const IReferenceCounters_GetNumStrongRefs = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:175:13
pub const IReferenceCounters_GetNumWeakRefs = @compileError("unable to translate macro: undefined identifier `ReferenceCounters`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/ReferenceCounters.h:176:13
pub const IObjectInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Object`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/Object.h:109:9
pub const IObject_QueryInterface = @compileError("unable to translate macro: undefined identifier `Object`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/Object.h:125:13
pub const IObject_AddRef = @compileError("unable to translate macro: undefined identifier `Object`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/Object.h:126:13
pub const IObject_Release = @compileError("unable to translate macro: undefined identifier `Object`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/Object.h:127:13
pub inline fn DEFINE_FLAG_ENUM_OPERATORS(ENUMTYPE: anytype) void {
    _ = &ENUMTYPE;
    return;
}
pub inline fn _countof(arr: anytype) @TypeOf(__helpers.div(__helpers.sizeof(arr), __helpers.sizeof(arr[@as(usize, @intCast(@as(c_int, 0)))]))) {
    _ = &arr;
    return __helpers.div(__helpers.sizeof(arr), __helpers.sizeof(arr[@as(usize, @intCast(@as(c_int, 0)))]));
}
pub const IAsyncTaskInclusiveMethods = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:67:9
pub const IAsyncTask_Run = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:151:13
pub const IAsyncTask_Cancel = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:152:13
pub const IAsyncTask_SetStatus = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:153:13
pub const IAsyncTask_GetStatus = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:154:13
pub const IAsyncTask_SetPriority = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:155:13
pub const IAsyncTask_GetPriority = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:156:13
pub const IAsyncTask_IsFinished = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:157:13
pub const IAsyncTask_WaitForCompletion = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:158:13
pub const IAsyncTask_WaitUntilRunning = @compileError("unable to translate macro: undefined identifier `AsyncTask`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:159:13
pub const IThreadPoolInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:171:9
pub const IThreadPool_EnqueueTask = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:344:13
pub const IThreadPool_ReprioritizeTask = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:345:13
pub const IThreadPool_ReprioritizeAllTasks = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:346:13
pub const IThreadPool_RemoveTask = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:347:13
pub const IThreadPool_WaitForAllTasks = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:348:13
pub const IThreadPool_GetQueueSize = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:349:13
pub const IThreadPool_GetRunningTaskCount = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:350:13
pub const IThreadPool_StopThreads = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:351:13
pub const IThreadPool_ProcessTask = @compileError("unable to translate macro: undefined identifier `ThreadPool`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Common/interface/ThreadPool.h:352:13
pub const DILIGENT_API_VERSION = __helpers.promoteIntLiteral(c_int, 256020, .decimal);
pub const DILIGENT_MAX_BUFFER_SLOTS = @as(c_int, 32);
pub const DILIGENT_MAX_RENDER_TARGETS = @as(c_int, 8);
pub const DILIGENT_MAX_VIEWPORTS = @as(c_int, 16);
pub const DILIGENT_MAX_RESOURCE_SIGNATURES = @as(c_int, 8);
pub const DILIGENT_MAX_ADAPTER_QUEUES = @as(c_int, 16);
pub const DILIGENT_DEFAULT_ADAPTER_ID = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const DILIGENT_DEFAULT_QUEUE_ID = @as(c_int, 0xFF);
pub const DILIGENT_MAX_SHADING_RATES = @as(c_int, 9);
pub const DILIGENT_SHADING_RATE_X_SHIFT = @as(c_int, 2);
pub const DILIGENT_MAX_INLINE_CONSTANTS = @as(c_int, 64);
pub const IDeviceObjectInclusiveMethods = @compileError("unable to translate macro: undefined identifier `DeviceObject`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceObject.h:45:9
pub const IDeviceObject_GetDesc = @compileError("unable to translate macro: undefined identifier `DeviceObject`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceObject.h:111:13
pub const IDeviceObject_GetUniqueID = @compileError("unable to translate macro: undefined identifier `DeviceObject`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceObject.h:112:13
pub const IDeviceObject_SetUserData = @compileError("unable to translate macro: undefined identifier `DeviceObject`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceObject.h:113:13
pub const IDeviceObject_GetUserData = @compileError("unable to translate macro: undefined identifier `DeviceObject`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceObject.h:114:13
pub const IBufferViewInclusiveMethods = @compileError("unable to translate macro: undefined identifier `BufferView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BufferView.h:148:9
pub const IBufferView_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BufferView.h:179:13
pub const IBufferView_GetBuffer = @compileError("unable to translate macro: undefined identifier `BufferView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BufferView.h:181:13
pub const IBufferInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:237:9
pub const IBuffer_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:364:13
pub const IBuffer_CreateView = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:366:13
pub const IBuffer_GetDefaultView = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:367:13
pub const IBuffer_GetNativeHandle = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:368:13
pub const IBuffer_SetState = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:369:13
pub const IBuffer_GetState = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:370:13
pub const IBuffer_GetMemoryProperties = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:371:13
pub const IBuffer_FlushMappedRange = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:372:13
pub const IBuffer_InvalidateMappedRange = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:373:13
pub const IBuffer_GetSparseProperties = @compileError("unable to translate macro: undefined identifier `Buffer`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h:374:13
pub const DILIGENT_MAX_LAYOUT_ELEMENTS = @as(c_int, 16);
pub const DILIGENT_LAYOUT_ELEMENT_AUTO_OFFSET = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const DILIGENT_LAYOUT_ELEMENT_AUTO_STRIDE = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const IDataBlobInclusiveMethods = @compileError("unable to translate macro: undefined identifier `DataBlob`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DataBlob.h:47:9
pub const IDataBlob_Resize = @compileError("unable to translate macro: undefined identifier `DataBlob`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DataBlob.h:91:13
pub const IDataBlob_GetSize = @compileError("unable to translate macro: undefined identifier `DataBlob`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DataBlob.h:92:13
pub const IDataBlob_GetDataPtr = @compileError("unable to translate macro: undefined identifier `DataBlob`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DataBlob.h:93:13
pub const IDataBlob_GetConstDataPtr = @compileError("unable to translate macro: undefined identifier `DataBlob`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DataBlob.h:94:13
pub const IFileStreamInclusiveMethods = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:48:9
pub const IFileStream_Read = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:86:13
pub const IFileStream_ReadBlob = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:87:13
pub const IFileStream_Write = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:88:13
pub const IFileStream_GetSize = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:89:13
pub const IFileStream_GetPos = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:90:13
pub const IFileStream_SetPos = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:91:13
pub const IFileStream_IsValid = @compileError("unable to translate macro: undefined identifier `FileStream`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/FileStream.h:92:13
pub const IShaderSourceInputStreamFactoryInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ShaderSourceInputStreamFactory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:233:9
pub const IShaderSourceInputStreamFactory_CreateInputStream = @compileError("unable to translate macro: undefined identifier `ShaderSourceInputStreamFactory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:280:13
pub const IShaderSourceInputStreamFactory_CreateInputStream2 = @compileError("unable to translate macro: undefined identifier `ShaderSourceInputStreamFactory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:281:13
pub const IShaderInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1098:9
pub const IShader_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1162:13
pub const IShader_GetResourceCount = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1164:13
pub const IShader_GetResourceDesc = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1165:13
pub const IShader_GetConstantBufferDesc = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1166:13
pub const IShader_GetBytecode = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1167:13
pub const IShader_GetStatus = @compileError("unable to translate macro: undefined identifier `Shader`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Shader.h:1168:13
pub const ITextureViewInclusiveMethods = @compileError("unable to translate macro: undefined identifier `TextureView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h:367:9
pub const ITextureView_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h:410:13
pub const ITextureView_SetSampler = @compileError("unable to translate macro: undefined identifier `TextureView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h:414:13
pub const ITextureView_GetSampler = @compileError("unable to translate macro: undefined identifier `TextureView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h:415:13
pub const ITextureView_GetTexture = @compileError("unable to translate macro: undefined identifier `TextureView`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h:416:13
pub const ITextureInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:450:9
pub const ITexture_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:536:13
pub const ITexture_CreateView = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:538:13
pub const ITexture_GetDefaultView = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:539:13
pub const ITexture_GetNativeHandle = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:540:13
pub const ITexture_SetState = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:541:13
pub const ITexture_GetState = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:542:13
pub const ITexture_GetSparseProperties = @compileError("unable to translate macro: undefined identifier `Texture`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Texture.h:543:13
pub const ISamplerInclusiveMethods = IDeviceObjectInclusiveMethods;
pub const ISampler_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Sampler.h:278:13
pub const IResourceMappingInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:98:9
pub const IResourceMapping_AddResource = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:181:13
pub const IResourceMapping_AddResourceArray = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:182:13
pub const IResourceMapping_RemoveResourceByName = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:183:13
pub const IResourceMapping_GetResource = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:184:13
pub const IResourceMapping_GetSize = @compileError("unable to translate macro: undefined identifier `ResourceMapping`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ResourceMapping.h:185:13
pub const IShaderResourceVariableInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:168:9
pub const IShaderResourceVariable_Set = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:295:13
pub const IShaderResourceVariable_SetArray = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:296:13
pub const IShaderResourceVariable_SetBufferRange = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:297:13
pub const IShaderResourceVariable_SetBufferOffset = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:298:13
pub const IShaderResourceVariable_SetInlineConstants = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:299:13
pub const IShaderResourceVariable_GetType = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:300:13
pub const IShaderResourceVariable_GetResourceDesc = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:301:13
pub const IShaderResourceVariable_GetIndex = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:302:13
pub const IShaderResourceVariable_Get = @compileError("unable to translate macro: undefined identifier `ShaderResourceVariable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceVariable.h:303:13
pub const IShaderResourceBindingInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:51:9
pub const IShaderResourceBinding_GetPipelineResourceSignature = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:166:13
pub const IShaderResourceBinding_BindResources = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:167:13
pub const IShaderResourceBinding_CheckResources = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:168:13
pub const IShaderResourceBinding_GetVariableByName = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:169:13
pub const IShaderResourceBinding_GetVariableCount = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:170:13
pub const IShaderResourceBinding_GetVariableByIndex = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:171:13
pub const IShaderResourceBinding_StaticResourcesInitialized = @compileError("unable to translate macro: undefined identifier `ShaderResourceBinding`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h:172:13
pub const DILIGENT_ATTACHMENT_UNUSED = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const DILIGENT_SUBPASS_EXTERNAL = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const IPipelineResourceSignatureInclusiveMethods = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:473:9
pub const IPipelineResourceSignature_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:611:13
pub const IPipelineResourceSignature_CreateShaderResourceBinding = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:613:13
pub const IPipelineResourceSignature_BindStaticResources = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:614:13
pub const IPipelineResourceSignature_GetStaticVariableByName = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:615:13
pub const IPipelineResourceSignature_GetStaticVariableByIndex = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:616:13
pub const IPipelineResourceSignature_GetStaticVariableCount = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:617:13
pub const IPipelineResourceSignature_InitializeStaticSRBResources = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:618:13
pub const IPipelineResourceSignature_CopyStaticResources = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:619:13
pub const IPipelineResourceSignature_IsCompatibleWith = @compileError("unable to translate macro: undefined identifier `PipelineResourceSignature`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineResourceSignature.h:620:13
pub const IPipelineStateCacheInclusiveMethods = @compileError("unable to translate macro: undefined identifier `PipelineStateCache`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineStateCache.h:109:9
pub const IPipelineStateCache_GetData = @compileError("unable to translate macro: undefined identifier `PipelineStateCache`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineStateCache.h:128:13
pub const IPipelineStateInclusiveMethods = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1193:9
pub const IPipelineState_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1410:13
pub const IPipelineState_GetGraphicsPipelineDesc = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1412:13
pub const IPipelineState_GetRayTracingPipelineDesc = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1413:13
pub const IPipelineState_GetTilePipelineDesc = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1414:13
pub const IPipelineState_BindStaticResources = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1415:13
pub const IPipelineState_GetStaticVariableCount = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1416:13
pub const IPipelineState_GetStaticVariableByName = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1417:13
pub const IPipelineState_GetStaticVariableByIndex = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1418:13
pub const IPipelineState_CreateShaderResourceBinding = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1419:13
pub const IPipelineState_InitializeStaticSRBResources = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1420:13
pub const IPipelineState_CopyStaticResources = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1421:13
pub const IPipelineState_IsCompatibleWith = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1422:13
pub const IPipelineState_GetResourceSignatureCount = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1423:13
pub const IPipelineState_GetResourceSignature = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1424:13
pub const IPipelineState_GetStatus = @compileError("unable to translate macro: undefined identifier `PipelineState`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h:1425:13
pub const IFenceInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Fence`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Fence.h:79:9
pub const IFence_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Fence.h:137:13
pub const IFence_GetCompletedValue = @compileError("unable to translate macro: undefined identifier `Fence`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Fence.h:139:13
pub const IFence_Signal = @compileError("unable to translate macro: undefined identifier `Fence`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Fence.h:140:13
pub const IFence_Wait = @compileError("unable to translate macro: undefined identifier `Fence`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Fence.h:141:13
pub const IQueryInclusiveMethods = @compileError("unable to translate macro: undefined identifier `Query`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Query.h:173:9
pub const IQuery_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Query.h:225:13
pub const IQuery_GetData = @compileError("unable to translate macro: undefined identifier `Query`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Query.h:227:13
pub const IQuery_Invalidate = @compileError("unable to translate macro: undefined identifier `Query`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/Query.h:228:13
pub const ISwapChainInclusiveMethods = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:47:9
pub const ISwapChain_Present = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:128:13
pub const ISwapChain_GetDesc = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:129:13
pub const ISwapChain_Resize = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:130:13
pub const ISwapChain_SetFullscreenMode = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:131:13
pub const ISwapChain_SetWindowedMode = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:132:13
pub const ISwapChain_SetMaximumFrameLatency = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:133:13
pub const ISwapChain_GetCurrentBackBufferRTV = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:134:13
pub const ISwapChain_GetDepthBufferDSV = @compileError("unable to translate macro: undefined identifier `SwapChain`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h:135:13
pub const DILIGENT_INVALID_INDEX = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const IBottomLevelASInclusiveMethods = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:278:9
pub const IBottomLevelAS_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:356:13
pub const IBottomLevelAS_GetGeometryDescIndex = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:358:13
pub const IBottomLevelAS_GetGeometryIndex = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:359:13
pub const IBottomLevelAS_GetActualGeometryCount = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:360:13
pub const IBottomLevelAS_GetScratchBufferSizes = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:361:13
pub const IBottomLevelAS_GetNativeHandle = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:362:13
pub const IBottomLevelAS_SetState = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:363:13
pub const IBottomLevelAS_GetState = @compileError("unable to translate macro: undefined identifier `BottomLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/BottomLevelAS.h:364:13
pub const ITopLevelASInclusiveMethods = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:152:9
pub const ITopLevelAS_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:224:13
pub const ITopLevelAS_GetInstanceDesc = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:226:13
pub const ITopLevelAS_GetBuildInfo = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:227:13
pub const ITopLevelAS_GetScratchBufferSizes = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:228:13
pub const ITopLevelAS_GetNativeHandle = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:229:13
pub const ITopLevelAS_SetState = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:230:13
pub const ITopLevelAS_GetState = @compileError("unable to translate macro: undefined identifier `TopLevelAS`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/TopLevelAS.h:231:13
pub const IShaderBindingTableInclusiveMethods = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:82:9
pub const IShaderBindingTable_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:310:13
pub const IShaderBindingTable_Verify = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:312:13
pub const IShaderBindingTable_Reset = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:313:13
pub const IShaderBindingTable_ResetHitGroups = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:314:13
pub const IShaderBindingTable_BindRayGenShader = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:315:13
pub const IShaderBindingTable_BindMissShader = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:316:13
pub const IShaderBindingTable_BindHitGroupByIndex = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:317:13
pub const IShaderBindingTable_BindHitGroupForGeometry = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:318:13
pub const IShaderBindingTable_BindHitGroupForInstance = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:319:13
pub const IShaderBindingTable_BindHitGroupForTLAS = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:320:13
pub const IShaderBindingTable_BindCallableShader = @compileError("unable to translate macro: undefined identifier `ShaderBindingTable`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/ShaderBindingTable.h:321:13
pub const IDeviceMemoryInclusiveMethods = @compileError("unable to translate macro: undefined identifier `DeviceMemory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceMemory.h:124:9
pub const IDeviceMemory_GetDesc = @compileError("unable to translate C expr: unexpected token 'const'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceMemory.h:171:13
pub const IDeviceMemory_Resize = @compileError("unable to translate macro: undefined identifier `DeviceMemory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceMemory.h:173:13
pub const IDeviceMemory_GetCapacity = @compileError("unable to translate macro: undefined identifier `DeviceMemory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceMemory.h:174:13
pub const IDeviceMemory_IsCompatible = @compileError("unable to translate macro: undefined identifier `DeviceMemory`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceMemory.h:175:13
pub const ICommandQueueInclusiveMethods = @compileError("unable to translate macro: undefined identifier `CommandQueue`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/CommandQueue.h:43:9
pub const ICommandQueue_GetNextFenceValue = @compileError("unable to translate macro: undefined identifier `CommandQueue`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/CommandQueue.h:69:13
pub const ICommandQueue_GetCompletedFenceValue = @compileError("unable to translate macro: undefined identifier `CommandQueue`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/CommandQueue.h:70:13
pub const ICommandQueue_WaitForIdle = @compileError("unable to translate macro: undefined identifier `CommandQueue`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/CommandQueue.h:71:13
pub const DILIGENT_TLAS_INSTANCE_OFFSET_AUTO = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const DILIGENT_TLAS_INSTANCE_DATA_SIZE = @as(c_int, 64);
pub const DILIGENT_REMAINING_MIP_LEVELS = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const DILIGENT_REMAINING_ARRAY_SLICES = __helpers.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex);
pub const REF = @compileError("unable to translate C expr: unexpected token ''");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DefineRefMacro.h:38:13
pub const THIS = @compileError("unable to translate macro: undefined identifier `DILIGENT_INTERFACE_NAME`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DefineInterfaceHelperMacros.h:51:13
pub const THIS_ = @compileError("unable to translate macro: undefined identifier `DILIGENT_INTERFACE_NAME`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DefineInterfaceHelperMacros.h:52:13
pub const VIRTUAL = "";
pub const CONST = "";
pub const PURE = "";
pub const METHOD = @compileError("unable to translate C expr: unexpected token ')'");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Primitives/interface/DefineInterfaceHelperMacros.h:56:13
pub const IDeviceContextInclusiveMethods = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:2606:9
pub const IDeviceContext_GetDesc = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3832:13
pub const IDeviceContext_Begin = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3833:13
pub const IDeviceContext_SetPipelineState = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3834:13
pub const IDeviceContext_TransitionShaderResources = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3835:13
pub const IDeviceContext_CommitShaderResources = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3836:13
pub const IDeviceContext_SetStencilRef = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3837:13
pub const IDeviceContext_SetBlendFactors = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3838:13
pub const IDeviceContext_SetVertexBuffers = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3839:13
pub const IDeviceContext_InvalidateState = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3840:13
pub const IDeviceContext_SetIndexBuffer = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3841:13
pub const IDeviceContext_SetViewports = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3842:13
pub const IDeviceContext_SetScissorRects = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3843:13
pub const IDeviceContext_SetRenderTargets = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3844:13
pub const IDeviceContext_SetRenderTargetsExt = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3845:13
pub const IDeviceContext_BeginRenderPass = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3846:13
pub const IDeviceContext_NextSubpass = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3847:13
pub const IDeviceContext_EndRenderPass = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3848:13
pub const IDeviceContext_Draw = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3849:13
pub const IDeviceContext_DrawIndexed = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3850:13
pub const IDeviceContext_DrawIndirect = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3851:13
pub const IDeviceContext_DrawIndexedIndirect = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3852:13
pub const IDeviceContext_DrawMesh = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3853:13
pub const IDeviceContext_DrawMeshIndirect = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3854:13
pub const IDeviceContext_DispatchCompute = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3855:13
pub const IDeviceContext_DispatchComputeIndirect = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3856:13
pub const IDeviceContext_DispatchTile = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3857:13
pub const IDeviceContext_GetTileSize = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3858:13
pub const IDeviceContext_ClearDepthStencil = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3859:13
pub const IDeviceContext_ClearRenderTarget = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3860:13
pub const IDeviceContext_FinishCommandList = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3861:13
pub const IDeviceContext_ExecuteCommandLists = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3862:13
pub const IDeviceContext_EnqueueSignal = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3863:13
pub const IDeviceContext_DeviceWaitForFence = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3864:13
pub const IDeviceContext_WaitForIdle = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3865:13
pub const IDeviceContext_BeginQuery = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3866:13
pub const IDeviceContext_EndQuery = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3867:13
pub const IDeviceContext_Flush = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3868:13
pub const IDeviceContext_UpdateBuffer = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3869:13
pub const IDeviceContext_CopyBuffer = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3870:13
pub const IDeviceContext_MapBuffer = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3871:13
pub const IDeviceContext_UnmapBuffer = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3872:13
pub const IDeviceContext_UpdateTexture = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3873:13
pub const IDeviceContext_CopyTexture = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3874:13
pub const IDeviceContext_MapTextureSubresource = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3875:13
pub const IDeviceContext_UnmapTextureSubresource = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3876:13
pub const IDeviceContext_GenerateMips = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3877:13
pub const IDeviceContext_FinishFrame = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3878:13
pub const IDeviceContext_GetFrameNumber = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3879:13
pub const IDeviceContext_TransitionResourceStates = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3880:13
pub const IDeviceContext_ResolveTextureSubresource = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3881:13
pub const IDeviceContext_BuildBLAS = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3882:13
pub const IDeviceContext_BuildTLAS = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3883:13
pub const IDeviceContext_CopyBLAS = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3884:13
pub const IDeviceContext_CopyTLAS = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3885:13
pub const IDeviceContext_WriteBLASCompactedSize = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3886:13
pub const IDeviceContext_WriteTLASCompactedSize = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3887:13
pub const IDeviceContext_TraceRays = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3888:13
pub const IDeviceContext_TraceRaysIndirect = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3889:13
pub const IDeviceContext_UpdateSBT = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3890:13
pub const IDeviceContext_SetUserData = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3891:13
pub const IDeviceContext_GetUserData = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3892:13
pub const IDeviceContext_BeginDebugGroup = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3893:13
pub const IDeviceContext_EndDebugGroup = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3894:13
pub const IDeviceContext_InsertDebugLabel = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3895:13
pub const IDeviceContext_LockCommandQueue = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3896:13
pub const IDeviceContext_UnlockCommandQueue = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3897:13
pub const IDeviceContext_SetShadingRate = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3898:13
pub const IDeviceContext_BindSparseResourceMemory = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3899:13
pub const IDeviceContext_ClearStats = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3900:13
pub const IDeviceContext_GetStats = @compileError("unable to translate macro: undefined identifier `DeviceContext`");
// /Users/halophile4/Documents/codings/summit/engine/vendor/DiligentEngine/src/DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h:3901:13
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const MacOSNativeWindow = struct_MacOSNativeWindow;
pub const _ASYNC_TASK_STATUS = enum__ASYNC_TASK_STATUS;
pub const _VALUE_TYPE = enum__VALUE_TYPE;
pub const _SHADER_TYPE = enum__SHADER_TYPE;
pub const _BIND_FLAGS = enum__BIND_FLAGS;
pub const _USAGE = enum__USAGE;
pub const _CPU_ACCESS_FLAGS = enum__CPU_ACCESS_FLAGS;
pub const _MAP_TYPE = enum__MAP_TYPE;
pub const _MAP_FLAGS = enum__MAP_FLAGS;
pub const _RESOURCE_DIMENSION = enum__RESOURCE_DIMENSION;
pub const _TEXTURE_VIEW_TYPE = enum__TEXTURE_VIEW_TYPE;
pub const _BUFFER_VIEW_TYPE = enum__BUFFER_VIEW_TYPE;
pub const _TEXTURE_FORMAT = enum__TEXTURE_FORMAT;
pub const _FILTER_TYPE = enum__FILTER_TYPE;
pub const _TEXTURE_ADDRESS_MODE = enum__TEXTURE_ADDRESS_MODE;
pub const _COMPARISON_FUNCTION = enum__COMPARISON_FUNCTION;
pub const _PRIMITIVE_TOPOLOGY = enum__PRIMITIVE_TOPOLOGY;
pub const _MEMORY_PROPERTIES = enum__MEMORY_PROPERTIES;
pub const _ADAPTER_TYPE = enum__ADAPTER_TYPE;
pub const SCALING_MODE = enum_SCALING_MODE;
pub const SCANLINE_ORDER = enum_SCANLINE_ORDER;
pub const _SWAP_CHAIN_USAGE_FLAGS = enum__SWAP_CHAIN_USAGE_FLAGS;
pub const _SURFACE_TRANSFORM = enum__SURFACE_TRANSFORM;
pub const QUERY_TYPE = enum_QUERY_TYPE;
pub const RENDER_DEVICE_TYPE = enum_RENDER_DEVICE_TYPE;
pub const _DEVICE_FEATURE_STATE = enum__DEVICE_FEATURE_STATE;
pub const _ADAPTER_VENDOR = enum__ADAPTER_VENDOR;
pub const _WAVE_FEATURE = enum__WAVE_FEATURE;
pub const _VALIDATION_LEVEL = enum__VALIDATION_LEVEL;
pub const _RAY_TRACING_CAP_FLAGS = enum__RAY_TRACING_CAP_FLAGS;
pub const _VALIDATION_FLAGS = enum__VALIDATION_FLAGS;
pub const _COMMAND_QUEUE_TYPE = enum__COMMAND_QUEUE_TYPE;
pub const _QUEUE_PRIORITY = enum__QUEUE_PRIORITY;
pub const _SHADING_RATE_COMBINER = enum__SHADING_RATE_COMBINER;
pub const _SHADING_RATE_FORMAT = enum__SHADING_RATE_FORMAT;
pub const _AXIS_SHADING_RATE = enum__AXIS_SHADING_RATE;
pub const _SHADING_RATE = enum__SHADING_RATE;
pub const _SAMPLE_COUNT = enum__SAMPLE_COUNT;
pub const _SHADING_RATE_CAP_FLAGS = enum__SHADING_RATE_CAP_FLAGS;
pub const _SHADING_RATE_TEXTURE_ACCESS = enum__SHADING_RATE_TEXTURE_ACCESS;
pub const _DRAW_COMMAND_CAP_FLAGS = enum__DRAW_COMMAND_CAP_FLAGS;
pub const _SPARSE_RESOURCE_CAP_FLAGS = enum__SPARSE_RESOURCE_CAP_FLAGS;
pub const _D3D11_VALIDATION_FLAGS = enum__D3D11_VALIDATION_FLAGS;
pub const _D3D12_VALIDATION_FLAGS = enum__D3D12_VALIDATION_FLAGS;
pub const _COMPONENT_TYPE = enum__COMPONENT_TYPE;
pub const _RESOURCE_DIMENSION_SUPPORT = enum__RESOURCE_DIMENSION_SUPPORT;
pub const _SPARSE_TEXTURE_FLAGS = enum__SPARSE_TEXTURE_FLAGS;
pub const _PIPELINE_STAGE_FLAGS = enum__PIPELINE_STAGE_FLAGS;
pub const _ACCESS_FLAGS = enum__ACCESS_FLAGS;
pub const _RESOURCE_STATE = enum__RESOURCE_STATE;
pub const _STATE_TRANSITION_TYPE = enum__STATE_TRANSITION_TYPE;
pub const _BUFFER_MODE = enum__BUFFER_MODE;
pub const _MISC_BUFFER_FLAGS = enum__MISC_BUFFER_FLAGS;
pub const IRenderPassVtbl = struct_IRenderPassVtbl;
pub const IFramebufferVtbl = struct_IFramebufferVtbl;
pub const ICommandListVtbl = struct_ICommandListVtbl;
pub const _INPUT_ELEMENT_FREQUENCY = enum__INPUT_ELEMENT_FREQUENCY;
pub const _SHADER_SOURCE_LANGUAGE = enum__SHADER_SOURCE_LANGUAGE;
pub const _SHADER_COMPILER = enum__SHADER_COMPILER;
pub const _CREATE_SHADER_SOURCE_INPUT_STREAM_FLAGS = enum__CREATE_SHADER_SOURCE_INPUT_STREAM_FLAGS;
pub const _SHADER_STATUS = enum__SHADER_STATUS;
pub const _SHADER_COMPILE_FLAGS = enum__SHADER_COMPILE_FLAGS;
pub const _SHADER_OPTIMIZATION_LEVEL = enum__SHADER_OPTIMIZATION_LEVEL;
pub const _SHADER_RESOURCE_TYPE = enum__SHADER_RESOURCE_TYPE;
pub const _SHADER_CODE_BASIC_TYPE = enum__SHADER_CODE_BASIC_TYPE;
pub const _SHADER_CODE_VARIABLE_CLASS = enum__SHADER_CODE_VARIABLE_CLASS;
pub const _UAV_ACCESS_FLAG = enum__UAV_ACCESS_FLAG;
pub const _TEXTURE_VIEW_FLAGS = enum__TEXTURE_VIEW_FLAGS;
pub const _TEXTURE_COMPONENT_SWIZZLE = enum__TEXTURE_COMPONENT_SWIZZLE;
pub const _MISC_TEXTURE_FLAGS = enum__MISC_TEXTURE_FLAGS;
pub const _SAMPLER_FLAGS = enum__SAMPLER_FLAGS;
pub const _STENCIL_OP = enum__STENCIL_OP;
pub const _BLEND_FACTOR = enum__BLEND_FACTOR;
pub const _BLEND_OPERATION = enum__BLEND_OPERATION;
pub const _COLOR_MASK = enum__COLOR_MASK;
pub const _LOGIC_OPERATION = enum__LOGIC_OPERATION;
pub const _FILL_MODE = enum__FILL_MODE;
pub const _CULL_MODE = enum__CULL_MODE;
pub const _SHADER_RESOURCE_VARIABLE_TYPE = enum__SHADER_RESOURCE_VARIABLE_TYPE;
pub const _SHADER_RESOURCE_VARIABLE_TYPE_FLAGS = enum__SHADER_RESOURCE_VARIABLE_TYPE_FLAGS;
pub const _BIND_SHADER_RESOURCES_FLAGS = enum__BIND_SHADER_RESOURCES_FLAGS;
pub const _SET_SHADER_RESOURCE_FLAGS = enum__SET_SHADER_RESOURCE_FLAGS;
pub const _ATTACHMENT_LOAD_OP = enum__ATTACHMENT_LOAD_OP;
pub const _ATTACHMENT_STORE_OP = enum__ATTACHMENT_STORE_OP;
pub const _PIPELINE_RESOURCE_FLAGS = enum__PIPELINE_RESOURCE_FLAGS;
pub const _WEB_GPU_BINDING_TYPE = enum__WEB_GPU_BINDING_TYPE;
pub const _PSO_CACHE_MODE = enum__PSO_CACHE_MODE;
pub const _PSO_CACHE_FLAGS = enum__PSO_CACHE_FLAGS;
pub const _SHADER_VARIABLE_FLAGS = enum__SHADER_VARIABLE_FLAGS;
pub const _PIPELINE_SHADING_RATE_FLAGS = enum__PIPELINE_SHADING_RATE_FLAGS;
pub const _PIPELINE_TYPE = enum__PIPELINE_TYPE;
pub const _PSO_CREATE_FLAGS = enum__PSO_CREATE_FLAGS;
pub const _PIPELINE_STATE_STATUS = enum__PIPELINE_STATE_STATUS;
pub const _FENCE_TYPE = enum__FENCE_TYPE;
pub const _RAYTRACING_BUILD_AS_FLAGS = enum__RAYTRACING_BUILD_AS_FLAGS;
pub const _HIT_GROUP_BINDING_MODE = enum__HIT_GROUP_BINDING_MODE;
pub const _VERIFY_SBT_FLAGS = enum__VERIFY_SBT_FLAGS;
pub const _DEVICE_MEMORY_TYPE = enum__DEVICE_MEMORY_TYPE;
pub const _DRAW_FLAGS = enum__DRAW_FLAGS;
pub const _RESOURCE_STATE_TRANSITION_MODE = enum__RESOURCE_STATE_TRANSITION_MODE;
pub const _CLEAR_DEPTH_STENCIL_FLAGS = enum__CLEAR_DEPTH_STENCIL_FLAGS;
pub const _SET_VERTEX_BUFFERS_FLAGS = enum__SET_VERTEX_BUFFERS_FLAGS;
pub const _RAYTRACING_INSTANCE_FLAGS = enum__RAYTRACING_INSTANCE_FLAGS;
pub const _COPY_AS_MODE = enum__COPY_AS_MODE;
pub const _RAYTRACING_GEOMETRY_FLAGS = enum__RAYTRACING_GEOMETRY_FLAGS;
pub const _STATE_TRANSITION_FLAGS = enum__STATE_TRANSITION_FLAGS;
