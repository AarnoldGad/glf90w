! -----------------
! glf90w_constants.f90
! 16 Mar 2024
! Gaétan J.A.M. Jalin
! See end of file for complete licence description
! -----------------
module glf90w_constants
    use, intrinsic :: iso_c_binding, only: c_int

    implicit none
    private

    integer(c_int), bind(C, name="glf90w_version_major"),                  public :: GLFW_VERSION_MAJOR
    integer(c_int), bind(C, name="glf90w_version_minor"),                  public :: GLFW_VERSION_MINOR
    integer(c_int), bind(C, name="glf90w_version_revision"),               public :: GLFW_VERSION_REVISION
    integer(c_int), bind(C, name="glf90w_true"),                           public :: GLFW_TRUE
    integer(c_int), bind(C, name="glf90w_false"),                          public :: GLFW_FALSE

    integer(c_int), bind(C, name="glf90w_release"),                        public :: GLFW_RELEASE
    integer(c_int), bind(C, name="glf90w_press"),                          public :: GLFW_PRESS
    integer(c_int), bind(C, name="glf90w_repeat"),                         public :: GLFW_REPEAT
    integer(c_int), bind(C, name="glf90w_hat_centered"),                   public :: GLFW_HAT_CENTERED
    integer(c_int), bind(C, name="glf90w_hat_up"),                         public :: GLFW_HAT_UP
    integer(c_int), bind(C, name="glf90w_hat_right"),                      public :: GLFW_HAT_RIGHT
    integer(c_int), bind(C, name="glf90w_hat_down"),                       public :: GLFW_HAT_DOWN
    integer(c_int), bind(C, name="glf90w_hat_left"),                       public :: GLFW_HAT_LEFT
    integer(c_int), bind(C, name="glf90w_hat_right_up"),                   public :: GLFW_HAT_RIGHT_UP
    integer(c_int), bind(C, name="glf90w_hat_right_down"),                 public :: GLFW_HAT_RIGHT_DOWN
    integer(c_int), bind(C, name="glf90w_hat_left_up"),                    public :: GLFW_HAT_LEFT_UP
    integer(c_int), bind(C, name="glf90w_hat_left_down"),                  public :: GLFW_HAT_LEFT_DOWN

    integer(c_int), bind(C, name="glf90w_key_unknown"),                    public :: GLFW_KEY_UNKNOWN

    integer(c_int), bind(C, name="glf90w_key_space"),                      public :: GLFW_KEY_SPACE
    integer(c_int), bind(C, name="glf90w_key_apostrophe"),                 public :: GLFW_KEY_APOSTROPHE
    integer(c_int), bind(C, name="glf90w_key_comma"),                      public :: GLFW_KEY_COMMA
    integer(c_int), bind(C, name="glf90w_key_minus"),                      public :: GLFW_KEY_MINUS
    integer(c_int), bind(C, name="glf90w_key_period"),                     public :: GLFW_KEY_PERIOD
    integer(c_int), bind(C, name="glf90w_key_slash"),                      public :: GLFW_KEY_SLASH
    integer(c_int), bind(C, name="glf90w_key_0"),                          public :: GLFW_KEY_0
    integer(c_int), bind(C, name="glf90w_key_1"),                          public :: GLFW_KEY_1
    integer(c_int), bind(C, name="glf90w_key_2"),                          public :: GLFW_KEY_2
    integer(c_int), bind(C, name="glf90w_key_3"),                          public :: GLFW_KEY_3
    integer(c_int), bind(C, name="glf90w_key_4"),                          public :: GLFW_KEY_4
    integer(c_int), bind(C, name="glf90w_key_5"),                          public :: GLFW_KEY_5
    integer(c_int), bind(C, name="glf90w_key_6"),                          public :: GLFW_KEY_6
    integer(c_int), bind(C, name="glf90w_key_7"),                          public :: GLFW_KEY_7
    integer(c_int), bind(C, name="glf90w_key_8"),                          public :: GLFW_KEY_8
    integer(c_int), bind(C, name="glf90w_key_9"),                          public :: GLFW_KEY_9
    integer(c_int), bind(C, name="glf90w_key_semicolon"),                  public :: GLFW_KEY_SEMICOLON
    integer(c_int), bind(C, name="glf90w_key_equal"),                      public :: GLFW_KEY_EQUAL
    integer(c_int), bind(C, name="glf90w_key_a"),                          public :: GLFW_KEY_A
    integer(c_int), bind(C, name="glf90w_key_b"),                          public :: GLFW_KEY_B
    integer(c_int), bind(C, name="glf90w_key_c"),                          public :: GLFW_KEY_C
    integer(c_int), bind(C, name="glf90w_key_d"),                          public :: GLFW_KEY_D
    integer(c_int), bind(C, name="glf90w_key_e"),                          public :: GLFW_KEY_E
    integer(c_int), bind(C, name="glf90w_key_f"),                          public :: GLFW_KEY_F
    integer(c_int), bind(C, name="glf90w_key_g"),                          public :: GLFW_KEY_G
    integer(c_int), bind(C, name="glf90w_key_h"),                          public :: GLFW_KEY_H
    integer(c_int), bind(C, name="glf90w_key_i"),                          public :: GLFW_KEY_I
    integer(c_int), bind(C, name="glf90w_key_j"),                          public :: GLFW_KEY_J
    integer(c_int), bind(C, name="glf90w_key_k"),                          public :: GLFW_KEY_K
    integer(c_int), bind(C, name="glf90w_key_l"),                          public :: GLFW_KEY_L
    integer(c_int), bind(C, name="glf90w_key_m"),                          public :: GLFW_KEY_M
    integer(c_int), bind(C, name="glf90w_key_n"),                          public :: GLFW_KEY_N
    integer(c_int), bind(C, name="glf90w_key_o"),                          public :: GLFW_KEY_O
    integer(c_int), bind(C, name="glf90w_key_p"),                          public :: GLFW_KEY_P
    integer(c_int), bind(C, name="glf90w_key_q"),                          public :: GLFW_KEY_Q
    integer(c_int), bind(C, name="glf90w_key_r"),                          public :: GLFW_KEY_R
    integer(c_int), bind(C, name="glf90w_key_s"),                          public :: GLFW_KEY_S
    integer(c_int), bind(C, name="glf90w_key_t"),                          public :: GLFW_KEY_T
    integer(c_int), bind(C, name="glf90w_key_u"),                          public :: GLFW_KEY_U
    integer(c_int), bind(C, name="glf90w_key_v"),                          public :: GLFW_KEY_V
    integer(c_int), bind(C, name="glf90w_key_w"),                          public :: GLFW_KEY_W
    integer(c_int), bind(C, name="glf90w_key_x"),                          public :: GLFW_KEY_X
    integer(c_int), bind(C, name="glf90w_key_y"),                          public :: GLFW_KEY_Y
    integer(c_int), bind(C, name="glf90w_key_z"),                          public :: GLFW_KEY_Z
    integer(c_int), bind(C, name="glf90w_key_left_bracket"),               public :: GLFW_KEY_LEFT_BRACKET
    integer(c_int), bind(C, name="glf90w_key_backslash"),                  public :: GLFW_KEY_BACKSLASH
    integer(c_int), bind(C, name="glf90w_key_right_bracket"),              public :: GLFW_KEY_RIGHT_BRACKET
    integer(c_int), bind(C, name="glf90w_key_grave_accent"),               public :: GLFW_KEY_GRAVE_ACCENT
    integer(c_int), bind(C, name="glf90w_key_world_1"),                    public :: GLFW_KEY_WORLD_1
    integer(c_int), bind(C, name="glf90w_key_world_2"),                    public :: GLFW_KEY_WORLD_2

    integer(c_int), bind(C, name="glf90w_key_escape"),                     public :: GLFW_KEY_ESCAPE
    integer(c_int), bind(C, name="glf90w_key_enter"),                      public :: GLFW_KEY_ENTER
    integer(c_int), bind(C, name="glf90w_key_tab"),                        public :: GLFW_KEY_TAB
    integer(c_int), bind(C, name="glf90w_key_backspace"),                  public :: GLFW_KEY_BACKSPACE
    integer(c_int), bind(C, name="glf90w_key_insert"),                     public :: GLFW_KEY_INSERT
    integer(c_int), bind(C, name="glf90w_key_delete"),                     public :: GLFW_KEY_DELETE
    integer(c_int), bind(C, name="glf90w_key_right"),                      public :: GLFW_KEY_RIGHT
    integer(c_int), bind(C, name="glf90w_key_left"),                       public :: GLFW_KEY_LEFT
    integer(c_int), bind(C, name="glf90w_key_down"),                       public :: GLFW_KEY_DOWN
    integer(c_int), bind(C, name="glf90w_key_up"),                         public :: GLFW_KEY_UP
    integer(c_int), bind(C, name="glf90w_key_page_up"),                    public :: GLFW_KEY_PAGE_UP
    integer(c_int), bind(C, name="glf90w_key_page_down"),                  public :: GLFW_KEY_PAGE_DOWN
    integer(c_int), bind(C, name="glf90w_key_home"),                       public :: GLFW_KEY_HOME
    integer(c_int), bind(C, name="glf90w_key_end"),                        public :: GLFW_KEY_END
    integer(c_int), bind(C, name="glf90w_key_caps_lock"),                  public :: GLFW_KEY_CAPS_LOCK
    integer(c_int), bind(C, name="glf90w_key_scroll_lock"),                public :: GLFW_KEY_SCROLL_LOCK
    integer(c_int), bind(C, name="glf90w_key_num_lock"),                   public :: GLFW_KEY_NUM_LOCK
    integer(c_int), bind(C, name="glf90w_key_print_screen"),               public :: GLFW_KEY_PRINT_SCREEN
    integer(c_int), bind(C, name="glf90w_key_pause"),                      public :: GLFW_KEY_PAUSE
    integer(c_int), bind(C, name="glf90w_key_f1"),                         public :: GLFW_KEY_F1
    integer(c_int), bind(C, name="glf90w_key_f2"),                         public :: GLFW_KEY_F2
    integer(c_int), bind(C, name="glf90w_key_f3"),                         public :: GLFW_KEY_F3
    integer(c_int), bind(C, name="glf90w_key_f4"),                         public :: GLFW_KEY_F4
    integer(c_int), bind(C, name="glf90w_key_f5"),                         public :: GLFW_KEY_F5
    integer(c_int), bind(C, name="glf90w_key_f6"),                         public :: GLFW_KEY_F6
    integer(c_int), bind(C, name="glf90w_key_f7"),                         public :: GLFW_KEY_F7
    integer(c_int), bind(C, name="glf90w_key_f8"),                         public :: GLFW_KEY_F8
    integer(c_int), bind(C, name="glf90w_key_f9"),                         public :: GLFW_KEY_F9
    integer(c_int), bind(C, name="glf90w_key_f10"),                        public :: GLFW_KEY_F10
    integer(c_int), bind(C, name="glf90w_key_f11"),                        public :: GLFW_KEY_F11
    integer(c_int), bind(C, name="glf90w_key_f12"),                        public :: GLFW_KEY_F12
    integer(c_int), bind(C, name="glf90w_key_f13"),                        public :: GLFW_KEY_F13
    integer(c_int), bind(C, name="glf90w_key_f14"),                        public :: GLFW_KEY_F14
    integer(c_int), bind(C, name="glf90w_key_f15"),                        public :: GLFW_KEY_F15
    integer(c_int), bind(C, name="glf90w_key_f16"),                        public :: GLFW_KEY_F16
    integer(c_int), bind(C, name="glf90w_key_f17"),                        public :: GLFW_KEY_F17
    integer(c_int), bind(C, name="glf90w_key_f18"),                        public :: GLFW_KEY_F18
    integer(c_int), bind(C, name="glf90w_key_f19"),                        public :: GLFW_KEY_F19
    integer(c_int), bind(C, name="glf90w_key_f20"),                        public :: GLFW_KEY_F20
    integer(c_int), bind(C, name="glf90w_key_f21"),                        public :: GLFW_KEY_F21
    integer(c_int), bind(C, name="glf90w_key_f22"),                        public :: GLFW_KEY_F22
    integer(c_int), bind(C, name="glf90w_key_f23"),                        public :: GLFW_KEY_F23
    integer(c_int), bind(C, name="glf90w_key_f24"),                        public :: GLFW_KEY_F24
    integer(c_int), bind(C, name="glf90w_key_f25"),                        public :: GLFW_KEY_F25
    integer(c_int), bind(C, name="glf90w_key_kp_0"),                       public :: GLFW_KEY_KP_0
    integer(c_int), bind(C, name="glf90w_key_kp_1"),                       public :: GLFW_KEY_KP_1
    integer(c_int), bind(C, name="glf90w_key_kp_2"),                       public :: GLFW_KEY_KP_2
    integer(c_int), bind(C, name="glf90w_key_kp_3"),                       public :: GLFW_KEY_KP_3
    integer(c_int), bind(C, name="glf90w_key_kp_4"),                       public :: GLFW_KEY_KP_4
    integer(c_int), bind(C, name="glf90w_key_kp_5"),                       public :: GLFW_KEY_KP_5
    integer(c_int), bind(C, name="glf90w_key_kp_6"),                       public :: GLFW_KEY_KP_6
    integer(c_int), bind(C, name="glf90w_key_kp_7"),                       public :: GLFW_KEY_KP_7
    integer(c_int), bind(C, name="glf90w_key_kp_8"),                       public :: GLFW_KEY_KP_8
    integer(c_int), bind(C, name="glf90w_key_kp_9"),                       public :: GLFW_KEY_KP_9
    integer(c_int), bind(C, name="glf90w_key_kp_decimal"),                 public :: GLFW_KEY_KP_DECIMAL
    integer(c_int), bind(C, name="glf90w_key_kp_divide"),                  public :: GLFW_KEY_KP_DIVIDE
    integer(c_int), bind(C, name="glf90w_key_kp_multiply"),                public :: GLFW_KEY_KP_MULTIPLY
    integer(c_int), bind(C, name="glf90w_key_kp_subtract"),                public :: GLFW_KEY_KP_SUBTRACT
    integer(c_int), bind(C, name="glf90w_key_kp_add"),                     public :: GLFW_KEY_KP_ADD
    integer(c_int), bind(C, name="glf90w_key_kp_enter"),                   public :: GLFW_KEY_KP_ENTER
    integer(c_int), bind(C, name="glf90w_key_kp_equal"),                   public :: GLFW_KEY_KP_EQUAL
    integer(c_int), bind(C, name="glf90w_key_left_shift"),                 public :: GLFW_KEY_LEFT_SHIFT
    integer(c_int), bind(C, name="glf90w_key_left_control"),               public :: GLFW_KEY_LEFT_CONTROL
    integer(c_int), bind(C, name="glf90w_key_left_alt"),                   public :: GLFW_KEY_LEFT_ALT
    integer(c_int), bind(C, name="glf90w_key_left_super"),                 public :: GLFW_KEY_LEFT_SUPER
    integer(c_int), bind(C, name="glf90w_key_right_shift"),                public :: GLFW_KEY_RIGHT_SHIFT
    integer(c_int), bind(C, name="glf90w_key_right_control"),              public :: GLFW_KEY_RIGHT_CONTROL
    integer(c_int), bind(C, name="glf90w_key_right_alt"),                  public :: GLFW_KEY_RIGHT_ALT
    integer(c_int), bind(C, name="glf90w_key_right_super"),                public :: GLFW_KEY_RIGHT_SUPER
    integer(c_int), bind(C, name="glf90w_key_menu"),                       public :: GLFW_KEY_MENU

    integer(c_int), bind(C, name="glf90w_key_last"),                       public :: GLFW_KEY_LAST

    integer(c_int), bind(C, name="glf90w_mod_shift"),                      public :: GLFW_MOD_SHIFT
    integer(c_int), bind(C, name="glf90w_mod_control"),                    public :: GLFW_MOD_CONTROL
    integer(c_int), bind(C, name="glf90w_mod_alt"),                        public :: GLFW_MOD_ALT
    integer(c_int), bind(C, name="glf90w_mod_super"),                      public :: GLFW_MOD_SUPER
    integer(c_int), bind(C, name="glf90w_mod_caps_lock"),                  public :: GLFW_MOD_CAPS_LOCK
    integer(c_int), bind(C, name="glf90w_mod_num_lock"),                   public :: GLFW_MOD_NUM_LOCK

    integer(c_int), bind(C, name="glf90w_mouse_button_1"),                 public :: GLFW_MOUSE_BUTTON_1
    integer(c_int), bind(C, name="glf90w_mouse_button_2"),                 public :: GLFW_MOUSE_BUTTON_2
    integer(c_int), bind(C, name="glf90w_mouse_button_3"),                 public :: GLFW_MOUSE_BUTTON_3
    integer(c_int), bind(C, name="glf90w_mouse_button_4"),                 public :: GLFW_MOUSE_BUTTON_4
    integer(c_int), bind(C, name="glf90w_mouse_button_5"),                 public :: GLFW_MOUSE_BUTTON_5
    integer(c_int), bind(C, name="glf90w_mouse_button_6"),                 public :: GLFW_MOUSE_BUTTON_6
    integer(c_int), bind(C, name="glf90w_mouse_button_7"),                 public :: GLFW_MOUSE_BUTTON_7
    integer(c_int), bind(C, name="glf90w_mouse_button_8"),                 public :: GLFW_MOUSE_BUTTON_8
    integer(c_int), bind(C, name="glf90w_mouse_button_last"),              public :: GLFW_MOUSE_BUTTON_LAST
    integer(c_int), bind(C, name="glf90w_mouse_button_left"),              public :: GLFW_MOUSE_BUTTON_LEFT
    integer(c_int), bind(C, name="glf90w_mouse_button_right"),             public :: GLFW_MOUSE_BUTTON_RIGHT
    integer(c_int), bind(C, name="glf90w_mouse_button_middle"),            public :: GLFW_MOUSE_BUTTON_MIDDLE
    integer(c_int), bind(C, name="glf90w_joystick_1"),                     public :: GLFW_JOYSTICK_1
    integer(c_int), bind(C, name="glf90w_joystick_2"),                     public :: GLFW_JOYSTICK_2
    integer(c_int), bind(C, name="glf90w_joystick_3"),                     public :: GLFW_JOYSTICK_3
    integer(c_int), bind(C, name="glf90w_joystick_4"),                     public :: GLFW_JOYSTICK_4
    integer(c_int), bind(C, name="glf90w_joystick_5"),                     public :: GLFW_JOYSTICK_5
    integer(c_int), bind(C, name="glf90w_joystick_6"),                     public :: GLFW_JOYSTICK_6
    integer(c_int), bind(C, name="glf90w_joystick_7"),                     public :: GLFW_JOYSTICK_7
    integer(c_int), bind(C, name="glf90w_joystick_8"),                     public :: GLFW_JOYSTICK_8
    integer(c_int), bind(C, name="glf90w_joystick_9"),                     public :: GLFW_JOYSTICK_9
    integer(c_int), bind(C, name="glf90w_joystick_10"),                    public :: GLFW_JOYSTICK_10
    integer(c_int), bind(C, name="glf90w_joystick_11"),                    public :: GLFW_JOYSTICK_11
    integer(c_int), bind(C, name="glf90w_joystick_12"),                    public :: GLFW_JOYSTICK_12
    integer(c_int), bind(C, name="glf90w_joystick_13"),                    public :: GLFW_JOYSTICK_13
    integer(c_int), bind(C, name="glf90w_joystick_14"),                    public :: GLFW_JOYSTICK_14
    integer(c_int), bind(C, name="glf90w_joystick_15"),                    public :: GLFW_JOYSTICK_15
    integer(c_int), bind(C, name="glf90w_joystick_16"),                    public :: GLFW_JOYSTICK_16
    integer(c_int), bind(C, name="glf90w_joystick_last"),                  public :: GLFW_JOYSTICK_LAST
    integer(c_int), bind(C, name="glf90w_gamepad_button_a"),               public :: GLFW_GAMEPAD_BUTTON_A
    integer(c_int), bind(C, name="glf90w_gamepad_button_b"),               public :: GLFW_GAMEPAD_BUTTON_B
    integer(c_int), bind(C, name="glf90w_gamepad_button_x"),               public :: GLFW_GAMEPAD_BUTTON_X
    integer(c_int), bind(C, name="glf90w_gamepad_button_y"),               public :: GLFW_GAMEPAD_BUTTON_Y
    integer(c_int), bind(C, name="glf90w_gamepad_button_left_bumper"),     public :: GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
    integer(c_int), bind(C, name="glf90w_gamepad_button_right_bumper"),    public :: GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
    integer(c_int), bind(C, name="glf90w_gamepad_button_back"),            public :: GLFW_GAMEPAD_BUTTON_BACK
    integer(c_int), bind(C, name="glf90w_gamepad_button_start"),           public :: GLFW_GAMEPAD_BUTTON_START
    integer(c_int), bind(C, name="glf90w_gamepad_button_guide"),           public :: GLFW_GAMEPAD_BUTTON_GUIDE
    integer(c_int), bind(C, name="glf90w_gamepad_button_left_thumb"),      public :: GLFW_GAMEPAD_BUTTON_LEFT_THUMB
    integer(c_int), bind(C, name="glf90w_gamepad_button_right_thumb"),     public :: GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_up"),         public :: GLFW_GAMEPAD_BUTTON_DPAD_UP
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_right"),      public :: GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_down"),       public :: GLFW_GAMEPAD_BUTTON_DPAD_DOWN
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_left"),       public :: GLFW_GAMEPAD_BUTTON_DPAD_LEFT
    integer(c_int), bind(C, name="glf90w_gamepad_button_last"),            public :: GLFW_GAMEPAD_BUTTON_LAST

    integer(c_int), bind(C, name="glf90w_gamepad_button_cross"),           public :: GLFW_GAMEPAD_BUTTON_CROSS
    integer(c_int), bind(C, name="glf90w_gamepad_button_circle"),          public :: GLFW_GAMEPAD_BUTTON_CIRCLE
    integer(c_int), bind(C, name="glf90w_gamepad_button_square"),          public :: GLFW_GAMEPAD_BUTTON_SQUARE
    integer(c_int), bind(C, name="glf90w_gamepad_button_triangle"),        public :: GLFW_GAMEPAD_BUTTON_TRIANGLE
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_x"),            public :: GLFW_GAMEPAD_AXIS_LEFT_X
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_y"),            public :: GLFW_GAMEPAD_AXIS_LEFT_Y
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_x"),           public :: GLFW_GAMEPAD_AXIS_RIGHT_X
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_y"),           public :: GLFW_GAMEPAD_AXIS_RIGHT_Y
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_trigger"),      public :: GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_trigger"),     public :: GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
    integer(c_int), bind(C, name="glf90w_gamepad_axis_last"),              public :: GLFW_GAMEPAD_AXIS_LAST
    integer(c_int), bind(C, name="glf90w_no_error"),                       public :: GLFW_NO_ERROR
    integer(c_int), bind(C, name="glf90w_not_initialized"),                public :: GLFW_NOT_INITIALIZED
    integer(c_int), bind(C, name="glf90w_no_current_context"),             public :: GLFW_NO_CURRENT_CONTEXT
    integer(c_int), bind(C, name="glf90w_invalid_enum"),                   public :: GLFW_INVALID_ENUM
    integer(c_int), bind(C, name="glf90w_invalid_value"),                  public :: GLFW_INVALID_VALUE
    integer(c_int), bind(C, name="glf90w_out_of_memory"),                  public :: GLFW_OUT_OF_MEMORY
    integer(c_int), bind(C, name="glf90w_api_unavailable"),                public :: GLFW_API_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_version_unavailable"),            public :: GLFW_VERSION_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_platform_error"),                 public :: GLFW_PLATFORM_ERROR
    integer(c_int), bind(C, name="glf90w_format_unavailable"),             public :: GLFW_FORMAT_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_no_window_context"),              public :: GLFW_NO_WINDOW_CONTEXT
    integer(c_int), bind(C, name="glf90w_cursor_unavailable"),             public :: GLFW_CURSOR_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_feature_unavailable"),            public :: GLFW_FEATURE_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_feature_unimplemented"),          public :: GLFW_FEATURE_UNIMPLEMENTED
    integer(c_int), bind(C, name="glf90w_platform_unavailable"),           public :: GLFW_PLATFORM_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_focused"),                        public :: GLFW_FOCUSED
    integer(c_int), bind(C, name="glf90w_iconified"),                      public :: GLFW_ICONIFIED
    integer(c_int), bind(C, name="glf90w_resizable"),                      public :: GLFW_RESIZABLE
    integer(c_int), bind(C, name="glf90w_visible"),                        public :: GLFW_VISIBLE
    integer(c_int), bind(C, name="glf90w_decorated"),                      public :: GLFW_DECORATED
    integer(c_int), bind(C, name="glf90w_auto_iconify"),                   public :: GLFW_AUTO_ICONIFY
    integer(c_int), bind(C, name="glf90w_floating"),                       public :: GLFW_FLOATING
    integer(c_int), bind(C, name="glf90w_maximized"),                      public :: GLFW_MAXIMIZED
    integer(c_int), bind(C, name="glf90w_center_cursor"),                  public :: GLFW_CENTER_CURSOR
    integer(c_int), bind(C, name="glf90w_transparent_framebuffer"),        public :: GLFW_TRANSPARENT_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_hovered"),                        public :: GLFW_HOVERED
    integer(c_int), bind(C, name="glf90w_focus_on_show"),                  public :: GLFW_FOCUS_ON_SHOW

    integer(c_int), bind(C, name="glf90w_mouse_passthrough"),              public :: GLFW_MOUSE_PASSTHROUGH

    integer(c_int), bind(C, name="glf90w_position_x"),                     public :: GLFW_POSITION_X
    integer(c_int), bind(C, name="glf90w_position_y"),                     public :: GLFW_POSITION_Y

    integer(c_int), bind(C, name="glf90w_red_bits"),                       public :: GLFW_RED_BITS
    integer(c_int), bind(C, name="glf90w_green_bits"),                     public :: GLFW_GREEN_BITS
    integer(c_int), bind(C, name="glf90w_blue_bits"),                      public :: GLFW_BLUE_BITS
    integer(c_int), bind(C, name="glf90w_alpha_bits"),                     public :: GLFW_ALPHA_BITS
    integer(c_int), bind(C, name="glf90w_depth_bits"),                     public :: GLFW_DEPTH_BITS
    integer(c_int), bind(C, name="glf90w_stencil_bits"),                   public :: GLFW_STENCIL_BITS
    integer(c_int), bind(C, name="glf90w_accum_red_bits"),                 public :: GLFW_ACCUM_RED_BITS
    integer(c_int), bind(C, name="glf90w_accum_green_bits"),               public :: GLFW_ACCUM_GREEN_BITS
    integer(c_int), bind(C, name="glf90w_accum_blue_bits"),                public :: GLFW_ACCUM_BLUE_BITS
    integer(c_int), bind(C, name="glf90w_accum_alpha_bits"),               public :: GLFW_ACCUM_ALPHA_BITS
    integer(c_int), bind(C, name="glf90w_aux_buffers"),                    public :: GLFW_AUX_BUFFERS
    integer(c_int), bind(C, name="glf90w_stereo"),                         public :: GLFW_STEREO
    integer(c_int), bind(C, name="glf90w_samples"),                        public :: GLFW_SAMPLES
    integer(c_int), bind(C, name="glf90w_srgb_capable"),                   public :: GLFW_SRGB_CAPABLE
    integer(c_int), bind(C, name="glf90w_refresh_rate"),                   public :: GLFW_REFRESH_RATE
    integer(c_int), bind(C, name="glf90w_doublebuffer"),                   public :: GLFW_DOUBLEBUFFER

    integer(c_int), bind(C, name="glf90w_client_api"),                     public :: GLFW_CLIENT_API
    integer(c_int), bind(C, name="glf90w_context_version_major"),          public :: GLFW_CONTEXT_VERSION_MAJOR
    integer(c_int), bind(C, name="glf90w_context_version_minor"),          public :: GLFW_CONTEXT_VERSION_MINOR
    integer(c_int), bind(C, name="glf90w_context_revision"),               public :: GLFW_CONTEXT_REVISION
    integer(c_int), bind(C, name="glf90w_context_robustness"),             public :: GLFW_CONTEXT_ROBUSTNESS
    integer(c_int), bind(C, name="glf90w_opengl_forward_compat"),          public :: GLFW_OPENGL_FORWARD_COMPAT
    integer(c_int), bind(C, name="glf90w_context_debug"),                  public :: GLFW_CONTEXT_DEBUG
    integer(c_int), bind(C, name="glf90w_opengl_debug_context"),           public :: GLFW_OPENGL_DEBUG_CONTEXT
    integer(c_int), bind(C, name="glf90w_opengl_profile"),                 public :: GLFW_OPENGL_PROFILE
    integer(c_int), bind(C, name="glf90w_context_release_behavior"),       public :: GLFW_CONTEXT_RELEASE_BEHAVIOR
    integer(c_int), bind(C, name="glf90w_context_no_error"),               public :: GLFW_CONTEXT_NO_ERROR
    integer(c_int), bind(C, name="glf90w_context_creation_api"),           public :: GLFW_CONTEXT_CREATION_API
    integer(c_int), bind(C, name="glf90w_scale_to_monitor"),               public :: GLFW_SCALE_TO_MONITOR
    integer(c_int), bind(C, name="glf90w_scale_framebuffer"),              public :: GLFW_SCALE_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_cocoa_retina_framebuffer"),       public :: GLFW_COCOA_RETINA_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_cocoa_frame_name"),               public :: GLFW_COCOA_FRAME_NAME
    integer(c_int), bind(C, name="glf90w_cocoa_graphics_switching"),       public :: GLFW_COCOA_GRAPHICS_SWITCHING
    integer(c_int), bind(C, name="glf90w_x11_class_name"),                 public :: GLFW_X11_CLASS_NAME
    integer(c_int), bind(C, name="glf90w_x11_instance_name"),              public :: GLFW_X11_INSTANCE_NAME
    integer(c_int), bind(C, name="glf90w_win32_keyboard_menu"),            public :: GLFW_WIN32_KEYBOARD_MENU
    integer(c_int), bind(C, name="glf90w_win32_showdefault"),              public :: GLFW_WIN32_SHOWDEFAULT
    integer(c_int), bind(C, name="glf90w_wayland_app_id"),                 public :: GLFW_WAYLAND_APP_ID
    integer(c_int), bind(C, name="glf90w_no_api"),                         public :: GLFW_NO_API
    integer(c_int), bind(C, name="glf90w_opengl_api"),                     public :: GLFW_OPENGL_API
    integer(c_int), bind(C, name="glf90w_opengl_es_api"),                  public :: GLFW_OPENGL_ES_API

    integer(c_int), bind(C, name="glf90w_no_robustness"),                  public :: GLFW_NO_ROBUSTNESS
    integer(c_int), bind(C, name="glf90w_no_reset_notification"),          public :: GLFW_NO_RESET_NOTIFICATION
    integer(c_int), bind(C, name="glf90w_lose_context_on_reset"),          public :: GLFW_LOSE_CONTEXT_ON_RESET

    integer(c_int), bind(C, name="glf90w_opengl_any_profile"),             public :: GLFW_OPENGL_ANY_PROFILE
    integer(c_int), bind(C, name="glf90w_opengl_core_profile"),            public :: GLFW_OPENGL_CORE_PROFILE
    integer(c_int), bind(C, name="glf90w_opengl_compat_profile"),          public :: GLFW_OPENGL_COMPAT_PROFILE

    integer(c_int), bind(C, name="glf90w_cursor"),                         public :: GLFW_CURSOR
    integer(c_int), bind(C, name="glf90w_sticky_keys"),                    public :: GLFW_STICKY_KEYS
    integer(c_int), bind(C, name="glf90w_sticky_mouse_buttons"),           public :: GLFW_STICKY_MOUSE_BUTTONS
    integer(c_int), bind(C, name="glf90w_lock_key_mods"),                  public :: GLFW_LOCK_KEY_MODS
    integer(c_int), bind(C, name="glf90w_raw_mouse_motion"),               public :: GLFW_RAW_MOUSE_MOTION

    integer(c_int), bind(C, name="glf90w_cursor_normal"),                  public :: GLFW_CURSOR_NORMAL
    integer(c_int), bind(C, name="glf90w_cursor_hidden"),                  public :: GLFW_CURSOR_HIDDEN
    integer(c_int), bind(C, name="glf90w_cursor_disabled"),                public :: GLFW_CURSOR_DISABLED
    integer(c_int), bind(C, name="glf90w_cursor_captured"),                public :: GLFW_CURSOR_CAPTURED

    integer(c_int), bind(C, name="glf90w_any_release_behavior"),           public :: GLFW_ANY_RELEASE_BEHAVIOR
    integer(c_int), bind(C, name="glf90w_release_behavior_flush"),         public :: GLFW_RELEASE_BEHAVIOR_FLUSH
    integer(c_int), bind(C, name="glf90w_release_behavior_none"),          public :: GLFW_RELEASE_BEHAVIOR_NONE

    integer(c_int), bind(C, name="glf90w_native_context_api"),             public :: GLFW_NATIVE_CONTEXT_API
    integer(c_int), bind(C, name="glf90w_egl_context_api"),                public :: GLFW_EGL_CONTEXT_API
    integer(c_int), bind(C, name="glf90w_osmesa_context_api"),             public :: GLFW_OSMESA_CONTEXT_API

    integer(c_int), bind(C, name="glf90w_angle_platform_type_none"),       public :: GLFW_ANGLE_PLATFORM_TYPE_NONE
    integer(c_int), bind(C, name="glf90w_angle_platform_type_opengl"),     public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGL
    integer(c_int), bind(C, name="glf90w_angle_platform_type_opengles"),   public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
    integer(c_int), bind(C, name="glf90w_angle_platform_type_d3d9"),       public :: GLFW_ANGLE_PLATFORM_TYPE_D3D9
    integer(c_int), bind(C, name="glf90w_angle_platform_type_d3d11"),      public :: GLFW_ANGLE_PLATFORM_TYPE_D3D11
    integer(c_int), bind(C, name="glf90w_angle_platform_type_vulkan"),     public :: GLFW_ANGLE_PLATFORM_TYPE_VULKAN
    integer(c_int), bind(C, name="glf90w_angle_platform_type_metal"),      public :: GLFW_ANGLE_PLATFORM_TYPE_METAL

    integer(c_int), bind(C, name="glf90w_wayland_prefer_libdecor"),        public :: GLFW_WAYLAND_PREFER_LIBDECOR
    integer(c_int), bind(C, name="glf90w_wayland_disable_libdecor"),       public :: GLFW_WAYLAND_DISABLE_LIBDECOR

    integer(c_int), bind(C, name="glf90w_any_position"),                   public :: GLFW_ANY_POSITION

    integer(c_int), bind(C, name="glf90w_arrow_cursor"),                   public :: GLFW_ARROW_CURSOR
    integer(c_int), bind(C, name="glf90w_ibeam_cursor"),                   public :: GLFW_IBEAM_CURSOR
    integer(c_int), bind(C, name="glf90w_crosshair_cursor"),               public :: GLFW_CROSSHAIR_CURSOR
    integer(c_int), bind(C, name="glf90w_pointing_hand_cursor"),           public :: GLFW_POINTING_HAND_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_ew_cursor"),               public :: GLFW_RESIZE_EW_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_ns_cursor"),               public :: GLFW_RESIZE_NS_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_nwse_cursor"),             public :: GLFW_RESIZE_NWSE_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_nesw_cursor"),             public :: GLFW_RESIZE_NESW_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_all_cursor"),              public :: GLFW_RESIZE_ALL_CURSOR
    integer(c_int), bind(C, name="glf90w_not_allowed_cursor"),             public :: GLFW_NOT_ALLOWED_CURSOR
    integer(c_int), bind(C, name="glf90w_hresize_cursor"),                 public :: GLFW_HRESIZE_CURSOR
    integer(c_int), bind(C, name="glf90w_vresize_cursor"),                 public :: GLFW_VRESIZE_CURSOR
    integer(c_int), bind(C, name="glf90w_hand_cursor"),                    public :: GLFW_HAND_CURSOR
    integer(c_int), bind(C, name="glf90w_connected"),                      public :: GLFW_CONNECTED
    integer(c_int), bind(C, name="glf90w_disconnected"),                   public :: GLFW_DISCONNECTED

    integer(c_int), bind(C, name="glf90w_joystick_hat_buttons"),           public :: GLFW_JOYSTICK_HAT_BUTTONS
    integer(c_int), bind(C, name="glf90w_angle_platform_type"),            public :: GLFW_ANGLE_PLATFORM_TYPE
    integer(c_int), bind(C, name="glf90w_platform"),                       public :: GLFW_PLATFORM
    integer(c_int), bind(C, name="glf90w_cocoa_chdir_resources"),          public :: GLFW_COCOA_CHDIR_RESOURCES
    integer(c_int), bind(C, name="glf90w_cocoa_menubar"),                  public :: GLFW_COCOA_MENUBAR
    integer(c_int), bind(C, name="glf90w_x11_xcb_vulkan_surface"),         public :: GLFW_X11_XCB_VULKAN_SURFACE
    integer(c_int), bind(C, name="glf90w_wayland_libdecor"),               public :: GLFW_WAYLAND_LIBDECOR
    integer(c_int), bind(C, name="glf90w_any_platform"),                   public :: GLFW_ANY_PLATFORM
    integer(c_int), bind(C, name="glf90w_platform_win32"),                 public :: GLFW_PLATFORM_WIN32
    integer(c_int), bind(C, name="glf90w_platform_cocoa"),                 public :: GLFW_PLATFORM_COCOA
    integer(c_int), bind(C, name="glf90w_platform_wayland"),               public :: GLFW_PLATFORM_WAYLAND
    integer(c_int), bind(C, name="glf90w_platform_x11"),                   public :: GLFW_PLATFORM_X11
    integer(c_int), bind(C, name="glf90w_platform_null"),                  public :: GLFW_PLATFORM_NULL
    integer(c_int), bind(C, name="glf90w_dont_care"),                      public :: GLFW_DONT_CARE

end module glf90w_constants
! -----------------
! Copyright (C) 2024 Gaétan Jalin
!
! This software is provided 'as-is', without any express or implied
! warranty.  In no event will the authors be held liable for any damages
! arising from the use of this software.
!
! Permission is granted to anyone to use this software for any purpose,
! including commercial applications, and to alter it and redistribute it
! freely, subject to the following restrictions:
!
!    1. The origin of this software must not be misrepresented; you must not
!    claim that you wrote the original software. If you use this software
!    in a product, an acknowledgment in the product documentation would be
!    appreciated but is not required.
!
!    2. Altered source versions must be plainly marked as such, and must not be
!    misrepresented as being the original software.
!
!    3. This notice may not be removed or altered from any source distribution.
! -----------------

