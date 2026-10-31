-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

type Input = {
    --- A virtual keyboard that has all events passed through it, regardless of the keyboard it came from.
    --- This is useful if you need keyboard inputs and don't care about which keyboard it came from.
    read keyboards: Keyboard,
    --- A virtual mouse that has all events passed through it, regardless of the mouse it came from.
    --- This is useful if you need mouse inputs and don't care about which mouse it came from.
    read mice: Mouse,

    --- Gets the keyboard that corresponds with the given id, or `nil` if no keyboard matches the id.
    read getKeyboard: (id: number) -> Keyboard?,
    --- Gets the mouse that corresponds with the given id, or `nil` if no mouse matches the id.
    read getMouse: (id: number) -> Mouse?,

    --- Whether or not the cursor is locked. Irrelevant when no cursor exists, but does not error.
    read isCursorLocked: () -> boolean,
    --- Set whether or not the cursor is locked. Irrelevant when no cursor exists, but does not error.
    read setCursorLocked: (locked: boolean) -> boolean,

    --- Whether or not the cursor is visible. Irrelevant when no cursor exists, but does not error.
    read isCursorVisible: () -> boolean,
    --- Set whether or not the cursor is visible. Irrelevant when no cursor exists, but does not error.
    read setCursorVisible: (visible: boolean) -> boolean,
}

return {} :: Input