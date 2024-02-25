module glf90w
    use, intrinsic :: iso_fortran_env, only : int32

    implicit none

    integer, parameter :: GLFW_KEY_UNKNOWN       = -1

    integer, parameter :: GLFW_KEY_SPACE         = 32
    integer, parameter :: GLFW_KEY_APOSTROPHE    = 39
    integer, parameter :: GLFW_KEY_COMMA         = 44
    integer, parameter :: GLFW_KEY_MINUS         = 45
    integer, parameter :: GLFW_KEY_PERIOD        = 46
    integer, parameter :: GLFW_KEY_SLASH         = 47
    integer, parameter :: GLFW_KEY_0             = 48
    integer, parameter :: GLFW_KEY_1             = 49
    integer, parameter :: GLFW_KEY_2             = 50
    integer, parameter :: GLFW_KEY_3             = 51
    integer, parameter :: GLFW_KEY_4             = 52
    integer, parameter :: GLFW_KEY_5             = 53
    integer, parameter :: GLFW_KEY_6             = 54
    integer, parameter :: GLFW_KEY_7             = 55
    integer, parameter :: GLFW_KEY_8             = 56
    integer, parameter :: GLFW_KEY_9             = 57
    integer, parameter :: GLFW_KEY_SEMICOLON     = 59
    integer, parameter :: GLFW_KEY_EQUAL         = 61
    integer, parameter :: GLFW_KEY_A             = 65
    integer, parameter :: GLFW_KEY_B             = 66
    integer, parameter :: GLFW_KEY_C             = 67
    integer, parameter :: GLFW_KEY_D             = 68
    integer, parameter :: GLFW_KEY_E             = 69
    integer, parameter :: GLFW_KEY_F             = 70
    integer, parameter :: GLFW_KEY_G             = 71
    integer, parameter :: GLFW_KEY_H             = 72
    integer, parameter :: GLFW_KEY_I             = 73
    integer, parameter :: GLFW_KEY_J             = 74
    integer, parameter :: GLFW_KEY_K             = 75
    integer, parameter :: GLFW_KEY_L             = 76
    integer, parameter :: GLFW_KEY_M             = 77
    integer, parameter :: GLFW_KEY_N             = 78
    integer, parameter :: GLFW_KEY_O             = 79
    integer, parameter :: GLFW_KEY_P             = 80
    integer, parameter :: GLFW_KEY_Q             = 81
    integer, parameter :: GLFW_KEY_R             = 82
    integer, parameter :: GLFW_KEY_S             = 83
    integer, parameter :: GLFW_KEY_T             = 84
    integer, parameter :: GLFW_KEY_U             = 85
    integer, parameter :: GLFW_KEY_V             = 86
    integer, parameter :: GLFW_KEY_W             = 87
    integer, parameter :: GLFW_KEY_X             = 88
    integer, parameter :: GLFW_KEY_Y             = 89
    integer, parameter :: GLFW_KEY_Z             = 90
    integer, parameter :: GLFW_KEY_LEFT_BRACKET  = 91
    integer, parameter :: GLFW_KEY_BACKSLASH     = 92
    integer, parameter :: GLFW_KEY_RIGHT_BRACKET = 93
    integer, parameter :: GLFW_KEY_GRAVE_ACCENT  = 96
    integer, parameter :: GLFW_KEY_WORLD_1       = 161 ! non-US #1
    integer, parameter :: GLFW_KEY_WORLD_2       = 162 ! non-US #2

    integer, parameter :: GLFW_KEY_ESCAPE        = 256
    integer, parameter :: GLFW_KEY_ENTER         = 257
    integer, parameter :: GLFW_KEY_TAB           = 258
    integer, parameter :: GLFW_KEY_BACKSPACE     = 259
    integer, parameter :: GLFW_KEY_INSERT        = 260
    integer, parameter :: GLFW_KEY_DELETE        = 261
    integer, parameter :: GLFW_KEY_RIGHT         = 262
    integer, parameter :: GLFW_KEY_LEFT          = 263
    integer, parameter :: GLFW_KEY_DOWN          = 264
    integer, parameter :: GLFW_KEY_UP            = 265
    integer, parameter :: GLFW_KEY_PAGE_UP       = 266
    integer, parameter :: GLFW_KEY_PAGE_DOWN     = 267
    integer, parameter :: GLFW_KEY_HOME          = 268
    integer, parameter :: GLFW_KEY_END           = 269
    integer, parameter :: GLFW_KEY_CAPS_LOCK     = 280
    integer, parameter :: GLFW_KEY_SCROLL_LOCK   = 281
    integer, parameter :: GLFW_KEY_NUM_LOCK      = 282
    integer, parameter :: GLFW_KEY_PRINT_SCREEN  = 283
    integer, parameter :: GLFW_KEY_PAUSE         = 284
    integer, parameter :: GLFW_KEY_F1            = 290
    integer, parameter :: GLFW_KEY_F2            = 291
    integer, parameter :: GLFW_KEY_F3            = 292
    integer, parameter :: GLFW_KEY_F4            = 293
    integer, parameter :: GLFW_KEY_F5            = 294
    integer, parameter :: GLFW_KEY_F6            = 295
    integer, parameter :: GLFW_KEY_F7            = 296
    integer, parameter :: GLFW_KEY_F8            = 297
    integer, parameter :: GLFW_KEY_F9            = 298
    integer, parameter :: GLFW_KEY_F10           = 299
    integer, parameter :: GLFW_KEY_F11           = 300
    integer, parameter :: GLFW_KEY_F12           = 301
    integer, parameter :: GLFW_KEY_F13           = 302
    integer, parameter :: GLFW_KEY_F14           = 303
    integer, parameter :: GLFW_KEY_F15           = 304
    integer, parameter :: GLFW_KEY_F16           = 305
    integer, parameter :: GLFW_KEY_F17           = 306
    integer, parameter :: GLFW_KEY_F18           = 307
    integer, parameter :: GLFW_KEY_F19           = 308
    integer, parameter :: GLFW_KEY_F20           = 309
    integer, parameter :: GLFW_KEY_F21           = 310
    integer, parameter :: GLFW_KEY_F22           = 311
    integer, parameter :: GLFW_KEY_F23           = 312
    integer, parameter :: GLFW_KEY_F24           = 313
    integer, parameter :: GLFW_KEY_F25           = 314
    integer, parameter :: GLFW_KEY_KP_0          = 320
    integer, parameter :: GLFW_KEY_KP_1          = 321
    integer, parameter :: GLFW_KEY_KP_2          = 322
    integer, parameter :: GLFW_KEY_KP_3          = 323
    integer, parameter :: GLFW_KEY_KP_4          = 324
    integer, parameter :: GLFW_KEY_KP_5          = 325
    integer, parameter :: GLFW_KEY_KP_6          = 326
    integer, parameter :: GLFW_KEY_KP_7          = 327
    integer, parameter :: GLFW_KEY_KP_8          = 328
    integer, parameter :: GLFW_KEY_KP_9          = 329
    integer, parameter :: GLFW_KEY_KP_DECIMAL    = 330
    integer, parameter :: GLFW_KEY_KP_DIVIDE     = 331
    integer, parameter :: GLFW_KEY_KP_MULTIPLY   = 332
    integer, parameter :: GLFW_KEY_KP_SUBTRACT   = 333
    integer, parameter :: GLFW_KEY_KP_ADD        = 334
    integer, parameter :: GLFW_KEY_KP_ENTER      = 335
    integer, parameter :: GLFW_KEY_KP_EQUAL      = 336
    integer, parameter :: GLFW_KEY_LEFT_SHIFT    = 340
    integer, parameter :: GLFW_KEY_LEFT_CONTROL  = 341
    integer, parameter :: GLFW_KEY_LEFT_ALT      = 342
    integer, parameter :: GLFW_KEY_LEFT_SUPER    = 343
    integer, parameter :: GLFW_KEY_RIGHT_SHIFT   = 344
    integer, parameter :: GLFW_KEY_RIGHT_CONTROL = 345
    integer, parameter :: GLFW_KEY_RIGHT_ALT     = 346
    integer, parameter :: GLFW_KEY_RIGHT_SUPER   = 347
    integer, parameter :: GLFW_KEY_MENU          = 348

    integer, parameter :: GLFW_KEY_LAST          = GLFW_KEY_MENU

    integer, parameter :: GLFW_MOUSE_BUTTON_1      = 0
    integer, parameter :: GLFW_MOUSE_BUTTON_2      = 1
    integer, parameter :: GLFW_MOUSE_BUTTON_3      = 2
    integer, parameter :: GLFW_MOUSE_BUTTON_4      = 3
    integer, parameter :: GLFW_MOUSE_BUTTON_5      = 4
    integer, parameter :: GLFW_MOUSE_BUTTON_6      = 5
    integer, parameter :: GLFW_MOUSE_BUTTON_7      = 6
    integer, parameter :: GLFW_MOUSE_BUTTON_8      = 7
    integer, parameter :: GLFW_MOUSE_BUTTON_LAST   = GLFW_MOUSE_BUTTON_8
    integer, parameter :: GLFW_MOUSE_BUTTON_LEFT   = GLFW_MOUSE_BUTTON_1
    integer, parameter :: GLFW_MOUSE_BUTTON_RIGHT  = GLFW_MOUSE_BUTTON_2
    integer, parameter :: GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3

    integer, parameter :: GLFW_JOYSTICK_1    = 0
    integer, parameter :: GLFW_JOYSTICK_2    = 1
    integer, parameter :: GLFW_JOYSTICK_3    = 2
    integer, parameter :: GLFW_JOYSTICK_4    = 3
    integer, parameter :: GLFW_JOYSTICK_5    = 4
    integer, parameter :: GLFW_JOYSTICK_6    = 5
    integer, parameter :: GLFW_JOYSTICK_7    = 6
    integer, parameter :: GLFW_JOYSTICK_8    = 7
    integer, parameter :: GLFW_JOYSTICK_9    = 8
    integer, parameter :: GLFW_JOYSTICK_10   = 9
    integer, parameter :: GLFW_JOYSTICK_11   = 10
    integer, parameter :: GLFW_JOYSTICK_12   = 11
    integer, parameter :: GLFW_JOYSTICK_13   = 12
    integer, parameter :: GLFW_JOYSTICK_14   = 13
    integer, parameter :: GLFW_JOYSTICK_15   = 14
    integer, parameter :: GLFW_JOYSTICK_16   = 15
    integer, parameter :: GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16

    integer, parameter :: GLFW_GAMEPAD_BUTTON_A            = 0
    integer, parameter :: GLFW_GAMEPAD_BUTTON_B            = 1
    integer, parameter :: GLFW_GAMEPAD_BUTTON_X            = 2
    integer, parameter :: GLFW_GAMEPAD_BUTTON_Y            = 3
    integer, parameter :: GLFW_GAMEPAD_BUTTON_LEFT_BUMPER  = 4
    integer, parameter :: GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5
    integer, parameter :: GLFW_GAMEPAD_BUTTON_BACK         = 6
    integer, parameter :: GLFW_GAMEPAD_BUTTON_START        = 7
    integer, parameter :: GLFW_GAMEPAD_BUTTON_GUIDE        = 8
    integer, parameter :: GLFW_GAMEPAD_BUTTON_LEFT_THUMB   = 9
    integer, parameter :: GLFW_GAMEPAD_BUTTON_RIGHT_THUMB  = 10
    integer, parameter :: GLFW_GAMEPAD_BUTTON_DPAD_UP      = 11
    integer, parameter :: GLFW_GAMEPAD_BUTTON_DPAD_RIGHT   = 12
    integer, parameter :: GLFW_GAMEPAD_BUTTON_DPAD_DOWN    = 13
    integer, parameter :: GLFW_GAMEPAD_BUTTON_DPAD_LEFT    = 14
    integer, parameter :: GLFW_GAMEPAD_BUTTON_LAST         = GLFW_GAMEPAD_BUTTON_DPAD_LEFT
    integer, parameter :: GLFW_GAMEPAD_BUTTON_CROSS        = GLFW_GAMEPAD_BUTTON_A
    integer, parameter :: GLFW_GAMEPAD_BUTTON_CIRCLE       = GLFW_GAMEPAD_BUTTON_B
    integer, parameter :: GLFW_GAMEPAD_BUTTON_SQUARE       = GLFW_GAMEPAD_BUTTON_X
    integer, parameter :: GLFW_GAMEPAD_BUTTON_TRIANGLE     = GLFW_GAMEPAD_BUTTON_Y
    integer, parameter :: GLFW_GAMEPAD_AXIS_LEFT_X         = 0
    integer, parameter :: GLFW_GAMEPAD_AXIS_LEFT_Y         = 1
    integer, parameter :: GLFW_GAMEPAD_AXIS_RIGHT_X        = 2
    integer, parameter :: GLFW_GAMEPAD_AXIS_RIGHT_Y        = 3
    integer, parameter :: GLFW_GAMEPAD_AXIS_LEFT_TRIGGER   = 4
    integer, parameter :: GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER  = 5
    integer, parameter :: GLFW_GAMEPAD_AXIS_LAST           = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
    integer, parameter :: GLFW_NO_ERROR                = 0
    integer, parameter :: GLFW_NOT_INITIALIZED         = int(Z'00010001', kind=int32)
    integer, parameter :: GLFW_NO_CURRENT_CONTEXT      = int(Z'00010002', kind=int32)
    integer, parameter :: GLFW_INVALID_ENUM            = int(Z'00010003', kind=int32)
    integer, parameter :: GLFW_INVALID_VALUE           = int(Z'00010004', kind=int32)
    integer, parameter :: GLFW_OUT_OF_MEMORY           = int(Z'00010005', kind=int32)
    integer, parameter :: GLFW_API_UNAVAILABLE         = int(Z'00010006', kind=int32)
    integer, parameter :: GLFW_VERSION_UNAVAILABLE     = int(Z'00010007', kind=int32)
    integer, parameter :: GLFW_PLATFORM_ERROR          = int(Z'00010008', kind=int32)
    integer, parameter :: GLFW_FORMAT_UNAVAILABLE      = int(Z'00010009', kind=int32)
    integer, parameter :: GLFW_NO_WINDOW_CONTEXT       = int(Z'0001000A', kind=int32)
    integer, parameter :: GLFW_CURSOR_UNAVAILABLE      = int(Z'0001000B', kind=int32)
    integer, parameter :: GLFW_FEATURE_UNAVAILABLE     = int(Z'0001000C', kind=int32)
    integer, parameter :: GLFW_FEATURE_UNIMPLEMENTED   = int(Z'0001000D', kind=int32)
    integer, parameter :: GLFW_PLATFORM_UNAVAILABLE    = int(Z'0001000E', kind=int32)
    integer, parameter :: GLFW_FOCUSED                 = int(Z'00020001', kind=int32)
    integer, parameter :: GLFW_ICONIFIED               = int(Z'00020002', kind=int32)
    integer, parameter :: GLFW_RESIZABLE               = int(Z'00020003', kind=int32)
    integer, parameter :: GLFW_VISIBLE                 = int(Z'00020004', kind=int32)
    integer, parameter :: GLFW_DECORATED               = int(Z'00020005', kind=int32)
    integer, parameter :: GLFW_AUTO_ICONIFY            = int(Z'00020006', kind=int32)
    integer, parameter :: GLFW_FLOATING                = int(Z'00020007', kind=int32)
    integer, parameter :: GLFW_MAXIMIZED               = int(Z'00020008', kind=int32)
    integer, parameter :: GLFW_CENTER_CURSOR           = int(Z'00020009', kind=int32)
    integer, parameter :: GLFW_TRANSPARENT_FRAMEBUFFER = int(Z'0002000A', kind=int32)
    integer, parameter :: GLFW_HOVERED                 = int(Z'0002000B', kind=int32)
    integer, parameter :: GLFW_FOCUS_ON_SHOW           = int(Z'0002000C', kind=int32)

    integer, parameter :: GLFW_MOUSE_PASSTHROUGH        = int(Z'0002000D', kind=int32)

    integer, parameter :: GLFW_POSITION_X               = int(Z'0002000E', kind=int32)
    integer, parameter :: GLFW_POSITION_Y               = int(Z'0002000F', kind=int32)

    integer, parameter :: GLFW_RED_BITS                 = int(Z'00021001', kind=int32)
    integer, parameter :: GLFW_GREEN_BITS               = int(Z'00021002', kind=int32)
    integer, parameter :: GLFW_BLUE_BITS                = int(Z'00021003', kind=int32)
    integer, parameter :: GLFW_ALPHA_BITS               = int(Z'00021004', kind=int32)
    integer, parameter :: GLFW_DEPTH_BITS               = int(Z'00021005', kind=int32)
    integer, parameter :: GLFW_STENCIL_BITS             = int(Z'00021006', kind=int32)
    integer, parameter :: GLFW_ACCUM_RED_BITS           = int(Z'00021007', kind=int32)
    integer, parameter :: GLFW_ACCUM_GREEN_BITS         = int(Z'00021008', kind=int32)
    integer, parameter :: GLFW_ACCUM_BLUE_BITS          = int(Z'00021009', kind=int32)
    integer, parameter :: GLFW_ACCUM_ALPHA_BITS         = int(Z'0002100A', kind=int32)
    integer, parameter :: GLFW_AUX_BUFFERS              = int(Z'0002100B', kind=int32)
    integer, parameter :: GLFW_STEREO                   = int(Z'0002100C', kind=int32)
    integer, parameter :: GLFW_SAMPLES                  = int(Z'0002100D', kind=int32)
    integer, parameter :: GLFW_SRGB_CAPABLE             = int(Z'0002100E', kind=int32)
    integer, parameter :: GLFW_REFRESH_RATE             = int(Z'0002100F', kind=int32)
    integer, parameter :: GLFW_DOUBLEBUFFER             = int(Z'00021010', kind=int32)

    integer, parameter :: GLFW_CLIENT_API               = int(Z'00022001', kind=int32)
    integer, parameter :: GLFW_CONTEXT_VERSION_MAJOR    = int(Z'00022002', kind=int32)
    integer, parameter :: GLFW_CONTEXT_VERSION_MINOR    = int(Z'00022003', kind=int32)
    integer, parameter :: GLFW_CONTEXT_REVISION         = int(Z'00022004', kind=int32)
    integer, parameter :: GLFW_CONTEXT_ROBUSTNESS       = int(Z'00022005', kind=int32)
    integer, parameter :: GLFW_OPENGL_FORWARD_COMPAT    = int(Z'00022006', kind=int32)
    integer, parameter :: GLFW_CONTEXT_DEBUG            = int(Z'00022007', kind=int32)
    integer, parameter :: GLFW_OPENGL_DEBUG_CONTEXT     = GLFW_CONTEXT_DEBUG
    integer, parameter :: GLFW_OPENGL_PROFILE           = int(Z'00022008', kind=int32)
    integer, parameter :: GLFW_CONTEXT_RELEASE_BEHAVIOR = int(Z'00022009', kind=int32)
    integer, parameter :: GLFW_CONTEXT_NO_ERROR         = int(Z'0002200A', kind=int32)
    integer, parameter :: GLFW_CONTEXT_CREATION_API     = int(Z'0002200B', kind=int32)
    integer, parameter :: GLFW_SCALE_TO_MONITOR         = int(Z'0002200C', kind=int32)
    integer, parameter :: GLFW_SCALE_FRAMEBUFFER        = int(Z'0002200D', kind=int32)
    integer, parameter :: GLFW_COCOA_RETINA_FRAMEBUFFER = int(Z'00023001', kind=int32)
    integer, parameter :: GLFW_COCOA_FRAME_NAME         = int(Z'00023002', kind=int32)
    integer, parameter :: GLFW_COCOA_GRAPHICS_SWITCHING = int(Z'00023003', kind=int32)
    integer, parameter :: GLFW_X11_CLASS_NAME           = int(Z'00024001', kind=int32)
    integer, parameter :: GLFW_X11_INSTANCE_NAME        = int(Z'00024002', kind=int32)
    integer, parameter :: GLFW_WIN32_KEYBOARD_MENU      = int(Z'00025001', kind=int32)
    integer, parameter :: GLFW_WIN32_SHOWDEFAULT        = int(Z'00025002', kind=int32)
    integer, parameter :: GLFW_WAYLAND_APP_ID           = int(Z'00026001', kind=int32)
    integer, parameter :: GLFW_NO_API                   = 0
    integer, parameter :: GLFW_OPENGL_API               = int(Z'00030001', kind=int32)
    integer, parameter :: GLFW_OPENGL_ES_API            = int(Z'00030002', kind=int32)

    integer, parameter :: GLFW_NO_ROBUSTNESS         = 0
    integer, parameter :: GLFW_NO_RESET_NOTIFICATION = int(Z'00031001', kind=int32)
    integer, parameter :: GLFW_LOSE_CONTEXT_ON_RESET = int(Z'00031002', kind=int32)

    integer, parameter :: GLFW_OPENGL_ANY_PROFILE    = 0
    integer, parameter :: GLFW_OPENGL_CORE_PROFILE   = int(Z'00032001', kind=int32)
    integer, parameter :: GLFW_OPENGL_COMPAT_PROFILE = int(Z'00032002', kind=int32)

    integer, parameter :: GLFW_CURSOR               = int(Z'00033002', kind=int32)
    integer, parameter :: GLFW_STICKY_KEYS          = int(Z'00033002', kind=int32)
    integer, parameter :: GLFW_STICKY_MOUSE_BUTTONS = int(Z'00033003', kind=int32)
    integer, parameter :: GLFW_LOCK_KEY_MODS        = int(Z'00033004', kind=int32)
    integer, parameter :: GLFW_RAW_MOUSE_MOTION     = int(Z'00033005', kind=int32)

    integer, parameter :: GLFW_CURSOR_NORMAL   = int(Z'00034001', kind=int32)
    integer, parameter :: GLFW_CURSOR_HIDDEN   = int(Z'00034002', kind=int32)
    integer, parameter :: GLFW_CURSOR_DISABLED = int(Z'00034003', kind=int32)
    integer, parameter :: GLFW_CURSOR_CAPTURED = int(Z'00034004', kind=int32)

    integer, parameter :: GLFW_ANY_RELEASE_BEHAVIOR   = 0
    integer, parameter :: GLFW_RELEASE_BEHAVIOR_FLUSH = int(Z'00035001', kind=int32)
    integer, parameter :: GLFW_RELEASE_BEHAVIOR_NONE  = int(Z'00035002', kind=int32)

    integer, parameter :: GLFW_NATIVE_CONTEXT_API = int(Z'00036001', kind=int32)
    integer, parameter :: GLFW_EGL_CONTEXT_API    = int(Z'00036002', kind=int32)
    integer, parameter :: GLFW_OSMESA_CONTEXT_API = int(Z'00036003', kind=int32)

    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_NONE     = int(Z'00037001', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_OPENGL   = int(Z'00037002', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_OPENGLES = int(Z'00037003', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_D3D9     = int(Z'00037004', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_D3D11    = int(Z'00037005', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_VULKAN   = int(Z'00037007', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE_METAL    = int(Z'00037008', kind=int32)

    integer, parameter :: GLFW_WAYLAND_PREFER_LIBDECOR  = int(Z'00038001', kind=int32)
    integer, parameter :: GLFW_WAYLAND_DISABLE_LIBDECOR = int(Z'00038002', kind=int32)

    integer, parameter :: GLFW_ANY_POSITION = int(Z'80000000', kind=int32)

    integer, parameter :: GLFW_ARROW_CURSOR         = int(Z'00036001', kind=int32)
    integer, parameter :: GLFW_IBEAM_CURSOR         = int(Z'00036002', kind=int32)
    integer, parameter :: GLFW_CROSSHAIR_CURSOR     = int(Z'00036003', kind=int32)
    integer, parameter :: GLFW_POINTING_HAND_CURSOR = int(Z'00036004', kind=int32)
    integer, parameter :: GLFW_RESIZE_EW_CURSOR     = int(Z'00036005', kind=int32)
    integer, parameter :: GLFW_RESIZE_NS_CURSOR     = int(Z'00036006', kind=int32)
    integer, parameter :: GLFW_RESIZE_NWSE_CURSOR   = int(Z'00036007', kind=int32)
    integer, parameter :: GLFW_RESIZE_NESW_CURSOR   = int(Z'00036008', kind=int32)
    integer, parameter :: GLFW_RESIZE_ALL_CURSOR    = int(Z'00036009', kind=int32)
    integer, parameter :: GLFW_NOT_ALLOWED_CURSOR   = int(Z'0003600A', kind=int32)
    integer, parameter :: GLFW_HRESIZE_CURSOR       = GLFW_RESIZE_EW_CURSOR
    integer, parameter :: GLFW_VRESIZE_CURSOR       = GLFW_RESIZE_NS_CURSOR
    integer, parameter :: GLFW_HAND_CURSOR          = GLFW_POINTING_HAND_CURSOR
    integer, parameter :: GLFW_CONNECTED            = int(Z'00040001', kind=int32)
    integer, parameter :: GLFW_DISCONNECTED         = int(Z'00040002', kind=int32)

    integer, parameter :: GLFW_JOYSTICK_HAT_BUTTONS   = int(Z'00050001', kind=int32)
    integer, parameter :: GLFW_ANGLE_PLATFORM_TYPE    = int(Z'00050002', kind=int32)
    integer, parameter :: GLFW_PLATFORM               = int(Z'00050003', kind=int32)
    integer, parameter :: GLFW_COCOA_CHDIR_RESOURCES  = int(Z'00051001', kind=int32)
    integer, parameter :: GLFW_COCOA_MENUBAR          = int(Z'00051002', kind=int32)
    integer, parameter :: GLFW_X11_XCB_VULKAN_SURFACE = int(Z'00052001', kind=int32)
    integer, parameter :: GLFW_WAYLAND_LIBDECOR       = int(Z'00053001', kind=int32)
    integer, parameter :: GLFW_ANY_PLATFORM           = int(Z'00060000', kind=int32)
    integer, parameter :: GLFW_PLATFORM_WIN32         = int(Z'00060001', kind=int32)
    integer, parameter :: GLFW_PLATFORM_COCOA         = int(Z'00060002', kind=int32)
    integer, parameter :: GLFW_PLATFORM_WAYLAND       = int(Z'00060003', kind=int32)
    integer, parameter :: GLFW_PLATFORM_X11           = int(Z'00060004', kind=int32)
    integer, parameter :: GLFW_PLATFORM_NULL          = int(Z'00060005', kind=int32)
    integer, parameter :: GLFW_DONT_CARE              = -1

end module glf90w
