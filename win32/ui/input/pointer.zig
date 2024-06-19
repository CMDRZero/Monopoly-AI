//! NOTE: this file is autogenerated, DO NOT MODIFY
//--------------------------------------------------------------------------------
// Section: Constants (0)
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
// Section: Types (8)
//--------------------------------------------------------------------------------
pub const POINTER_FLAGS = packed struct(u32) {
    NEW: u1 = 0,
    INRANGE: u1 = 0,
    INCONTACT: u1 = 0,
    _3: u1 = 0,
    FIRSTBUTTON: u1 = 0,
    SECONDBUTTON: u1 = 0,
    THIRDBUTTON: u1 = 0,
    FOURTHBUTTON: u1 = 0,
    FIFTHBUTTON: u1 = 0,
    _9: u1 = 0,
    _10: u1 = 0,
    _11: u1 = 0,
    _12: u1 = 0,
    PRIMARY: u1 = 0,
    CONFIDENCE: u1 = 0,
    CANCELED: u1 = 0,
    DOWN: u1 = 0,
    UPDATE: u1 = 0,
    UP: u1 = 0,
    WHEEL: u1 = 0,
    HWHEEL: u1 = 0,
    CAPTURECHANGED: u1 = 0,
    HASTRANSFORM: u1 = 0,
    _23: u1 = 0,
    _24: u1 = 0,
    _25: u1 = 0,
    _26: u1 = 0,
    _27: u1 = 0,
    _28: u1 = 0,
    _29: u1 = 0,
    _30: u1 = 0,
    _31: u1 = 0,
};
pub const POINTER_FLAG_NONE = POINTER_FLAGS{ };
pub const POINTER_FLAG_NEW = POINTER_FLAGS{ .NEW = 1 };
pub const POINTER_FLAG_INRANGE = POINTER_FLAGS{ .INRANGE = 1 };
pub const POINTER_FLAG_INCONTACT = POINTER_FLAGS{ .INCONTACT = 1 };
pub const POINTER_FLAG_FIRSTBUTTON = POINTER_FLAGS{ .FIRSTBUTTON = 1 };
pub const POINTER_FLAG_SECONDBUTTON = POINTER_FLAGS{ .SECONDBUTTON = 1 };
pub const POINTER_FLAG_THIRDBUTTON = POINTER_FLAGS{ .THIRDBUTTON = 1 };
pub const POINTER_FLAG_FOURTHBUTTON = POINTER_FLAGS{ .FOURTHBUTTON = 1 };
pub const POINTER_FLAG_FIFTHBUTTON = POINTER_FLAGS{ .FIFTHBUTTON = 1 };
pub const POINTER_FLAG_PRIMARY = POINTER_FLAGS{ .PRIMARY = 1 };
pub const POINTER_FLAG_CONFIDENCE = POINTER_FLAGS{ .CONFIDENCE = 1 };
pub const POINTER_FLAG_CANCELED = POINTER_FLAGS{ .CANCELED = 1 };
pub const POINTER_FLAG_DOWN = POINTER_FLAGS{ .DOWN = 1 };
pub const POINTER_FLAG_UPDATE = POINTER_FLAGS{ .UPDATE = 1 };
pub const POINTER_FLAG_UP = POINTER_FLAGS{ .UP = 1 };
pub const POINTER_FLAG_WHEEL = POINTER_FLAGS{ .WHEEL = 1 };
pub const POINTER_FLAG_HWHEEL = POINTER_FLAGS{ .HWHEEL = 1 };
pub const POINTER_FLAG_CAPTURECHANGED = POINTER_FLAGS{ .CAPTURECHANGED = 1 };
pub const POINTER_FLAG_HASTRANSFORM = POINTER_FLAGS{ .HASTRANSFORM = 1 };

pub const TOUCH_FEEDBACK_MODE = enum(u32) {
    DEFAULT = 1,
    INDIRECT = 2,
    NONE = 3,
};
pub const TOUCH_FEEDBACK_DEFAULT = TOUCH_FEEDBACK_MODE.DEFAULT;
pub const TOUCH_FEEDBACK_INDIRECT = TOUCH_FEEDBACK_MODE.INDIRECT;
pub const TOUCH_FEEDBACK_NONE = TOUCH_FEEDBACK_MODE.NONE;

pub const POINTER_BUTTON_CHANGE_TYPE = enum(i32) {
    NONE = 0,
    FIRSTBUTTON_DOWN = 1,
    FIRSTBUTTON_UP = 2,
    SECONDBUTTON_DOWN = 3,
    SECONDBUTTON_UP = 4,
    THIRDBUTTON_DOWN = 5,
    THIRDBUTTON_UP = 6,
    FOURTHBUTTON_DOWN = 7,
    FOURTHBUTTON_UP = 8,
    FIFTHBUTTON_DOWN = 9,
    FIFTHBUTTON_UP = 10,
};
pub const POINTER_CHANGE_NONE = POINTER_BUTTON_CHANGE_TYPE.NONE;
pub const POINTER_CHANGE_FIRSTBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.FIRSTBUTTON_DOWN;
pub const POINTER_CHANGE_FIRSTBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.FIRSTBUTTON_UP;
pub const POINTER_CHANGE_SECONDBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.SECONDBUTTON_DOWN;
pub const POINTER_CHANGE_SECONDBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.SECONDBUTTON_UP;
pub const POINTER_CHANGE_THIRDBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.THIRDBUTTON_DOWN;
pub const POINTER_CHANGE_THIRDBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.THIRDBUTTON_UP;
pub const POINTER_CHANGE_FOURTHBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.FOURTHBUTTON_DOWN;
pub const POINTER_CHANGE_FOURTHBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.FOURTHBUTTON_UP;
pub const POINTER_CHANGE_FIFTHBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.FIFTHBUTTON_DOWN;
pub const POINTER_CHANGE_FIFTHBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.FIFTHBUTTON_UP;

pub const POINTER_INFO = extern struct {
    pointerType: POINTER_INPUT_TYPE,
    pointerId: u32,
    frameId: u32,
    pointerFlags: POINTER_FLAGS,
    sourceDevice: ?HANDLE,
    hwndTarget: ?HWND,
    ptPixelLocation: POINT,
    ptHimetricLocation: POINT,
    ptPixelLocationRaw: POINT,
    ptHimetricLocationRaw: POINT,
    dwTime: u32,
    historyCount: u32,
    InputData: i32,
    dwKeyStates: u32,
    PerformanceCount: u64,
    ButtonChangeType: POINTER_BUTTON_CHANGE_TYPE,
};

pub const POINTER_TOUCH_INFO = extern struct {
    pointerInfo: POINTER_INFO,
    touchFlags: u32,
    touchMask: u32,
    rcContact: RECT,
    rcContactRaw: RECT,
    orientation: u32,
    pressure: u32,
};

pub const POINTER_PEN_INFO = extern struct {
    pointerInfo: POINTER_INFO,
    penFlags: u32,
    penMask: u32,
    pressure: u32,
    rotation: u32,
    tiltX: i32,
    tiltY: i32,
};

pub const INPUT_INJECTION_VALUE = extern struct {
    page: u16,
    usage: u16,
    value: i32,
    index: u16,
};

pub const INPUT_TRANSFORM = extern struct {
    Anonymous: extern union {
        Anonymous: extern struct {
            _11: f32,
            _12: f32,
            _13: f32,
            _14: f32,
            _21: f32,
            _22: f32,
            _23: f32,
            _24: f32,
            _31: f32,
            _32: f32,
            _33: f32,
            _34: f32,
            _41: f32,
            _42: f32,
            _43: f32,
            _44: f32,
        },
        m: [16]f32,
    },
};


//--------------------------------------------------------------------------------
// Section: Functions (28)
//--------------------------------------------------------------------------------
// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetUnpredictedMessagePos(
) callconv(@import("std").os.windows.WINAPI) u32;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn InitializeTouchInjection(
    maxCount: u32,
    dwMode: TOUCH_FEEDBACK_MODE,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn InjectTouchInput(
    count: u32,
    contacts: [*]const POINTER_TOUCH_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerType(
    pointerId: u32,
    pointerType: ?*POINTER_INPUT_TYPE,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerCursorId(
    pointerId: u32,
    cursorId: ?*u32,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerInfo(
    pointerId: u32,
    pointerInfo: ?*POINTER_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    pointerInfo: ?[*]POINTER_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFrameInfo(
    pointerId: u32,
    pointerCount: ?*u32,
    pointerInfo: ?[*]POINTER_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFrameInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    pointerCount: ?*u32,
    pointerInfo: ?*POINTER_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerTouchInfo(
    pointerId: u32,
    touchInfo: ?*POINTER_TOUCH_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerTouchInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    touchInfo: ?[*]POINTER_TOUCH_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFrameTouchInfo(
    pointerId: u32,
    pointerCount: ?*u32,
    touchInfo: ?[*]POINTER_TOUCH_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFrameTouchInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    pointerCount: ?*u32,
    touchInfo: ?*POINTER_TOUCH_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerPenInfo(
    pointerId: u32,
    penInfo: ?*POINTER_PEN_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerPenInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    penInfo: ?[*]POINTER_PEN_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFramePenInfo(
    pointerId: u32,
    pointerCount: ?*u32,
    penInfo: ?[*]POINTER_PEN_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerFramePenInfoHistory(
    pointerId: u32,
    entriesCount: ?*u32,
    pointerCount: ?*u32,
    penInfo: ?*POINTER_PEN_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn SkipPointerFrameMessages(
    pointerId: u32,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows10.0.17763'
pub extern "user32" fn InjectSyntheticPointerInput(
    device: ?HSYNTHETICPOINTERDEVICE,
    pointerInfo: [*]const POINTER_TYPE_INFO,
    count: u32,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn EnableMouseInPointer(
    fEnable: BOOL,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn IsMouseInPointerEnabled(
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.1'
pub extern "user32" fn GetPointerInputTransform(
    pointerId: u32,
    historyCount: u32,
    inputTransform: [*]INPUT_TRANSFORM,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerDevices(
    deviceCount: ?*u32,
    pointerDevices: ?[*]POINTER_DEVICE_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerDevice(
    device: ?HANDLE,
    pointerDevice: ?*POINTER_DEVICE_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerDeviceProperties(
    device: ?HANDLE,
    propertyCount: ?*u32,
    pointerProperties: ?[*]POINTER_DEVICE_PROPERTY,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerDeviceRects(
    device: ?HANDLE,
    pointerDeviceRect: ?*RECT,
    displayRect: ?*RECT,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetPointerDeviceCursors(
    device: ?HANDLE,
    cursorCount: ?*u32,
    deviceCursors: ?[*]POINTER_DEVICE_CURSOR_INFO,
) callconv(@import("std").os.windows.WINAPI) BOOL;

// TODO: this type is limited to platform 'windows8.0'
pub extern "user32" fn GetRawPointerDeviceData(
    pointerId: u32,
    historyCount: u32,
    propertiesCount: u32,
    pProperties: [*]POINTER_DEVICE_PROPERTY,
    pValues: ?*i32,
) callconv(@import("std").os.windows.WINAPI) BOOL;


//--------------------------------------------------------------------------------
// Section: Unicode Aliases (0)
//--------------------------------------------------------------------------------
const thismodule = @This();
pub usingnamespace switch (@import("../../zig.zig").unicode_mode) {
    .ansi => struct {
    },
    .wide => struct {
    },
    .unspecified => if (@import("builtin").is_test) struct {
    } else struct {
    },
};
//--------------------------------------------------------------------------------
// Section: Imports (11)
//--------------------------------------------------------------------------------
const BOOL = @import("../../foundation.zig").BOOL;
const HANDLE = @import("../../foundation.zig").HANDLE;
const HSYNTHETICPOINTERDEVICE = @import("../../ui/controls.zig").HSYNTHETICPOINTERDEVICE;
const HWND = @import("../../foundation.zig").HWND;
const POINT = @import("../../foundation.zig").POINT;
const POINTER_DEVICE_CURSOR_INFO = @import("../../ui/controls.zig").POINTER_DEVICE_CURSOR_INFO;
const POINTER_DEVICE_INFO = @import("../../ui/controls.zig").POINTER_DEVICE_INFO;
const POINTER_DEVICE_PROPERTY = @import("../../ui/controls.zig").POINTER_DEVICE_PROPERTY;
const POINTER_INPUT_TYPE = @import("../../ui/windows_and_messaging.zig").POINTER_INPUT_TYPE;
const POINTER_TYPE_INFO = @import("../../ui/controls.zig").POINTER_TYPE_INFO;
const RECT = @import("../../foundation.zig").RECT;

test {
    @setEvalBranchQuota(
        comptime @import("std").meta.declarations(@This()).len * 3
    );

    // reference all the pub declarations
    if (!@import("builtin").is_test) return;
    inline for (comptime @import("std").meta.declarations(@This())) |decl| {
        _ = @field(@This(), decl.name);
    }
}
