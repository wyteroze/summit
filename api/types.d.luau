-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

-- MATH --

declare extern type Vec2 with
    read x: number
    read y: number

    --- Returns the length of this `Vec2`.
    function Length(self): number
    --- Returns a normalized copy of this `Vec2`. If its length is zero, this results in `nan`.
    function Normalize(self): Vec2
    --- Returns the dot product of this `Vec2` and the given `Vec2`.
    function Dot(self, other: Vec2): number
end

declare extern type Vec3 with
    read x: number
    read y: number
    read z: number

    --- Returns the length of this `Vec3`.
    function length(self): number
    --- Returns a normalized copy of this `Vec3`. If its length is zero, this results in `nan`.
    function normalize(self): Vec3
    --- Returns the dot product of this `Vec3` and the given `Vec3`.
    function dot(self, other: Vec3): number
    --- Returns the cross product of this `Vec3` and the given `Vec3`.
    function cross(self, other: Vec3): Vec3

	function __add(self, other: Vec3): Vec3
	function __div(self, other: Vec3 | number): Vec3
	function __idiv(self, other: Vec3 | number): Vec3
	function __mul(self, other: Vec3 | number): Vec3
	function __sub(self, other: Vec3): Vec3
	function __unm(self): Vec3
end

declare extern type Quat with
    --- The X (1st) component of this `Quat`.
    read x: number
    --- The Y (2nd) component of this `Quat`.
    read y: number
    --- The Z (3rd) component of this `Quat`.
    read z: number
    --- The W (4th) component of this `Quat`.
    read w: number

    --- Returns a normalized copy of this `Quat`. If its length is zero, this results in `nan`.
    function normalize(self): Quat
    --- Returns the inverse of this `Quat`.
    function inverse(self): Quat
    --- Interpolates this `Quat` to the target with the given alpha using spherical linear interpolation.
    function slerp(self, target: Quat, alpha: number): Quat
    
    function __mul(self, other: Vec3): Vec3
    function __mul(self, other: Quat): Quat
end

declare extern type Mat4 with
    read c00: number
    read c01: number
    read c02: number
    read c03: number

    read c10: number
    read c11: number
    read c12: number
    read c13: number

    read c20: number
    read c21: number
    read c22: number
    read c23: number

    read c30: number
    read c31: number
    read c32: number
    read c33: number

    --- Returns the inverse of this `Mat4`.
    function inverse(self): Mat4
    --- Returns the transpose of this `Mat4`.
    function transpose(self): Mat4
    
    function __mul(self, other: Vec3): Vec3
    function __mul(self, other: Mat4): Mat4
end

declare extern type Transform with
    read position: Vec3
    read rotation: Quat
    read scale: Vec3

    function toMat4(self): Mat4
    function forwardVector(self): Vec3
    function rightVector(self): Vec3
    function upVector(self): Vec3
end

declare extern type Color with
    --- The red component, ranging from 0.0-1.0
    read r: number
    --- The green component, ranging from 0.0-1.0
    read g: number
    --- The blue component, ranging from 0.0-1.0
    read b: number
    --- The alpha component, ranging from 0.0-1.0
    read a: number

    --- Linearly interpolates this `Color` to the target with the given alpha.
    function lerp(self, other: Color, alpha: number): Color
    --- Returns the RGBA components of this `Color`, ranging from 0-255.
    --- This is different from accessing `.R`, `.G`, `.B`, `.A`, because they range from 0.0-1.0.
    function toRGBA(self): (number, number, number, number)
    --- Returns the HSVA components of this `Color`, ranging from 0.0-1.0.
    function toHSVA(self): (number, number, number, number)
    --- Returns the hex code of this `Color`, formated as `RRGGBBAA`.
    --- The returned hex code does not have any prefixes like `#` or `0x`.
    function toHex(self): string
end

-- Math globals

--- A 2D value that has a length and direction.
declare Vec2: {
    --- Creates a new `Vec2` from the given components.
    read new: (x: number?, y: number?) -> Vec2,
    --- A `Vec2` with 0 length.
    read zero: Vec2,
    --- A `Vec2` with 1 length.
    read one: Vec2,
    --- A `Vec2` with a value of 1 on the X axis.
    read xAxis: Vec2,
    --- A `Vec2` with a value of 1 on the Y axis.
    read yAxis: Vec2,
}

--- A 3D value that has a length and direction.
declare Vec3: {
    --- Creates a new `Vec3` from the given components.
    read new: (x: number?, y: number?, z: number?) -> Vec3,
    --- A `Vec3` with 0 length.
    read zero: Vec3,
    --- A `Vec3` with 1 length.
    read one: Vec3,
    --- A `Vec3` with a value of 1 on the X axis.
    read xAxis: Vec3,
    --- A `Vec3` with a value of 1 on the Y axis.
    read yAxis: Vec3,
    --- A `Vec3` with a value of 1 on the Z axis.
    read xAxis: Vec3,
}

--- A 4D value, commonly used for representing 3D rotation.
declare Quat: {
    --- A `Quat` with zero rotation.
    read identity: Quat,
    --- Creates a `Quat` with the given Euler rotation.
    read fromEuler: (euler: Vec3) -> Quat,
    --- Creates a `Quat` of the given axis rotated around the given angle in degrees.
    read axisAngle: (axis: Vec3, angle: number) -> Quat,
    --- Creates a `Quat` facing the given direction, optionally with an up vector of the given value.
    read lookRotation: (direction: Vec3, up: Vec3?) -> Quat,
}

--- A matrix with 4 rows and 4 columns, for a total of 16 values.
declare Mat4: {
    --- A constant representing a `Mat4` with no translation or rotation, and a unit scale.
    read identity: Mat4,
    --- Creates a new `Mat4` with a translation of the given value, no rotation, and a unit scale.
    read fromTranslation: (translation: Vec3) -> Mat4,
    --- Creates a new `Mat4` with a rotation of the given value, no translation, and a unit scale.
    read fromRotation: (rotation: Quat) -> Mat4,
    --- Creates a new `Mat4` with a scale of the given value, no translation, and no rotation. 
    read fromScale: (scale: Vec3) -> Mat4,
    --- Creates a new `Mat4` with a translation, rotation, and scale of the given values.
    read fromTRS: (translation: Vec3, rotation: Quat, scale: Vec3) -> Mat4,
}

--- A color value with four components.
declare Color: {
    --- Creates a new `Color` from the given components, ranging from 0.0-1.0.
    --- Alpha defaults to 1.0 if not provided.
    read new: (r: number, g: number, b: number, a: number?) -> Color,
    --- Creates a new `Color` from a predefined color name.
    --- You may optionally provide an alpha, ranging from 0.0-1.0.
    read fromName: (name: ColorName, alpha: number?) -> Color,
    --- Creates a new `Color` from the given RGB, components, ranging from 0-255.
    --- Decimal values are rounded down, as they must be whole numbers.
    --- Alpha defaults to 255 if not provided.
    read fromRgb: (r: number, g: number, b: number, a: number?) -> Color,
    --- Creates a new `Color` from the given hex code.
    --- The hex code can be prefixed with `#` or `0x`
    --- The hex code can either be six-character format with an optional alpha (for a total of eight characters, `RRGGBBAA`),
    --- or three-character format with an optional alpha (for a total of four characters, `RGBA`).
    read fromHex: (code: string) -> Color,
    --- Creates a new `Color` from the given HSV values, ranging from 0.0-1.0.
    --- Alpha defaults to 1.0 if not provided.
    read fromHSV: (h: number, s: number, v: number, a: number?) -> Color,
}

--- A list of named colors from `https://www.w3.org/TR/css-color-4/#named-colors`
export type ColorName = 
    "AliceBlue" | "AntiqueWhite" | "Aqua" | "Aquamarine" | "Azure" |
    "Beige" | "Bisque" | "Black" | "BlanchedAlmond" | "Blue" | "BlueViolet" | "Brown" | "BurlyWood" |
    "CadetBlue" | "Chartreuse" | "Chocolate" | "Coral" | "CornflowerBlue" | "Cornsilk" | "Crimson" | "Cyan" |
    "DarkBlue" | "DarkCyan" | "DarkGoldenrod" | "DarkGray" | "DarkGreen" | "DarkGrey" | "DarkKhaki" | "DarkMagenta" | "DarkOliveGreen" | "DarkOrange" | "DarkOrchid" | "DarkRed" | "DarkSalmon" | "DarkSeaGreen" | "DarkSlateBlue" | "DarkSlateGray" | "DarkSlateGrey" | "DarkTurquoise" | "DarkViolet" | "DeepPink" | "DeepSkyBlue" | "DimGray" | "DimGrey" | "DodgerBlue" |
    "Firebrick" | "FloralWhite" | "ForestGreen" | "Fuchsia" |
    "Gainsboro" | "GhostWhite" | "Gold" | "Goldenrod" | "Gray" | "Green" | "GreenYellow" | "Grey" |
    "Honeydew" | "HotPink" |
    "IndianRed" | "Indigo" | "Ivory" |
    "Khaki" |
    "Lavender" | "LavenderBlush" | "LawnGreen" | "LemonChiffon" | "LightBlue" | "LightCoral" | "LightCyan" | "LightGoldenrodYellow" | "LightGray" | "LightGreen" | "LightGrey" | "LightPink" | "LightSalmon" | "LightSeaGreen" | "LightSkyBlue" | "LightSlateGray" | "LightSlateGrey" | "LightSteelBlue" | "LightYellow" | "Lime" | "LimeGreen" | "Linen" |
    "Magenta" | "Maroon" | "MediumAquamarine" | "MediumBlue" | "MediumOrchid" | "MediumPurple" | "MediumSeaGreen" | "MediumSlateBlue" | "MediumSpringGreen" | "MediumTurquoise" | "MediumVioletRed" | "MidnightBlue" | "MintCream" | "MistyRose" | "Moccasin" | "NavajoWhite" |
    "Navy" |
    "OldLace" | "Olive" | "OliveDrab" | "Orange" | "OrangeRed" | "Orchid" |
    "PaleGoldenrod" | "PaleGreen" | "PaleTurquoise" | "PaleVioletRed" | "PapayaWhip" | "PeachPuff" | "Peru" | "Pink" | "Plum" | "PowderBlue" | "Purple" |
    "RebeccaPurple" |
    "Red" | "RosyBrown" | "RoyalBlue" |
    "SaddleBrown" | "Salmon" | "SandyBrown" | "SeaGreen" | "Seashell" | "Sienna" | "Silver" | "SkyBlue" | "SlateBlue" | "SlateGray" | "SlateGrey" | "Snow" | "SpringGreen" | "SteelBlue" |
    "Tan" | "Teal" | "Thistle" | "Tomato" | "Turquoise" |
    "Violet" |
    "Wheat" | "White" | "WhiteSmoke" |
    "Yellow" | "YellowGreen"

-- Signal

export type SignalConnection = {
    --- Disconnects this connection from the signal, meaning the callback will no longer be called by the signal.
    read disconnect: (self: SignalConnection) -> ()
}

export type Signal<T...> = {
    --- Connects a callback to this signal.
    read connect: (self: Signal<T...>, callback: (T...) -> ()) -> SignalConnection,
    --- Fires the signal. Callbacks are called at the end of this frame, rather than immediately.
    read fire: (self: Signal<T...>, T...) -> ()
}

-- ASSETS --

export type AssetPath = string
export type LoadStatus = "Success" | "Fail" | "Waiting"
export type Asset = {
    read sourcePath: string,
    read loadStatus: LoadStatus,
    --- Halts this thread until the asset finishes loading.
    read await: (self: Asset) -> (Asset)
}

export type ImageAsset = Asset & {
    read size: Vec2,
}

export type FontAsset = Asset & {

}

export type MeshAsset = Asset & {

}

export type AudioAsset = Asset & {
    read sampleRate: number,
    read channels: number,
    read duration: number,
}

-- ECS --

declare extern type Entity with
    --- Adds a pre-registered component of the given name with the given value. This does not implicitly register components.
    --- You must register custom components using `World:RegisterComponent()` prior to using this.
    function addComponent(self, name: string, value: any): ()

    function __index(self, key: string): any?
    function __newindex(self, key: string, value: any): any?
    
    -- For accessing components. Trying to access/set a component that doesn't exist will error.
    [string]: any?
end

declare extern type World with

end

export type Script = {
    init: ((entity: Entity) -> ())?,
    update: ((entity: Entity, dt: number) -> ())?,
    deinit: ((entity: Entity) -> ())?,
}

export type System = {
    query: { string }?,
    init: ((world: World) -> ())?,
    update: ((entity: Entity, dt: number) -> ())?,
    deinit: (() -> ())?,
}

-- INPUT --

export type Keycode =
    "Return" | "Escape" | "Backspace" | "Tab" | "Space" |
    "Exclaim" | "DoubleApostrophe" | "Hash" | "Dollar" | "Percent" | "Ampersand" | "Apostrophe" |
    "LeftParen" | "RightParen" | "Asterisk" | "Plus" | "Comma" | "Minus" | "Period" | "Slash" |
    "Zero" | "One" | "Two" | "Three" | "Four" | "Five" | "Six" | "Seven" | "Eight" | "Nine" |
    "Colon" | "Semicolon" | "Less" | "Equals" | "Greater" | "Question" | "At" |
    "LeftBracket" | "Backslash" | "RightBracket" | "Caret" | "Underscore" | "Grave" |
    "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" |
    "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" |
    "LeftBrace" | "Pipe" | "RightBrace" | "Tilde" | "Delete" | "PlusMinus" | "CapsLock" |
    "F1" | "F2" | "F3" | "F4" | "F5" | "F6" |
    "F7" | "F8" | "F9" | "F10" | "F11" | "F12" |
    "PrintScreen" | "ScrollLock" | "Pause" | "Insert" |
    "Home" | "PageUp" | "End" | "PageDown" | "Right" | "Left" | "Down" | "Up" |
    "NumLockClear" | "KeypadDivide" | "KeypadMultiply" | "KeypadMinus" | "KeypadPlus" | "KeypadEnter" |
    "Keypad1" | "Keypad2" | "Keypad3" | "Keypad4" | "Keypad5" |
    "Keypad6" | "Keypad7" | "Keypad8" | "Keypad9" | "Keypad0" |
    "KeypadPeriod" | "Application" | "Power" | "KeypadEquals" |
    "F13" | "F14" | "F15" | "F16" | "F17" | "F18" |
    "F19" | "F20" | "F21" | "F22" | "F23" | "F24" |
    "Execute" | "Help" | "Menu" | "Select" | "Stop" | "Again" | "Undo" | "Cut" | "Copy" | "Paste" | "Find" |
    "Mute" | "VolumeUp" | "VolumeDown" | "KeypadComma" | "KeypadEqualsAs400" |
    "AltErase" | "Cancel" | "Clear" | "Prior" | "Separator" | "Out" | "Oper" | "ClearAgain" | "CrSel" | "ExSel" |
    "Keypad00" | "Keypad000" | "ThousandsSeparator" | "DecimalSeparator" | "CurrencyUnit" | "CurrencySubunit" |
    "KeypadLeftParen" | "KeypadRightParen" | "KeypadLeftBrace" | "KeypadRightBrace" |
    "KeypadTab" | "KeypadBackspace" | "KeypadA" | "KeypadB" | "KeypadC" | "KeypadD" | "KeypadE" | "KeypadF" |
    "KeypadXor" | "KeypadPower" | "KeypadPercent" | "KeypadLess" | "KeypadGreater" |
    "KeypadAmpersand" | "KeypadDoubleAmpersand" | "KeypadVerticalbar" | "KeypadDoubleVerticalBar" |
    "KeypadColon" | "KeypadHash" | "KeypadSpace" | "KeypadAt" | "KeypadExclam" |
    "KeypadMemStore" | "KeypadMemRecall" | "KeypadMemClear" |
    "KeypadMemAdd" | "KeypadMemSubtract" | "KeypadMemMultiply" | "KeypadMemDivide" |
    "KeypadPlusMinus" | "KeypadClear" | "KeypadClearEntry" |
    "KeypadBinary" | "KeypadOctal" | "KeypadDecimal" | "KeypadHexadecimal" |
    "LeftCtrl" | "LeftShift" | "LeftAlt" | "LeftGui" |
    "RightCtrl" | "RightShift" | "RightAlt" | "RightGui" |
    "Mode" | "Sleep" | "Wake" | "ChannelIncrement" | "ChannelDecrement" |
    "MediaPlay" | "MediaPause" | "MediaRecord" | "MediaFastForward" | "MediaRewind" |
    "MediaNextTrack" | "MediaPreviousTrack" | "MediaStop" | "MediaEject" | "MediaPlayPause" | "MediaSelect" |
    "AcNew" | "AcOpen" | "AcClose" | "AcExit" | "AcSave" | "AcPrint" |
    "AcProperties" | "AcSearch" | "AcHome" | "AcBack" | "AcForward" | "AcStop" | "AcRefresh" | "AcBookmarks" |
    "SoftLeft" | "SoftRight" | "Call" | "EndCall" |
    "LeftTab" | "Level5Shift" | "MultiKeyCompose" |
    "LeftMeta" | "RightMeta" | "LeftHyper" | "RightHyper" |
    "Unknown"

export type MouseButton =
    "Left" | "Middle" | "Right" |
    "SideButtonBack" | "SideButtonForward"

declare extern type Keyboard with
    --- Fires when a key is pressed, with the pressed keycode as the first argument of the callback.
    read keyPressed: Signal<Keycode, boolean, any>
    --- Fires when a key is released, with the released keycode as the first argument of the callback.
    read keyReleased: Signal<Keycode, boolean, any>

    --- Returns true if the given keycode is pressed.
    function isKeyPressed(self, key: Keycode): boolean
end

declare extern type Mouse with
    --- Fires when a button is pressed, with the pressed button as the first argument of the callback.
    read buttonPressed: Signal<MouseButton, boolean, any>
    --- Fires when a button is released, with the released button as the first argument of the callback.
    read buttonReleased: Signal<MouseButton, boolean, any>
    --- Fires when the mouse moves, with the delta as the first argument of the callback, and the position as the second argument of the callback.
    read moved: Signal<Vec2, Vec2, boolean, any>
    --- Fires when the scroll wheel moves, with the delta as the first argument of the callback.
    --- The X axis represents side-to-side scrolling, while the Y axis represents top-to-bottom-scrolling (most common).
    read scrolled: Signal<Vec2, boolean, any>

    --- Returns true if the given mouse button is pressed.
    function isButtonPressed(self, button: MouseButton): boolean
    --- Returns the mouse move delta.
    function getMoveDelta(self): Vec2
    --- Returns the mouse scroll delta.
    --- The X axis represents side-to-side scrolling, while the Y axis represents top-to-bottom-scrolling (most common).
    function getScrollDelta(self): Vec2
    --- Returns the position of the mouse.
    function getPosition(self): Vec2
end

-- AUDIO --

--- A component used to emit audio from entities.
declare extern type Speaker with
    --- Immediately begins playing an audio, and returns an `AudioTrack` that represents playback.
    function play(self, audio: Asset): AudioTrack
    --- The volume of this speaker. The range of allowed values is from 0 to 10, and other values are clamped to this range.
    volume: number
    --- The distance within which an `AudioListener` hears the speaker at full `Volume`.
    --- Beyond this distance, loudness falls off according to `Attenuation`.
    minDistance: number
    --- The distance beyond which an `AudioListener` cannot hear the speaker at all.
    maxDistance: number
    --- Controls how loudness falls off between `MinDistance` and `MaxDistance` for this speaker.
    attenuation: AudioAttenuation
end

--- Represents the playback of a piece of audio.
declare extern type AudioTrack with
    --- Begins playback of this track, resuming it from its current time position.
    --- Calling this does not reset the time position of this audio,
    --- but can still be achieved by setting this track's `TimePosition` to 0.
    function play(self): ()
    --- Stops playback of this track.
    function stop(self): ()
    --- Destroys this track, invalidating it and stopping playback.
    --- Attempting to access any properties or call any methods after destroying a track will result in an error.
    function destroy(self): ()
    
    --- Fires when this track is played.
    read played: Signal<()>
    --- Fires when this track is stopped.
    read stopped: Signal<()>
    --- Fires when this track loops.
    read looped: Signal<()>
end

--- The falloff curve used to determine how loudness decreases with distance from a `Speaker`.
export type AudioAttenuation =
    --- Loudness decreases at a constant rate, and reaches silence at `MaxDistance`.
    "Linear" | 
    --- Loudness drops off quickly near the speaker, and levels out with distance.
    "Exponential" | 
    --- Loudness follows the inverse-square law of sound.
    "InverseSquare"