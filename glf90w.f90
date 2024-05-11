! ------------------
!
! GLF90W (for GLFW 3.4) - https://github.com/AarnoldGad/glf90w
! Fortran 2003 bindings for GLFW (Yes, I know...)
!
! ------------------
! glf90w.f90
! 25 Feb 2024
! Gaétan J.A.M. Jalin
! See end of file for complete licence description
! ------------------
module glf90w
    use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr, c_int, c_null_ptr

    implicit none
    save
    private


    ! --------------------------------------------------------------------------
    ! GLFW API tokens
    ! --------------------------------------------------------------------------


    integer(c_int), bind(C, name="glf90w_version_major"),                public :: GLFW_VERSION_MAJOR
    integer(c_int), bind(C, name="glf90w_version_minor"),                public :: GLFW_VERSION_MINOR
    integer(c_int), bind(C, name="glf90w_version_revision"),             public :: GLFW_VERSION_REVISION
    integer(c_int), bind(C, name="glf90w_true"),                         public :: GLFW_TRUE
    integer(c_int), bind(C, name="glf90w_false"),                        public :: GLFW_FALSE

    integer(c_int), bind(C, name="glf90w_release"),                      public :: GLFW_RELEASE
    integer(c_int), bind(C, name="glf90w_press"),                        public :: GLFW_PRESS
    integer(c_int), bind(C, name="glf90w_repeat"),                       public :: GLFW_REPEAT
    integer(c_int), bind(C, name="glf90w_hat_centered"),                 public :: GLFW_HAT_CENTERED
    integer(c_int), bind(C, name="glf90w_hat_up"),                       public :: GLFW_HAT_UP
    integer(c_int), bind(C, name="glf90w_hat_right"),                    public :: GLFW_HAT_RIGHT
    integer(c_int), bind(C, name="glf90w_hat_down"),                     public :: GLFW_HAT_DOWN
    integer(c_int), bind(C, name="glf90w_hat_left"),                     public :: GLFW_HAT_LEFT
    integer(c_int), bind(C, name="glf90w_hat_right_up"),                 public :: GLFW_HAT_RIGHT_UP
    integer(c_int), bind(C, name="glf90w_hat_right_down"),               public :: GLFW_HAT_RIGHT_DOWN
    integer(c_int), bind(C, name="glf90w_hat_left_up"),                  public :: GLFW_HAT_LEFT_UP
    integer(c_int), bind(C, name="glf90w_hat_left_down"),                public :: GLFW_HAT_LEFT_DOWN

    integer(c_int), bind(C, name="glf90w_key_unknown"),                  public :: GLFW_KEY_UNKNOWN

    integer(c_int), bind(C, name="glf90w_key_space"),                    public :: GLFW_KEY_SPACE
    integer(c_int), bind(C, name="glf90w_key_apostrophe"),               public :: GLFW_KEY_APOSTROPHE
    integer(c_int), bind(C, name="glf90w_key_comma"),                    public :: GLFW_KEY_COMMA
    integer(c_int), bind(C, name="glf90w_key_minus"),                    public :: GLFW_KEY_MINUS
    integer(c_int), bind(C, name="glf90w_key_period"),                   public :: GLFW_KEY_PERIOD
    integer(c_int), bind(C, name="glf90w_key_slash"),                    public :: GLFW_KEY_SLASH
    integer(c_int), bind(C, name="glf90w_key_0"),                        public :: GLFW_KEY_0
    integer(c_int), bind(C, name="glf90w_key_1"),                        public :: GLFW_KEY_1
    integer(c_int), bind(C, name="glf90w_key_2"),                        public :: GLFW_KEY_2
    integer(c_int), bind(C, name="glf90w_key_3"),                        public :: GLFW_KEY_3
    integer(c_int), bind(C, name="glf90w_key_4"),                        public :: GLFW_KEY_4
    integer(c_int), bind(C, name="glf90w_key_5"),                        public :: GLFW_KEY_5
    integer(c_int), bind(C, name="glf90w_key_6"),                        public :: GLFW_KEY_6
    integer(c_int), bind(C, name="glf90w_key_7"),                        public :: GLFW_KEY_7
    integer(c_int), bind(C, name="glf90w_key_8"),                        public :: GLFW_KEY_8
    integer(c_int), bind(C, name="glf90w_key_9"),                        public :: GLFW_KEY_9
    integer(c_int), bind(C, name="glf90w_key_semicolon"),                public :: GLFW_KEY_SEMICOLON
    integer(c_int), bind(C, name="glf90w_key_equal"),                    public :: GLFW_KEY_EQUAL
    integer(c_int), bind(C, name="glf90w_key_a"),                        public :: GLFW_KEY_A
    integer(c_int), bind(C, name="glf90w_key_b"),                        public :: GLFW_KEY_B
    integer(c_int), bind(C, name="glf90w_key_c"),                        public :: GLFW_KEY_C
    integer(c_int), bind(C, name="glf90w_key_d"),                        public :: GLFW_KEY_D
    integer(c_int), bind(C, name="glf90w_key_e"),                        public :: GLFW_KEY_E
    integer(c_int), bind(C, name="glf90w_key_f"),                        public :: GLFW_KEY_F
    integer(c_int), bind(C, name="glf90w_key_g"),                        public :: GLFW_KEY_G
    integer(c_int), bind(C, name="glf90w_key_h"),                        public :: GLFW_KEY_H
    integer(c_int), bind(C, name="glf90w_key_i"),                        public :: GLFW_KEY_I
    integer(c_int), bind(C, name="glf90w_key_j"),                        public :: GLFW_KEY_J
    integer(c_int), bind(C, name="glf90w_key_k"),                        public :: GLFW_KEY_K
    integer(c_int), bind(C, name="glf90w_key_l"),                        public :: GLFW_KEY_L
    integer(c_int), bind(C, name="glf90w_key_m"),                        public :: GLFW_KEY_M
    integer(c_int), bind(C, name="glf90w_key_n"),                        public :: GLFW_KEY_N
    integer(c_int), bind(C, name="glf90w_key_o"),                        public :: GLFW_KEY_O
    integer(c_int), bind(C, name="glf90w_key_p"),                        public :: GLFW_KEY_P
    integer(c_int), bind(C, name="glf90w_key_q"),                        public :: GLFW_KEY_Q
    integer(c_int), bind(C, name="glf90w_key_r"),                        public :: GLFW_KEY_R
    integer(c_int), bind(C, name="glf90w_key_s"),                        public :: GLFW_KEY_S
    integer(c_int), bind(C, name="glf90w_key_t"),                        public :: GLFW_KEY_T
    integer(c_int), bind(C, name="glf90w_key_u"),                        public :: GLFW_KEY_U
    integer(c_int), bind(C, name="glf90w_key_v"),                        public :: GLFW_KEY_V
    integer(c_int), bind(C, name="glf90w_key_w"),                        public :: GLFW_KEY_W
    integer(c_int), bind(C, name="glf90w_key_x"),                        public :: GLFW_KEY_X
    integer(c_int), bind(C, name="glf90w_key_y"),                        public :: GLFW_KEY_Y
    integer(c_int), bind(C, name="glf90w_key_z"),                        public :: GLFW_KEY_Z
    integer(c_int), bind(C, name="glf90w_key_left_bracket"),             public :: GLFW_KEY_LEFT_BRACKET
    integer(c_int), bind(C, name="glf90w_key_backslash"),                public :: GLFW_KEY_BACKSLASH
    integer(c_int), bind(C, name="glf90w_key_right_bracket"),            public :: GLFW_KEY_RIGHT_BRACKET
    integer(c_int), bind(C, name="glf90w_key_grave_accent"),             public :: GLFW_KEY_GRAVE_ACCENT
    integer(c_int), bind(C, name="glf90w_key_world_1"),                  public :: GLFW_KEY_WORLD_1
    integer(c_int), bind(C, name="glf90w_key_world_2"),                  public :: GLFW_KEY_WORLD_2

    integer(c_int), bind(C, name="glf90w_key_escape"),                   public :: GLFW_KEY_ESCAPE
    integer(c_int), bind(C, name="glf90w_key_enter"),                    public :: GLFW_KEY_ENTER
    integer(c_int), bind(C, name="glf90w_key_tab"),                      public :: GLFW_KEY_TAB
    integer(c_int), bind(C, name="glf90w_key_backspace"),                public :: GLFW_KEY_BACKSPACE
    integer(c_int), bind(C, name="glf90w_key_insert"),                   public :: GLFW_KEY_INSERT
    integer(c_int), bind(C, name="glf90w_key_delete"),                   public :: GLFW_KEY_DELETE
    integer(c_int), bind(C, name="glf90w_key_right"),                    public :: GLFW_KEY_RIGHT
    integer(c_int), bind(C, name="glf90w_key_left"),                     public :: GLFW_KEY_LEFT
    integer(c_int), bind(C, name="glf90w_key_down"),                     public :: GLFW_KEY_DOWN
    integer(c_int), bind(C, name="glf90w_key_up"),                       public :: GLFW_KEY_UP
    integer(c_int), bind(C, name="glf90w_key_page_up"),                  public :: GLFW_KEY_PAGE_UP
    integer(c_int), bind(C, name="glf90w_key_page_down"),                public :: GLFW_KEY_PAGE_DOWN
    integer(c_int), bind(C, name="glf90w_key_home"),                     public :: GLFW_KEY_HOME
    integer(c_int), bind(C, name="glf90w_key_end"),                      public :: GLFW_KEY_END
    integer(c_int), bind(C, name="glf90w_key_caps_lock"),                public :: GLFW_KEY_CAPS_LOCK
    integer(c_int), bind(C, name="glf90w_key_scroll_lock"),              public :: GLFW_KEY_SCROLL_LOCK
    integer(c_int), bind(C, name="glf90w_key_num_lock"),                 public :: GLFW_KEY_NUM_LOCK
    integer(c_int), bind(C, name="glf90w_key_print_screen"),             public :: GLFW_KEY_PRINT_SCREEN
    integer(c_int), bind(C, name="glf90w_key_pause"),                    public :: GLFW_KEY_PAUSE
    integer(c_int), bind(C, name="glf90w_key_f1"),                       public :: GLFW_KEY_F1
    integer(c_int), bind(C, name="glf90w_key_f2"),                       public :: GLFW_KEY_F2
    integer(c_int), bind(C, name="glf90w_key_f3"),                       public :: GLFW_KEY_F3
    integer(c_int), bind(C, name="glf90w_key_f4"),                       public :: GLFW_KEY_F4
    integer(c_int), bind(C, name="glf90w_key_f5"),                       public :: GLFW_KEY_F5
    integer(c_int), bind(C, name="glf90w_key_f6"),                       public :: GLFW_KEY_F6
    integer(c_int), bind(C, name="glf90w_key_f7"),                       public :: GLFW_KEY_F7
    integer(c_int), bind(C, name="glf90w_key_f8"),                       public :: GLFW_KEY_F8
    integer(c_int), bind(C, name="glf90w_key_f9"),                       public :: GLFW_KEY_F9
    integer(c_int), bind(C, name="glf90w_key_f10"),                      public :: GLFW_KEY_F10
    integer(c_int), bind(C, name="glf90w_key_f11"),                      public :: GLFW_KEY_F11
    integer(c_int), bind(C, name="glf90w_key_f12"),                      public :: GLFW_KEY_F12
    integer(c_int), bind(C, name="glf90w_key_f13"),                      public :: GLFW_KEY_F13
    integer(c_int), bind(C, name="glf90w_key_f14"),                      public :: GLFW_KEY_F14
    integer(c_int), bind(C, name="glf90w_key_f15"),                      public :: GLFW_KEY_F15
    integer(c_int), bind(C, name="glf90w_key_f16"),                      public :: GLFW_KEY_F16
    integer(c_int), bind(C, name="glf90w_key_f17"),                      public :: GLFW_KEY_F17
    integer(c_int), bind(C, name="glf90w_key_f18"),                      public :: GLFW_KEY_F18
    integer(c_int), bind(C, name="glf90w_key_f19"),                      public :: GLFW_KEY_F19
    integer(c_int), bind(C, name="glf90w_key_f20"),                      public :: GLFW_KEY_F20
    integer(c_int), bind(C, name="glf90w_key_f21"),                      public :: GLFW_KEY_F21
    integer(c_int), bind(C, name="glf90w_key_f22"),                      public :: GLFW_KEY_F22
    integer(c_int), bind(C, name="glf90w_key_f23"),                      public :: GLFW_KEY_F23
    integer(c_int), bind(C, name="glf90w_key_f24"),                      public :: GLFW_KEY_F24
    integer(c_int), bind(C, name="glf90w_key_f25"),                      public :: GLFW_KEY_F25
    integer(c_int), bind(C, name="glf90w_key_kp_0"),                     public :: GLFW_KEY_KP_0
    integer(c_int), bind(C, name="glf90w_key_kp_1"),                     public :: GLFW_KEY_KP_1
    integer(c_int), bind(C, name="glf90w_key_kp_2"),                     public :: GLFW_KEY_KP_2
    integer(c_int), bind(C, name="glf90w_key_kp_3"),                     public :: GLFW_KEY_KP_3
    integer(c_int), bind(C, name="glf90w_key_kp_4"),                     public :: GLFW_KEY_KP_4
    integer(c_int), bind(C, name="glf90w_key_kp_5"),                     public :: GLFW_KEY_KP_5
    integer(c_int), bind(C, name="glf90w_key_kp_6"),                     public :: GLFW_KEY_KP_6
    integer(c_int), bind(C, name="glf90w_key_kp_7"),                     public :: GLFW_KEY_KP_7
    integer(c_int), bind(C, name="glf90w_key_kp_8"),                     public :: GLFW_KEY_KP_8
    integer(c_int), bind(C, name="glf90w_key_kp_9"),                     public :: GLFW_KEY_KP_9
    integer(c_int), bind(C, name="glf90w_key_kp_decimal"),               public :: GLFW_KEY_KP_DECIMAL
    integer(c_int), bind(C, name="glf90w_key_kp_divide"),                public :: GLFW_KEY_KP_DIVIDE
    integer(c_int), bind(C, name="glf90w_key_kp_multiply"),              public :: GLFW_KEY_KP_MULTIPLY
    integer(c_int), bind(C, name="glf90w_key_kp_subtract"),              public :: GLFW_KEY_KP_SUBTRACT
    integer(c_int), bind(C, name="glf90w_key_kp_add"),                   public :: GLFW_KEY_KP_ADD
    integer(c_int), bind(C, name="glf90w_key_kp_enter"),                 public :: GLFW_KEY_KP_ENTER
    integer(c_int), bind(C, name="glf90w_key_kp_equal"),                 public :: GLFW_KEY_KP_EQUAL
    integer(c_int), bind(C, name="glf90w_key_left_shift"),               public :: GLFW_KEY_LEFT_SHIFT
    integer(c_int), bind(C, name="glf90w_key_left_control"),             public :: GLFW_KEY_LEFT_CONTROL
    integer(c_int), bind(C, name="glf90w_key_left_alt"),                 public :: GLFW_KEY_LEFT_ALT
    integer(c_int), bind(C, name="glf90w_key_left_super"),               public :: GLFW_KEY_LEFT_SUPER
    integer(c_int), bind(C, name="glf90w_key_right_shift"),              public :: GLFW_KEY_RIGHT_SHIFT
    integer(c_int), bind(C, name="glf90w_key_right_control"),            public :: GLFW_KEY_RIGHT_CONTROL
    integer(c_int), bind(C, name="glf90w_key_right_alt"),                public :: GLFW_KEY_RIGHT_ALT
    integer(c_int), bind(C, name="glf90w_key_right_super"),              public :: GLFW_KEY_RIGHT_SUPER
    integer(c_int), bind(C, name="glf90w_key_menu"),                     public :: GLFW_KEY_MENU

    integer(c_int), bind(C, name="glf90w_key_last"),                     public :: GLFW_KEY_LAST

    integer(c_int), bind(C, name="glf90w_mod_shift"),                    public :: GLFW_MOD_SHIFT
    integer(c_int), bind(C, name="glf90w_mod_control"),                  public :: GLFW_MOD_CONTROL
    integer(c_int), bind(C, name="glf90w_mod_alt"),                      public :: GLFW_MOD_ALT
    integer(c_int), bind(C, name="glf90w_mod_super"),                    public :: GLFW_MOD_SUPER
    integer(c_int), bind(C, name="glf90w_mod_caps_lock"),                public :: GLFW_MOD_CAPS_LOCK
    integer(c_int), bind(C, name="glf90w_mod_num_lock"),                 public :: GLFW_MOD_NUM_LOCK

    integer(c_int), bind(C, name="glf90w_mouse_button_1"),               public :: GLFW_MOUSE_BUTTON_1
    integer(c_int), bind(C, name="glf90w_mouse_button_2"),               public :: GLFW_MOUSE_BUTTON_2
    integer(c_int), bind(C, name="glf90w_mouse_button_3"),               public :: GLFW_MOUSE_BUTTON_3
    integer(c_int), bind(C, name="glf90w_mouse_button_4"),               public :: GLFW_MOUSE_BUTTON_4
    integer(c_int), bind(C, name="glf90w_mouse_button_5"),               public :: GLFW_MOUSE_BUTTON_5
    integer(c_int), bind(C, name="glf90w_mouse_button_6"),               public :: GLFW_MOUSE_BUTTON_6
    integer(c_int), bind(C, name="glf90w_mouse_button_7"),               public :: GLFW_MOUSE_BUTTON_7
    integer(c_int), bind(C, name="glf90w_mouse_button_8"),               public :: GLFW_MOUSE_BUTTON_8
    integer(c_int), bind(C, name="glf90w_mouse_button_last"),            public :: GLFW_MOUSE_BUTTON_LAST
    integer(c_int), bind(C, name="glf90w_mouse_button_left"),            public :: GLFW_MOUSE_BUTTON_LEFT
    integer(c_int), bind(C, name="glf90w_mouse_button_right"),           public :: GLFW_MOUSE_BUTTON_RIGHT
    integer(c_int), bind(C, name="glf90w_mouse_button_middle"),          public :: GLFW_MOUSE_BUTTON_MIDDLE
    integer(c_int), bind(C, name="glf90w_joystick_1"),                   public :: GLFW_JOYSTICK_1
    integer(c_int), bind(C, name="glf90w_joystick_2"),                   public :: GLFW_JOYSTICK_2
    integer(c_int), bind(C, name="glf90w_joystick_3"),                   public :: GLFW_JOYSTICK_3
    integer(c_int), bind(C, name="glf90w_joystick_4"),                   public :: GLFW_JOYSTICK_4
    integer(c_int), bind(C, name="glf90w_joystick_5"),                   public :: GLFW_JOYSTICK_5
    integer(c_int), bind(C, name="glf90w_joystick_6"),                   public :: GLFW_JOYSTICK_6
    integer(c_int), bind(C, name="glf90w_joystick_7"),                   public :: GLFW_JOYSTICK_7
    integer(c_int), bind(C, name="glf90w_joystick_8"),                   public :: GLFW_JOYSTICK_8
    integer(c_int), bind(C, name="glf90w_joystick_9"),                   public :: GLFW_JOYSTICK_9
    integer(c_int), bind(C, name="glf90w_joystick_10"),                  public :: GLFW_JOYSTICK_10
    integer(c_int), bind(C, name="glf90w_joystick_11"),                  public :: GLFW_JOYSTICK_11
    integer(c_int), bind(C, name="glf90w_joystick_12"),                  public :: GLFW_JOYSTICK_12
    integer(c_int), bind(C, name="glf90w_joystick_13"),                  public :: GLFW_JOYSTICK_13
    integer(c_int), bind(C, name="glf90w_joystick_14"),                  public :: GLFW_JOYSTICK_14
    integer(c_int), bind(C, name="glf90w_joystick_15"),                  public :: GLFW_JOYSTICK_15
    integer(c_int), bind(C, name="glf90w_joystick_16"),                  public :: GLFW_JOYSTICK_16
    integer(c_int), bind(C, name="glf90w_joystick_last"),                public :: GLFW_JOYSTICK_LAST
    integer(c_int), bind(C, name="glf90w_gamepad_button_a"),             public :: GLFW_GAMEPAD_BUTTON_A
    integer(c_int), bind(C, name="glf90w_gamepad_button_b"),             public :: GLFW_GAMEPAD_BUTTON_B
    integer(c_int), bind(C, name="glf90w_gamepad_button_x"),             public :: GLFW_GAMEPAD_BUTTON_X
    integer(c_int), bind(C, name="glf90w_gamepad_button_y"),             public :: GLFW_GAMEPAD_BUTTON_Y
    integer(c_int), bind(C, name="glf90w_gamepad_button_left_bumper"),   public :: GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
    integer(c_int), bind(C, name="glf90w_gamepad_button_right_bumper"),  public :: GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
    integer(c_int), bind(C, name="glf90w_gamepad_button_back"),          public :: GLFW_GAMEPAD_BUTTON_BACK
    integer(c_int), bind(C, name="glf90w_gamepad_button_start"),         public :: GLFW_GAMEPAD_BUTTON_START
    integer(c_int), bind(C, name="glf90w_gamepad_button_guide"),         public :: GLFW_GAMEPAD_BUTTON_GUIDE
    integer(c_int), bind(C, name="glf90w_gamepad_button_left_thumb"),    public :: GLFW_GAMEPAD_BUTTON_LEFT_THUMB
    integer(c_int), bind(C, name="glf90w_gamepad_button_right_thumb"),   public :: GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_up"),       public :: GLFW_GAMEPAD_BUTTON_DPAD_UP
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_right"),    public :: GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_down"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_DOWN
    integer(c_int), bind(C, name="glf90w_gamepad_button_dpad_left"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_LEFT
    integer(c_int), bind(C, name="glf90w_gamepad_button_last"),          public :: GLFW_GAMEPAD_BUTTON_LAST

    integer(c_int), bind(C, name="glf90w_gamepad_button_cross"),         public :: GLFW_GAMEPAD_BUTTON_CROSS
    integer(c_int), bind(C, name="glf90w_gamepad_button_circle"),        public :: GLFW_GAMEPAD_BUTTON_CIRCLE
    integer(c_int), bind(C, name="glf90w_gamepad_button_square"),        public :: GLFW_GAMEPAD_BUTTON_SQUARE
    integer(c_int), bind(C, name="glf90w_gamepad_button_triangle"),      public :: GLFW_GAMEPAD_BUTTON_TRIANGLE
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_x"),          public :: GLFW_GAMEPAD_AXIS_LEFT_X
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_y"),          public :: GLFW_GAMEPAD_AXIS_LEFT_Y
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_x"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_X
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_y"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_Y
    integer(c_int), bind(C, name="glf90w_gamepad_axis_left_trigger"),    public :: GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
    integer(c_int), bind(C, name="glf90w_gamepad_axis_right_trigger"),   public :: GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
    integer(c_int), bind(C, name="glf90w_gamepad_axis_last"),            public :: GLFW_GAMEPAD_AXIS_LAST
    integer(c_int), bind(C, name="glf90w_no_error"),                     public :: GLFW_NO_ERROR
    integer(c_int), bind(C, name="glf90w_not_initialized"),              public :: GLFW_NOT_INITIALIZED
    integer(c_int), bind(C, name="glf90w_no_current_context"),           public :: GLFW_NO_CURRENT_CONTEXT
    integer(c_int), bind(C, name="glf90w_invalid_enum"),                 public :: GLFW_INVALID_ENUM
    integer(c_int), bind(C, name="glf90w_invalid_value"),                public :: GLFW_INVALID_VALUE
    integer(c_int), bind(C, name="glf90w_out_of_memory"),                public :: GLFW_OUT_OF_MEMORY
    integer(c_int), bind(C, name="glf90w_api_unavailable"),              public :: GLFW_API_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_version_unavailable"),          public :: GLFW_VERSION_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_platform_error"),               public :: GLFW_PLATFORM_ERROR
    integer(c_int), bind(C, name="glf90w_format_unavailable"),           public :: GLFW_FORMAT_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_no_window_context"),            public :: GLFW_NO_WINDOW_CONTEXT
    integer(c_int), bind(C, name="glf90w_cursor_unavailable"),           public :: GLFW_CURSOR_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_feature_unavailable"),          public :: GLFW_FEATURE_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_feature_unimplemented"),        public :: GLFW_FEATURE_UNIMPLEMENTED
    integer(c_int), bind(C, name="glf90w_platform_unavailable"),         public :: GLFW_PLATFORM_UNAVAILABLE
    integer(c_int), bind(C, name="glf90w_focused"),                      public :: GLFW_FOCUSED
    integer(c_int), bind(C, name="glf90w_iconified"),                    public :: GLFW_ICONIFIED
    integer(c_int), bind(C, name="glf90w_resizable"),                    public :: GLFW_RESIZABLE
    integer(c_int), bind(C, name="glf90w_visible"),                      public :: GLFW_VISIBLE
    integer(c_int), bind(C, name="glf90w_decorated"),                    public :: GLFW_DECORATED
    integer(c_int), bind(C, name="glf90w_auto_iconify"),                 public :: GLFW_AUTO_ICONIFY
    integer(c_int), bind(C, name="glf90w_floating"),                     public :: GLFW_FLOATING
    integer(c_int), bind(C, name="glf90w_maximized"),                    public :: GLFW_MAXIMIZED
    integer(c_int), bind(C, name="glf90w_center_cursor"),                public :: GLFW_CENTER_CURSOR
    integer(c_int), bind(C, name="glf90w_transparent_framebuffer"),      public :: GLFW_TRANSPARENT_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_hovered"),                      public :: GLFW_HOVERED
    integer(c_int), bind(C, name="glf90w_focus_on_show"),                public :: GLFW_FOCUS_ON_SHOW

    integer(c_int), bind(C, name="glf90w_mouse_passthrough"),            public :: GLFW_MOUSE_PASSTHROUGH

    integer(c_int), bind(C, name="glf90w_position_x"),                   public :: GLFW_POSITION_X
    integer(c_int), bind(C, name="glf90w_position_y"),                   public :: GLFW_POSITION_Y

    integer(c_int), bind(C, name="glf90w_red_bits"),                     public :: GLFW_RED_BITS
    integer(c_int), bind(C, name="glf90w_green_bits"),                   public :: GLFW_GREEN_BITS
    integer(c_int), bind(C, name="glf90w_blue_bits"),                    public :: GLFW_BLUE_BITS
    integer(c_int), bind(C, name="glf90w_alpha_bits"),                   public :: GLFW_ALPHA_BITS
    integer(c_int), bind(C, name="glf90w_depth_bits"),                   public :: GLFW_DEPTH_BITS
    integer(c_int), bind(C, name="glf90w_stencil_bits"),                 public :: GLFW_STENCIL_BITS
    integer(c_int), bind(C, name="glf90w_accum_red_bits"),               public :: GLFW_ACCUM_RED_BITS
    integer(c_int), bind(C, name="glf90w_accum_green_bits"),             public :: GLFW_ACCUM_GREEN_BITS
    integer(c_int), bind(C, name="glf90w_accum_blue_bits"),              public :: GLFW_ACCUM_BLUE_BITS
    integer(c_int), bind(C, name="glf90w_accum_alpha_bits"),             public :: GLFW_ACCUM_ALPHA_BITS
    integer(c_int), bind(C, name="glf90w_aux_buffers"),                  public :: GLFW_AUX_BUFFERS
    integer(c_int), bind(C, name="glf90w_stereo"),                       public :: GLFW_STEREO
    integer(c_int), bind(C, name="glf90w_samples"),                      public :: GLFW_SAMPLES
    integer(c_int), bind(C, name="glf90w_srgb_capable"),                 public :: GLFW_SRGB_CAPABLE
    integer(c_int), bind(C, name="glf90w_refresh_rate"),                 public :: GLFW_REFRESH_RATE
    integer(c_int), bind(C, name="glf90w_doublebuffer"),                 public :: GLFW_DOUBLEBUFFER

    integer(c_int), bind(C, name="glf90w_client_api"),                   public :: GLFW_CLIENT_API
    integer(c_int), bind(C, name="glf90w_context_version_major"),        public :: GLFW_CONTEXT_VERSION_MAJOR
    integer(c_int), bind(C, name="glf90w_context_version_minor"),        public :: GLFW_CONTEXT_VERSION_MINOR
    integer(c_int), bind(C, name="glf90w_context_revision"),             public :: GLFW_CONTEXT_REVISION
    integer(c_int), bind(C, name="glf90w_context_robustness"),           public :: GLFW_CONTEXT_ROBUSTNESS
    integer(c_int), bind(C, name="glf90w_opengl_forward_compat"),        public :: GLFW_OPENGL_FORWARD_COMPAT
    integer(c_int), bind(C, name="glf90w_context_debug"),                public :: GLFW_CONTEXT_DEBUG
    integer(c_int), bind(C, name="glf90w_opengl_debug_context"),         public :: GLFW_OPENGL_DEBUG_CONTEXT
    integer(c_int), bind(C, name="glf90w_opengl_profile"),               public :: GLFW_OPENGL_PROFILE
    integer(c_int), bind(C, name="glf90w_context_release_behavior"),     public :: GLFW_CONTEXT_RELEASE_BEHAVIOR
    integer(c_int), bind(C, name="glf90w_context_no_error"),             public :: GLFW_CONTEXT_NO_ERROR
    integer(c_int), bind(C, name="glf90w_context_creation_api"),         public :: GLFW_CONTEXT_CREATION_API
    integer(c_int), bind(C, name="glf90w_scale_to_monitor"),             public :: GLFW_SCALE_TO_MONITOR
    integer(c_int), bind(C, name="glf90w_scale_framebuffer"),            public :: GLFW_SCALE_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_cocoa_retina_framebuffer"),     public :: GLFW_COCOA_RETINA_FRAMEBUFFER
    integer(c_int), bind(C, name="glf90w_cocoa_frame_name"),             public :: GLFW_COCOA_FRAME_NAME
    integer(c_int), bind(C, name="glf90w_cocoa_graphics_switching"),     public :: GLFW_COCOA_GRAPHICS_SWITCHING
    integer(c_int), bind(C, name="glf90w_x11_class_name"),               public :: GLFW_X11_CLASS_NAME
    integer(c_int), bind(C, name="glf90w_x11_instance_name"),            public :: GLFW_X11_INSTANCE_NAME
    integer(c_int), bind(C, name="glf90w_win32_keyboard_menu"),          public :: GLFW_WIN32_KEYBOARD_MENU
    integer(c_int), bind(C, name="glf90w_win32_showdefault"),            public :: GLFW_WIN32_SHOWDEFAULT
    integer(c_int), bind(C, name="glf90w_wayland_app_id"),               public :: GLFW_WAYLAND_APP_ID
    integer(c_int), bind(C, name="glf90w_no_api"),                       public :: GLFW_NO_API
    integer(c_int), bind(C, name="glf90w_opengl_api"),                   public :: GLFW_OPENGL_API
    integer(c_int), bind(C, name="glf90w_opengl_es_api"),                public :: GLFW_OPENGL_ES_API

    integer(c_int), bind(C, name="glf90w_no_robustness"),                public :: GLFW_NO_ROBUSTNESS
    integer(c_int), bind(C, name="glf90w_no_reset_notification"),        public :: GLFW_NO_RESET_NOTIFICATION
    integer(c_int), bind(C, name="glf90w_lose_context_on_reset"),        public :: GLFW_LOSE_CONTEXT_ON_RESET

    integer(c_int), bind(C, name="glf90w_opengl_any_profile"),           public :: GLFW_OPENGL_ANY_PROFILE
    integer(c_int), bind(C, name="glf90w_opengl_core_profile"),          public :: GLFW_OPENGL_CORE_PROFILE
    integer(c_int), bind(C, name="glf90w_opengl_compat_profile"),        public :: GLFW_OPENGL_COMPAT_PROFILE

    integer(c_int), bind(C, name="glf90w_cursor"),                       public :: GLFW_CURSOR
    integer(c_int), bind(C, name="glf90w_sticky_keys"),                  public :: GLFW_STICKY_KEYS
    integer(c_int), bind(C, name="glf90w_sticky_mouse_buttons"),         public :: GLFW_STICKY_MOUSE_BUTTONS
    integer(c_int), bind(C, name="glf90w_lock_key_mods"),                public :: GLFW_LOCK_KEY_MODS
    integer(c_int), bind(C, name="glf90w_raw_mouse_motion"),             public :: GLFW_RAW_MOUSE_MOTION

    integer(c_int), bind(C, name="glf90w_cursor_normal"),                public :: GLFW_CURSOR_NORMAL
    integer(c_int), bind(C, name="glf90w_cursor_hidden"),                public :: GLFW_CURSOR_HIDDEN
    integer(c_int), bind(C, name="glf90w_cursor_disabled"),              public :: GLFW_CURSOR_DISABLED
    integer(c_int), bind(C, name="glf90w_cursor_captured"),              public :: GLFW_CURSOR_CAPTURED

    integer(c_int), bind(C, name="glf90w_any_release_behavior"),         public :: GLFW_ANY_RELEASE_BEHAVIOR
    integer(c_int), bind(C, name="glf90w_release_behavior_flush"),       public :: GLFW_RELEASE_BEHAVIOR_FLUSH
    integer(c_int), bind(C, name="glf90w_release_behavior_none"),        public :: GLFW_RELEASE_BEHAVIOR_NONE

    integer(c_int), bind(C, name="glf90w_native_context_api"),           public :: GLFW_NATIVE_CONTEXT_API
    integer(c_int), bind(C, name="glf90w_egl_context_api"),              public :: GLFW_EGL_CONTEXT_API
    integer(c_int), bind(C, name="glf90w_osmesa_context_api"),           public :: GLFW_OSMESA_CONTEXT_API

    integer(c_int), bind(C, name="glf90w_angle_platform_type_none"),     public :: GLFW_ANGLE_PLATFORM_TYPE_NONE
    integer(c_int), bind(C, name="glf90w_angle_platform_type_opengl"),   public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGL
    integer(c_int), bind(C, name="glf90w_angle_platform_type_opengles"), public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
    integer(c_int), bind(C, name="glf90w_angle_platform_type_d3d9"),     public :: GLFW_ANGLE_PLATFORM_TYPE_D3D9
    integer(c_int), bind(C, name="glf90w_angle_platform_type_d3d11"),    public :: GLFW_ANGLE_PLATFORM_TYPE_D3D11
    integer(c_int), bind(C, name="glf90w_angle_platform_type_vulkan"),   public :: GLFW_ANGLE_PLATFORM_TYPE_VULKAN
    integer(c_int), bind(C, name="glf90w_angle_platform_type_metal"),    public :: GLFW_ANGLE_PLATFORM_TYPE_METAL

    integer(c_int), bind(C, name="glf90w_wayland_prefer_libdecor"),      public :: GLFW_WAYLAND_PREFER_LIBDECOR
    integer(c_int), bind(C, name="glf90w_wayland_disable_libdecor"),     public :: GLFW_WAYLAND_DISABLE_LIBDECOR

    integer(c_int), bind(C, name="glf90w_any_position"),                 public :: GLFW_ANY_POSITION

    integer(c_int), bind(C, name="glf90w_arrow_cursor"),                 public :: GLFW_ARROW_CURSOR
    integer(c_int), bind(C, name="glf90w_ibeam_cursor"),                 public :: GLFW_IBEAM_CURSOR
    integer(c_int), bind(C, name="glf90w_crosshair_cursor"),             public :: GLFW_CROSSHAIR_CURSOR
    integer(c_int), bind(C, name="glf90w_pointing_hand_cursor"),         public :: GLFW_POINTING_HAND_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_ew_cursor"),             public :: GLFW_RESIZE_EW_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_ns_cursor"),             public :: GLFW_RESIZE_NS_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_nwse_cursor"),           public :: GLFW_RESIZE_NWSE_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_nesw_cursor"),           public :: GLFW_RESIZE_NESW_CURSOR
    integer(c_int), bind(C, name="glf90w_resize_all_cursor"),            public :: GLFW_RESIZE_ALL_CURSOR
    integer(c_int), bind(C, name="glf90w_not_allowed_cursor"),           public :: GLFW_NOT_ALLOWED_CURSOR
    integer(c_int), bind(C, name="glf90w_hresize_cursor"),               public :: GLFW_HRESIZE_CURSOR
    integer(c_int), bind(C, name="glf90w_vresize_cursor"),               public :: GLFW_VRESIZE_CURSOR
    integer(c_int), bind(C, name="glf90w_hand_cursor"),                  public :: GLFW_HAND_CURSOR
    integer(c_int), bind(C, name="glf90w_connected"),                    public :: GLFW_CONNECTED
    integer(c_int), bind(C, name="glf90w_disconnected"),                 public :: GLFW_DISCONNECTED

    integer(c_int), bind(C, name="glf90w_joystick_hat_buttons"),         public :: GLFW_JOYSTICK_HAT_BUTTONS
    integer(c_int), bind(C, name="glf90w_angle_platform_type"),          public :: GLFW_ANGLE_PLATFORM_TYPE
    integer(c_int), bind(C, name="glf90w_platform"),                     public :: GLFW_PLATFORM
    integer(c_int), bind(C, name="glf90w_cocoa_chdir_resources"),        public :: GLFW_COCOA_CHDIR_RESOURCES
    integer(c_int), bind(C, name="glf90w_cocoa_menubar"),                public :: GLFW_COCOA_MENUBAR
    integer(c_int), bind(C, name="glf90w_x11_xcb_vulkan_surface"),       public :: GLFW_X11_XCB_VULKAN_SURFACE
    integer(c_int), bind(C, name="glf90w_wayland_libdecor"),             public :: GLFW_WAYLAND_LIBDECOR
    integer(c_int), bind(C, name="glf90w_any_platform"),                 public :: GLFW_ANY_PLATFORM
    integer(c_int), bind(C, name="glf90w_platform_win32"),               public :: GLFW_PLATFORM_WIN32
    integer(c_int), bind(C, name="glf90w_platform_cocoa"),               public :: GLFW_PLATFORM_COCOA
    integer(c_int), bind(C, name="glf90w_platform_wayland"),             public :: GLFW_PLATFORM_WAYLAND
    integer(c_int), bind(C, name="glf90w_platform_x11"),                 public :: GLFW_PLATFORM_X11
    integer(c_int), bind(C, name="glf90w_platform_null"),                public :: GLFW_PLATFORM_NULL
    integer(c_int), bind(C, name="glf90w_dont_care"),                    public :: GLFW_DONT_CARE


    ! --------------------------------------------------------------------------
    ! GLFW API types
    ! --------------------------------------------------------------------------


    type, abstract :: C_opaque_ptr
        private
        type(c_ptr) :: ptr = c_null_ptr
    end type c_opaque_ptr

    type, extends(C_opaque_ptr), public :: GLFWmonitor_ptr
    end type GLFWmonitor_ptr

    type, extends(C_opaque_ptr), public :: GLFWwindow_ptr
    end type GLFWwindow_ptr

    type, extends(C_opaque_ptr), public :: GLFWcursor_ptr
    end type GLFWcursor_ptr

    type, bind(C), public :: GLFWvidmode
        integer(kind=c_int) :: width
        integer(kind=c_int) :: height
        integer(kind=c_int) :: redBits
        integer(kind=c_int) :: greenBits
        integer(kind=c_int) :: blueBits
        integer(kind=c_int) :: refreshRate
    end type GLFWvidmode

!    type, public :: GLFWallocator
!        procedure(GLFWallocatefun), pointer :: allocate_fn
!        procedure(GLFWallocatefun), pointer :: reallocate_fn
!        procedure(GLFWallocatefun), pointer :: deallocate_fn
!        type(c_ptr)                         :: user
!    end type GLFWallocator

    type, bind(C), public :: GLFWallocator
        type(c_funptr) :: allocate_fn
        type(c_funptr) :: reallocate_fn
        type(c_funptr) :: deallocate_fn
        type(c_ptr)    :: user
    end type GLFWallocator

    ! TODO
    !type, bind(C), public :: GLFWgammaramp
    !type, bind(C), public :: GLFWimage
    !type, bind(C), public :: GLFWgamepadstate
    !type, bind(C), public :: GLFWallocator


    ! --------------------------------------------------------------------------
    ! GLF90W API types
    ! --------------------------------------------------------------------------


    public :: &
        ! -- void (*GLFWerrorfun)(int IN error_code, char IN description)
        GLFWerrorfun, &
        ! -- void (*GLFWmonitorfun)(GLFWmonitor IN monitor, int IN description)
        GLFWmonitorfun, &
        ! -- void (*GLFWjoystickfun)(int IN jid, int IN event)
        GLFWjoystickfun
        ! -- void* (*GLFWallocatefun)(size_t size, void* user)
        ! GLFWallocatefun
        ! -- void* (*GLFWreallocatefun)(void* block, size_t size, void* user)
        ! GLFWreallocatefun
        ! -- void (*GLFWdeallocatefun)(void* block, void* user)
        ! GLFWdeallocatefun

    public :: associated

    interface associated
        module procedure :: associated_opaque
    end interface associated


    ! --------------------------------------------------------------------------
    ! GLF90W API abstract interfaces
    ! --------------------------------------------------------------------------


! NOTE Leave this here but probably useless as it would require C interfaces
!    abstract interface
!        function GLFWallocatefun(blckSize, user) result(blck)
!            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
!
!            implicit none
!            integer(kind=c_size_t), intent(in) :: blckSize
!            type(c_ptr)                        :: user
!            type(c_ptr)                        :: blck
!        end function GLFWallocatefun
!    end interface
!
!    abstract interface
!        function GLFWreallocatefun(blck, blckSize, user) result(reblck)
!            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
!
!            implicit none
!            type(c_ptr)                        :: blck
!            integer(kind=c_size_t), intent(in) :: blckSize
!            type(c_ptr)                        :: user
!            type(c_ptr)                        :: reblck
!        end function GLFWreallocatefun
!    end interface
!
!    abstract interface
!        subroutine GLFWdeallocatefun(blck, user)
!            use, intrinsic :: iso_c_binding, only: c_ptr
!
!            implicit none
!            type(c_ptr) :: blck
!            type(c_ptr) :: user
!        end function GLFWallocatefun
!    end interface

    abstract interface
        subroutine GLFWerrorfun(error_code, description)
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            integer(kind=int32), intent(in) :: error_code
            character(len=*),    intent(in) :: description
        end subroutine GLFWerrorfun
    end interface

    abstract interface
        subroutine GLFWwindowposfun(window, x, y)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: x, y
        end subroutine GLFWwindowposfun
    end interface

    abstract interface
        subroutine GLFWwindowsizefun(window, width, height)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: width, height
        end subroutine GLFWwindowsizefun
    end interface

    abstract interface
        subroutine GLFWwindowclosefun(window)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
        end subroutine GLFWwindowclosefun
    end interface

    abstract interface
        subroutine GLFWwindowrefreshfun(window)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
        end subroutine GLFWwindowrefreshfun
    end interface

    abstract interface
        subroutine GLFWwindowfocusfun(window, focused)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical,              intent(in) :: focused
        end subroutine GLFWwindowfocusfun
    end interface

    abstract interface
        subroutine GLFWwindowiconifyfun(window, iconified)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical,              intent(in) :: iconified
        end subroutine GLFWwindowiconifyfun
    end interface

    abstract interface
        subroutine GLFWwindowmaximizefun(window, maximized)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical,              intent(in) :: maximized
        end subroutine GLFWwindowmaximizefun
    end interface

    abstract interface
        subroutine GLFWframebuffersizefun(window, width, height)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: width, height
        end subroutine GLFWframebuffersizefun
    end interface

    abstract interface
        subroutine GLFWwindowcontentscalefun(window, xscale, yscale)
            use, intrinsic :: iso_fortran_env, only: real32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=real32),    intent(in) :: xscale, yscale
        end subroutine GLFWwindowcontentscalefun
    end interface

    abstract interface
        subroutine GLFWmousebuttonfun(window, button, action, mods)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: button, action, mods
        end subroutine GLFWmousebuttonfun
    end interface

    abstract interface
        subroutine GLFWcursorposfun(window, x, y)
            use, intrinsic :: iso_fortran_env, only: real64
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=real64),    intent(in) :: x, y
        end subroutine GLFWcursorposfun
    end interface

    abstract interface
        subroutine GLFWcursorenterfun(window, entered)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical,              intent(in) :: entered
        end subroutine GLFWcursorenterfun
    end interface

    abstract interface
        subroutine GLFWscrollfun(window, xoffset, yoffset)
            use, intrinsic :: iso_fortran_env, only: real64
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=real64),    intent(in) :: xoffset, yoffset
        end subroutine GLFWscrollfun
    end interface

    abstract interface
        subroutine GLFWkeyfun(window, key, scancode, action, mods)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: key, scancode, action, mods
        end subroutine GLFWkeyfun
    end interface

    abstract interface
        subroutine GLFWcharfun(window, codepoint)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: codepoint ! TODO This is supposed to be unsigned int
        end subroutine GLFWcharfun
    end interface

    abstract interface
        subroutine GLFWcharmodsfun(window, codepoint, mods)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=int32),  intent(in) :: codepoint ! TODO This is supposed to be unsigned int
            integer(kind=int32),  intent(in) :: mods
        end subroutine GLFWcharmodsfun
    end interface

    abstract interface
        subroutine GLFWdropfun(window, paths)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr),                    intent(in) :: window
            character(len=:), dimension(:), pointer, intent(in) :: paths ! TODO Does this work?
        end subroutine GLFWdropfun
    end interface

    abstract interface
        subroutine GLFWmonitorfun(monitor, event)
            use, intrinsic :: iso_fortran_env, only: int32
            import :: GLFWmonitor_ptr

            implicit none
            type(GLFWmonitor_ptr),   intent(in) :: monitor
            integer(kind=int32), intent(in) :: event
        end subroutine GLFWmonitorfun
    end interface

    abstract interface
        subroutine GLFWjoystickfun(jid, event)
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            integer(kind=int32), intent(in) :: jid
            integer(kind=int32), intent(in) :: event
        end subroutine GLFWjoystickfun
    end interface


    ! --------------------------------------------------------------------------
    ! GLF90W callback pointers
    ! --------------------------------------------------------------------------


    procedure(GLFWerrorfun),              pointer, save :: glf90wErrorCallback              => null()
    procedure(GLFWwindowposfun),          pointer, save :: glf90wWindowPosCallback          => null()
    procedure(GLFWwindowsizefun),         pointer, save :: glf90wWindowSizeCallback         => null()
    procedure(GLFWwindowclosefun),        pointer, save :: glf90wWindowCloseCallback        => null()
    procedure(GLFWwindowrefreshfun),      pointer, save :: glf90wWindowRefreshCallback      => null()
    procedure(GLFWwindowfocusfun),        pointer, save :: glf90wWindowFocusCallback        => null()
    procedure(GLFWwindowiconifyfun),      pointer, save :: glf90wWindowIconifyCallback      => null()
    procedure(GLFWwindowmaximizefun),     pointer, save :: glf90wWindowMaximizeCallback     => null()
    procedure(GLFWframebuffersizefun),    pointer, save :: glf90wFramebufferSizeCallback    => null()
    procedure(GLFWwindowcontentscalefun), pointer, save :: glf90wWindowContentScaleCallback => null()
    procedure(GLFWmousebuttonfun),        pointer, save :: glf90wMouseButtonCallback        => null()
    procedure(GLFWcursorposfun),          pointer, save :: glf90wCursorPosCallback          => null()
    procedure(GLFWcursorenterfun),        pointer, save :: glf90wCursorEnterCallback        => null()
    procedure(GLFWscrollfun),             pointer, save :: glf90wScrollCallback             => null()
    procedure(GLFWkeyfun),                pointer, save :: glf90wKeyCallback                => null()
    procedure(GLFWcharfun),               pointer, save :: glf90wCharCallback               => null()
    procedure(GLFWcharmodsfun),           pointer, save :: glf90wCharModsCallback           => null()
    procedure(GLFWdropfun),               pointer, save :: glf90wDropCallback               => null()
    procedure(GLFWmonitorfun),            pointer, save :: glf90wMonitorCallback            => null()
    procedure(GLFWjoystickfun),           pointer, save :: glf90wJoystickCallback           => null()


    ! --------------------------------------------------------------------------
    ! GLFW API functions
    ! --------------------------------------------------------------------------


    public :: &
        ! -- logical glfwInit() result(success)
        glfwInit, &
        ! -- void glfwTerminate()
        glfwTerminate, &
        ! -- void glfwInitHint(int IN hint, int IN value)
        glfwInitHint, &
        !glfwInitAllocator, &
        !glfwInitVulkanLoader, &
        ! -- void glfwGetVersion(int OUT major, int OUT minor, int OUT rev)
        glfwGetVersion, &
        ! -- char glfwGetVersionString() result(str)
        glfwGetVersionString, &
        ! -- int glfwGetError(char POINTER OPTIONAL OUT description) result(error_code)
        glfwGetError, &
        ! -- procedure(GLFWerrorfun) POINTER glfwSetErrorCallback(procedure(GLFWerrorfun) POINTER IN callback) result(prev_callback)
        glfwSetErrorCallback, &
        ! -- int glfwGetPlatform() result(platform)
        glfwGetPlatform, &
        ! -- logical glfwPlatformSupported(int IN platform) result(supported)
        glfwPlatformSupported, &
        ! -- GLFWmonitor_ptr ARRAY glfwGetMonitors() result(monitors)
        glfwGetMonitors, &
        ! -- GLFWmonitor_ptr glfwGetPrimaryMonitor() result(monitor)
        glfwGetPrimaryMonitor, &
        ! -- void glfwGetMonitorPos(GLFWmonitor_ptr IN monitor, int OUT x, int OUT y)
        glfwGetMonitorPos, &
        ! -- void glfwGetMonitorWorkarea(GLFWmonitor_ptr IN monitor, int OUT x, int OUT y, int OUT w, int OUT h)
        glfwGetMonitorWorkarea, &
        ! -- void glfwGetMonitorPhysicalSize(GLFWmonitor_ptr IN monitor, int OUT widthMM, int OUT heightMM)
        glfwGetMonitorPhysicalSize, &
        ! -- void glfwGetMonitorContentScale(GLFWmonitor_ptr IN monitor, float OUT xscale, float OUT yscale)
        glfwGetMonitorContentScale, &
        ! -- char POINTER glfwGetMonitorName(GLFWmonitor_ptr IN monitor) result(name)
        glfwGetMonitorName, &
        ! -- void glfwSetMonitorUserPointer(GLFWmonitor_ptr IN monitor, type(c_ptr) IN user_pointer)
        glfwSetMonitorUserPointer, &
        ! -- type(c_ptr) glfwGetMonitorUserPointer(GLFWmonitor_ptr IN monitor) result(user_pointer)
        glfwGetMonitorUserPointer, &
        ! -- procedure(GLFWmonitorfun) POINTER glfwSetMonitorCallback(procedure(GLFWmonitorfun) POINTER IN callback) result(prev_callback)
        glfwSetMonitorCallback, &
        ! -- void glfwDefaultWindowHints()
        glfwDefaultWindowHints, &
        ! -- void glfwWindowHint(int IN hint, int IN value)
        glfwWindowHint, &
        ! -- void glfwWindowHintString(int IN hint, char IN value)
        glfwWindowHintString, &
        ! -- void glfwPollEvents()
        glfwPollEvents, &
        ! -- void glfwWaitEvents()
        glfwWaitEvents, &
        ! -- void glfwWaitEventsTimeout(double IN timeout)
        glfwWaitEventsTimeout, &
        ! -- void glfwPostEmptyEvent()
        glfwPostEmptyEvent, &
        ! -- logical glfwRawMouseMotionSupported() result(supported)
        glfwRawMouseMotionSupported, &
        ! -- char POINTER glfwGetKeyName(int IN key, int IN scancode) result(name)
        glfwGetKeyName, &
        ! -- int glfwGetKeyScancode(int IN key) result(scancode)
        glfwGetKeyScancode, &
        ! -- logical glfwJoystickPresent(int IN jid) result(jpresent)
        glfwJoystickPresent, &
        ! -- real(:) glfwGetJoystickAxes(int IN jid) result(axes)
        ! Note: The "count" parameter from the original function can be obtained from size(axes) instead
        !       size(axes) = 0 if joystick is not present (axes == NULL from C side)
        glfwGetJoystickAxes, &
        ! -- char POINTER glfwGetJoystickName(int IN jid) result(name)
        glfwGetJoystickName, &
        ! -- char POINTER glfwGetJoystickGUID(int IN jid) result(GUID)
        glfwGetJoystickGUID, &
        ! -- logical glfwJoystickIsGamepad(int IN jid) result(is_gamepad)
        glfwJoystickIsGamepad, &
        ! -- procedure(GLFWjoystickfun) POINTER glfwSetJoystickCallback(procedure(GLFWjoystickfun) POINTER IN callback) result(prev_callback)
        glfwSetJoystickCallback, &
        ! -- logical glfwJoystickIsGamepad(char IN mappings) result(success)
        glfwUpdateGamepadMappings, &
        ! -- char POINTER glfwGetGamepadName(int IN jid) result(name)
        glfwGetGamepadName, &
        ! -- double glfwGetTime() result(time)
        glfwGetTime, &
        ! -- void glfwSetTime(double IN time)
        glfwSetTime, &
        ! -- long glfwGetTimerValue() result(value)
        glfwGetTimerValue, &
        ! -- long glfwGetTimerFrequency() result(frequency)
        glfwGetTimerFrequency, &
        ! -- void glfwSwapInterval(int IN interval)
        glfwSwapInterval, &
        ! -- logical glfwExtensionSupported(char IN extension) result(supported)
        glfwExtensionSupported, &
        ! -- logical glfwVulkanSupported() result(supported)
        glfwVulkanSupported


    ! --------------------------------------------------------------------------
    ! GLF90W C function interfaces
    ! --------------------------------------------------------------------------


    interface
        function c_glfwInit() result(success) bind(C, name="glfwInit")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int) :: success
        end function c_glfwInit
    end interface

    interface
        subroutine c_glfwTerminate() bind(C, name="glfwTerminate")
        end subroutine c_glfwTerminate
    end interface

    interface
        subroutine glfwInitHint(hint, value) bind(C, name="glfwInitHint")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: hint
            integer(kind=c_int), value, intent(in) :: value
        end subroutine glfwInitHint
    end interface

    interface
        subroutine glfwGetVersion(major, minor, rev) bind(C, name="glfwGetVersion")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(out) :: major
            integer(kind=c_int), intent(out) :: minor
            integer(kind=c_int), intent(out) :: rev
        end subroutine glfwGetVersion
    end interface

    interface
        function c_glfwGetVersionString() result(str) bind(C, name="glfwGetVersionString")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr) :: str
        end function c_glfwGetVersionString
    end interface

    interface
        function c_glfwGetError(description) result(error_code) bind(C, name="glfwGetError")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr)         :: description
            integer(kind=c_int) :: error_code
        end function c_glfwGetError
    end interface

    interface
        function c_glfwSetErrorCallback(callback) result(prev_callback) bind(C, name="glfwSetErrorCallback")
            use, intrinsic :: iso_c_binding, only: c_funptr

            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetErrorCallback
    end interface

    interface
        function glfwGetPlatform() result(platform) bind(C, name="glfwGetPlatform")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int) :: platform
        end function glfwGetPlatform
    end interface

    interface
        function c_glfwPlatformSupported(platform) result(supported) bind(C, name="glfwPlatformSupported")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: platform
            integer(kind=c_int)                    :: supported
        end function c_glfwPlatformSupported
    end interface

    interface
        function c_glfwGetMonitors(count) result(monitors) bind(C, name="glfwGetMonitors")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int) :: count
            type(c_ptr)         :: monitors
        end function c_glfwGetMonitors
    end interface

    interface
        function c_glfwGetPrimaryMonitor() result(monitor) bind(C, name="glfwGetPrimaryMonitor")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr) :: monitor
        end function c_glfwGetPrimaryMonitor
    end interface

    interface
        subroutine c_glfwGetMonitorPos(monitor, x, y) bind(C, name="glfwGetMonitorPos")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            integer(kind=c_int), intent(out) :: x, y
        end subroutine c_glfwGetMonitorPos
    end interface

    interface
        subroutine c_glfwGetMonitorWorkarea(monitor, x, y, w, h) bind(C, name="glfwGetMonitorWorkarea")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            integer(kind=c_int), intent(out) :: x, y, w, h
        end subroutine c_glfwGetMonitorWorkarea
    end interface

    interface
        subroutine c_glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM) bind(C, name="glfwGetMonitorPhysicalSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            integer(kind=c_int), intent(out) :: widthMM, heightMM
        end subroutine c_glfwGetMonitorPhysicalSize
    end interface

    interface
        subroutine c_glfwGetMonitorContentScale(monitor, xscale, yscale) bind(C, name="glfwGetMonitorContentScale")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            real(kind=c_float), intent(out) :: xscale, yscale
        end subroutine c_glfwGetMonitorContentScale
    end interface

    interface
        function c_glfwGetMonitorName(monitor) result(name) bind(C, name="glfwGetMonitorName")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: name
        end function c_glfwGetMonitorName
    end interface

    interface
        subroutine c_glfwSetMonitorUserPointer(monitor, ptr) bind(C, name="glfwSetMonitorUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr), value, intent(in) :: ptr
        end subroutine c_glfwSetMonitorUserPointer
    end interface

    interface
        function c_glfwGetMonitorUserPointer(monitor) result(ptr) bind(C, name="glfwGetMonitorUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: ptr
        end function c_glfwGetMonitorUserPointer
    end interface

    interface
        function c_glfwSetMonitorCallback(callback) result(prev_callback) bind(C, name="glfwSetMonitorCallback")
            use, intrinsic :: iso_c_binding, only: c_funptr

            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetMonitorCallback
    end interface

    interface
        subroutine glfwDefaultWindowHints() bind(C, name="glfwDefaultWindowHints")
        end subroutine glfwDefaultWindowHints
    end interface

    interface
        subroutine glfwWindowHint(hint, value) bind(C, name="glfwWindowHint")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: hint
            integer(kind=c_int), value, intent(in) :: value
        end subroutine glfwWindowHint
    end interface

    interface
        subroutine c_glfwWindowHintString(hint, value) bind(C, name="glfwWindowHintString")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int), value, intent(in)                  :: hint
            character(len=1, kind=c_char), dimension(*), intent(in) :: value
        end subroutine c_glfwWindowHintString
    end interface

    interface
        subroutine glfwPollEvents() bind(C, name="glfwPollEvents")
        end subroutine glfwPollEvents
    end interface

    interface
        subroutine glfwWaitEvents() bind(C, name="glfwWaitEvents")
        end subroutine glfwWaitEvents
    end interface

    interface
        subroutine glfwWaitEventsTimeout(timeout) bind(C, name="glfwWaitEventsTimeout")
            use, intrinsic :: iso_c_binding, only: c_double

            implicit none
            real(kind=c_double), value, intent(in) :: timeout
        end subroutine glfwWaitEventsTimeout
    end interface

    interface
        subroutine glfwPostEmptyEvent() bind(C, name="glfwPostEmptyEvent")
        end subroutine glfwPostEmptyEvent
    end interface

    interface
        function c_glfwRawMouseMotionSupported() result(supported) bind(C, name="glfwRawMouseMotionSupported")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwRawMouseMotionSupported
    end interface

    interface
        function c_glfwGetKeyName(key, scancode) result(name) bind(C, name="glfwGetKeyName")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int), value, intent(in) :: scancode
            type(c_ptr)                            :: name
        end function c_glfwGetKeyName
    end interface

    interface
        function glfwGetKeyScancode(key) result(scancode) bind(C, name="glfwGetKeyScancode")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int)                    :: scancode
        end function glfwGetKeyScancode
    end interface

    interface
        function c_glfwJoystickPresent(jid) result(jpresent) bind(C, name="glfwJoystickPresent")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: jpresent
        end function c_glfwJoystickPresent
    end interface

    interface
        function c_glfwGetJoystickAxes(jid, count) result(axes) bind(C, name="glfwGetJoystickAxes")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: axes
        end function c_glfwGetJoystickAxes
    end interface

    interface
        function c_glfwGetJoystickName(jid) result(name) bind(C, name="glfwGetJoystickName")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: name
        end function c_glfwGetJoystickName
    end interface

    interface
        function c_glfwGetJoystickGUID(jid) result(GUID) bind(C, name="glfwGetJoystickGUID")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: GUID
        end function c_glfwGetJoystickGUID
    end interface

    interface
        function c_glfwJoystickIsGamepad(jid) result(is_gamepad) bind(C, name="glfwJoystickIsGamepad")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: is_gamepad
        end function c_glfwJoystickIsGamepad
    end interface

    interface
        function c_glfwSetJoystickCallback(callback) result(prev_callback) bind(C, name="glfwSetJoystickCallback")
            use, intrinsic :: iso_c_binding, only: c_funptr

            implicit none
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetJoystickCallback
    end interface

    interface
        function c_glfwUpdateGamepadMappings(mappings) result(success) bind(C, name="glfwUpdateGamepadMappings")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: mappings
            integer(kind=c_int)                                     :: success
        end function c_glfwUpdateGamepadMappings
    end interface

    interface
        function c_glfwGetGamepadName(jid) result(name) bind(C, name="glfwGetGamepadName")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: name
        end function c_glfwGetGamepadName
    end interface

    interface
        function glfwGetTime() result(time) bind(C, name="glfwGetTime")
            use, intrinsic :: iso_c_binding, only: c_double

            implicit none
            real(kind=c_double) :: time
        end function glfwGetTime
    end interface

    interface
        subroutine glfwSetTime(time) bind(C, name="glfwSetTime")
            use, intrinsic :: iso_c_binding, only: c_double

            implicit none
            real(kind=c_double), value, intent(in) :: time
        end subroutine glfwSetTime
    end interface

    interface
        function glfwGetTimerValue() result(value) bind(C, name="glfwGetTimerValue")
            use, intrinsic :: iso_c_binding, only: c_int64_t

            implicit none
            integer(kind=c_int64_t) :: value
        end function glfwGetTimerValue
    end interface

    interface
        function glfwGetTimerFrequency() result(frequency) bind(C, name="glfwGetTimerFrequency")
            use, intrinsic :: iso_c_binding, only: c_int64_t

            implicit none
            integer(kind=c_int64_t) :: frequency
        end function glfwGetTimerFrequency
    end interface

    interface
        subroutine glfwSwapInterval(interval) bind(C, name="glfwSwapInterval")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: interval
        end subroutine glfwSwapInterval
    end interface

    interface
        function c_glfwExtensionSupported(extension) result(supported) bind(C, name="glfwExtensionSupported")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: extension
            integer(kind=c_int)                                     :: supported
        end function c_glfwExtensionSupported
    end interface

    interface
        function c_glfwVulkanSupported() result(supported) bind(C, name="glfwVulkanSupported")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwVulkanSupported
    end interface


    ! --------------------------------------------------------------------------
    ! GLF90W C-interoperability function interfaces
    ! --------------------------------------------------------------------------


    interface
        pure function c_strlen(cstr) result(length) bind(C, name="strlen")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
            implicit none
            type(c_ptr), value, intent(in) :: cstr
            integer(kind=c_size_t)         :: length
        end function c_strlen
    end interface

    interface c_f_string
        module procedure :: c_str_f_string, c_ptr_f_string
    end interface c_f_string

    contains


        ! ----------------------------------------------------------------------
        ! GLF90W API procedures
        ! ----------------------------------------------------------------------


        function glfwInit() result(success)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            logical :: success

            integer(kind=c_int) :: res

            res = c_glfwInit()
            if (res == GLFW_TRUE) then
                success = .true.
            else
                success = .false.
            end if
        end function glfwInit

        subroutine glfwTerminate()
            implicit none

            call c_glfwTerminate()

            glf90wErrorCallback              => null()
            glf90wWindowPosCallback          => null()
            glf90wWindowSizeCallback         => null()
            glf90wWindowCloseCallback        => null()
            glf90wWindowRefreshCallback      => null()
            glf90wWindowFocusCallback        => null()
            glf90wWindowIconifyCallback      => null()
            glf90wWindowMaximizeCallback     => null()
            glf90wFramebufferSizeCallback    => null()
            glf90wWindowContentScaleCallback => null()
            glf90wMouseButtonCallback        => null()
            glf90wCursorPosCallback          => null()
            glf90wCursorEnterCallback        => null()
            glf90wScrollCallback             => null()
            glf90wKeyCallback                => null()
            glf90wCharCallback               => null()
            glf90wCharModsCallback           => null()
            glf90wDropCallback               => null()
            glf90wMonitorCallback            => null()
            glf90wJoystickCallback           => null()
        end subroutine glfwTerminate

        function glfwGetVersionString() result(str)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char

            implicit none
            character(len=:), pointer :: str

            type(c_ptr) :: c_str

            c_str = c_glfwGetVersionString()
            call c_f_strptr(c_str, str)
        end function glfwGetVersionString

        function glfwGetError(description) result(error_code)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_int, c_char

            implicit none
            integer(kind=c_int)                 :: error_code
            character(len=:), pointer, optional :: description

            type(c_ptr) :: desc_cptr

            error_code = c_glfwGetError(desc_cptr)
            if (present(description)) then
                if (c_associated(desc_cptr)) then
                    call c_f_strptr(desc_cptr, description)
                else
                    description => null()
                end if
            end if
        end function glfwGetError

        function glfwSetErrorCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr

            implicit none
            procedure(GLFWerrorfun), optional :: callback
            procedure(GLFWerrorfun), pointer  :: prev_callback
            type(c_funptr) :: ret

            ret = c_glfwSetErrorCallback(c_funloc(glf90wErrorWrapper))
            prev_callback => glf90wErrorCallback
            if (present(callback)) then
                glf90wErrorCallback => callback
            else
                glf90wErrorCallback => null()
            end if
        end function glfwSetErrorCallback

        function glfwPlatformSupported(platform) result(supported)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: platform
            logical                         :: supported

            integer(kind=c_int) :: res

            res = c_glfwPlatformSupported(platform)
            if (res == GLFW_TRUE) then
                supported = .true.
            else
                supported = .false.
            end if
        end function glfwPlatformSupported

        function glfwGetMonitors() result(monitors)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_int

            implicit none
            type(GLFWmonitor_ptr), dimension(:), allocatable :: monitors

            type(c_ptr) :: c_monitors
            integer(kind=c_int) :: count
            type(c_ptr), dimension(:), pointer :: c_array
            count = 0

            c_monitors = c_glfwGetMonitors(count)
            allocate(monitors(count))
            if (count > 0) then
                call c_f_pointer(c_monitors, c_array, [count])
                monitors(:)%ptr = c_array
            end if
        end function glfwGetMonitors

        function glfwGetPrimaryMonitor() result(monitor)
            implicit none
            type(GLFWmonitor_ptr) :: monitor

            monitor = GLFWmonitor_ptr(ptr = c_glfwGetPrimaryMonitor())
        end function glfwGetPrimaryMonitor

        subroutine glfwGetMonitorPos(monitor, x, y)
            use, intrinsic :: iso_c_binding, only: c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            integer(kind=int32), optional, intent(out) :: x, y

            integer(kind=c_int) :: c_x, c_y

            call c_glfwGetMonitorPos(monitor%ptr, c_x, c_y)
            if (present(x)) x = int(c_x, kind=int32)
            if (present(y)) y = int(c_y, kind=int32)
        end subroutine glfwGetMonitorPos

        subroutine glfwGetMonitorWorkarea(monitor, x, y, width, height)
            use, intrinsic :: iso_c_binding, only: c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            integer(kind=int32), optional, intent(out) :: x, y, width, height

            integer(kind=c_int) :: c_x, c_y, c_w, c_h

            call c_glfwGetMonitorWorkarea(monitor%ptr, c_x, c_y, c_w, c_h)
            if (present(x))      x      = int(c_x, kind=int32)
            if (present(y))      y      = int(c_y, kind=int32)
            if (present(width))  width  = int(c_w, kind=int32)
            if (present(height)) height = int(c_h, kind=int32)
        end subroutine glfwGetMonitorWorkarea

        subroutine glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM)
            use, intrinsic :: iso_c_binding, only: c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            integer(kind=int32), optional, intent(out) :: widthMM, heightMM

            integer(kind=c_int) :: c_w
            integer(kind=c_int) :: c_h

            call c_glfwGetMonitorPhysicalSize(monitor%ptr, c_w, c_h)
            if (present(widthMM))  widthMM  = int(c_w, kind=int32)
            if (present(heightMM)) heightMM = int(c_h, kind=int32)
        end subroutine glfwGetMonitorPhysicalSize

        subroutine glfwGetMonitorContentScale(monitor, xscale, yscale)
            use, intrinsic :: iso_c_binding, only: c_float
            use, intrinsic :: iso_fortran_env, only: real32

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            real(kind=real32), optional, intent(out) :: xscale, yscale

            real(kind=c_float) :: c_xscale, c_yscale

            call c_glfwGetMonitorContentScale(monitor%ptr, c_xscale, c_yscale)
            if (present(xscale)) xscale = real(c_xscale, kind=real32)
            if (present(yscale)) yscale = real(c_yscale, kind=real32)
        end subroutine glfwGetMonitorContentScale

        function glfwGetMonitorName(monitor) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            character(len=:), pointer :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetMonitorName(monitor%ptr)
            if (c_associated(c_name)) then
                call c_f_strptr(c_name, name)
            else
                name => null()
            end if
        end function glfwGetMonitorName

        subroutine glfwSetMonitorUserPointer(monitor, ptr)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(c_ptr), intent(in)           :: ptr

            call c_glfwSetMonitorUserPointer(monitor%ptr, ptr)
        end subroutine glfwSetMonitorUserPointer

        function glfwGetMonitorUserPointer(monitor) result(ptr)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(c_ptr)                       :: ptr

            ptr = c_glfwGetMonitorUserPointer(monitor%ptr)
        end function glfwGetMonitorUserPointer

        function glfwSetMonitorCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr

            implicit none
            procedure(GLFWmonitorfun), optional :: callback
            procedure(GLFWmonitorfun), pointer  :: prev_callback
            type(c_funptr) :: ret

            ret = c_glfwSetMonitorCallback(c_funloc(glf90wMonitorWrapper))
            prev_callback => glf90wMonitorCallback
            if (present(callback)) then
                glf90wMonitorCallback => callback
            else
                glf90wMonitorCallback => null()
            end if
        end function glfwSetMonitorCallback

        subroutine glfwWindowHintString(hint, value)
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: hint
            character(len=*), intent(in)    :: value

            call c_glfwWindowHintString(hint, f_c_string(value))
        end subroutine glfwWindowHintString

        function glfwRawMouseMotionSupported() result(supported)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            logical :: supported

            integer(kind=c_int) :: res

            res = c_glfwRawMouseMotionSupported()
            if (res == GLFW_TRUE) then
                supported = .true.
            else
                supported = .false.
            end if
        end function glfwRawMouseMotionSupported

        function glfwGetKeyName(key, scancode) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: key
            integer(kind=c_int), intent(in) :: scancode
            character(len=:), pointer       :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetKeyName(key, scancode)
            if (c_associated(c_name)) then
                call c_f_strptr(c_name, name)
            else
                name => null()
            end if
        end function glfwGetKeyName

        function glfwJoystickPresent(jid) result(jpresent)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: jpresent

            integer(kind=c_int) :: res

            res = c_glfwJoystickPresent(jid)
            if (res == GLFW_TRUE) then
                jpresent = .true.
            else
                jpresent = .false.
            end if
        end function glfwJoystickPresent

        function glfwGetJoystickAxes(jid) result(axes)
            use, intrinsic :: iso_c_binding, only: c_associated, c_f_pointer, c_ptr, c_int, c_float

            implicit none
            integer(kind=c_int), intent(in)               :: jid
            real(kind=c_float), dimension(:), allocatable :: axes

            type(c_ptr) :: c_axes
            integer(kind=c_int) :: count
            real(kind=c_float), dimension(:), pointer :: c_array
            count = 0

            c_axes = c_glfwGetJoystickAxes(jid, count)
            if (c_associated(c_axes) .AND. count > 0) then
                call c_f_pointer(c_axes, c_array, [count])
                axes = c_array
            else
                ! Allocate 0-size array if nullptr
                allocate(axes(0))
            end if
        end function glfwGetJoystickAxes

        function glfwGetJoystickName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetJoystickName(jid)
            if (c_associated(c_name)) then
                call c_f_strptr(c_name, name)
            else
                name => null()
            end if
        end function glfwGetJoystickName

        function glfwGetJoystickGUID(jid) result(GUID)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: GUID

            type(c_ptr) :: c_name

            c_name = c_glfwGetJoystickGUID(jid)
            if (c_associated(c_name)) then
                call c_f_strptr(c_name, GUID)
            else
                GUID => null()
            end if
        end function glfwGetJoystickGUID

        function glfwJoystickIsGamepad(jid) result(is_gamepad)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: is_gamepad

            integer(kind=c_int) :: res

            res = c_glfwJoystickIsGamepad(jid)
            if (res == GLFW_TRUE) then
                is_gamepad = .true.
            else
                is_gamepad = .false.
            end if
        end function glfwJoystickIsGamepad

        function glfwSetJoystickCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr

            implicit none
            procedure(GLFWjoystickfun), optional :: callback
            procedure(GLFWjoystickfun), pointer  :: prev_callback
            type(c_funptr) :: ret

            ret = c_glfwSetJoystickCallback(c_funloc(glf90wJoystickWrapper))
            prev_callback => glf90wJoystickCallback
            if (present(callback)) then
                glf90wJoystickCallback => callback
            else
                glf90wJoystickCallback => null()
            end if
        end function glfwSetJoystickCallback

        function glfwUpdateGamepadMappings(mappings) result(success)
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=*), intent(in) :: mappings
            logical                      :: success

            integer(kind=c_int) :: res

            res = c_glfwUpdateGamepadMappings(f_c_string(mappings))
            if (res == GLFW_TRUE) then
                success = .true.
            else
                success = .false.
            end if
        end function glfwUpdateGamepadMappings

        function glfwGetGamepadName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetGamepadName(jid)
            if (c_associated(c_name)) then
                call c_f_strptr(c_name, name)
            else
                name => null()
            end if
        end function glfwGetGamepadName

        function glfwExtensionSupported(extension) result(supported)
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=*), intent(in) :: extension
            logical                      :: supported

            integer(kind=c_int) :: res

            res = c_glfwExtensionSupported(f_c_string(extension))
            if (res == GLFW_TRUE) then
                supported = .true.
            else
                supported = .false.
            end if
        end function glfwExtensionSupported

        function glfwVulkanSupported() result(supported)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            logical :: supported

            integer(kind=c_int) :: res

            res = c_glfwVulkanSupported()
            if (res == GLFW_TRUE) then
                supported = .true.
            else
                supported = .false.
            end if
        end function glfwVulkanSupported


        ! ----------------------------------------------------------------------
        ! GLF90W Callback wrapper procedures
        ! ----------------------------------------------------------------------


        ! NOTE In principle, the wrappers are not associated to GLFW if the callbacks are NULL()
        ! Therefore there shouldn't be a need to check "associated(glf90wSomeCallback)"
        ! But remember to check here if something goes wrong (?)

        subroutine glf90wErrorWrapper(error_code, desc_ptr) bind(C)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            integer(kind=c_int), value, intent(in) :: error_code
            type(c_ptr),         value, intent(in) :: desc_ptr

            character(len=:), pointer :: f_desc
            f_desc => null()

            if (c_associated(desc_ptr)) call c_f_strptr(desc_ptr, f_desc)
            call glf90wErrorCallback(int(error_code, kind=int32), f_desc)
        end subroutine glf90wErrorWrapper

        subroutine glf90wWindowPosWrapper(window, x, y) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: x, y

            call glf90wWindowPosCallback(GLFWwindow_ptr(ptr = window), &
                                         int(x, kind=int32), &
                                         int(y, kind=int32))
        end subroutine glf90wWindowPosWrapper

        subroutine glf90wWindowSizeWrapper(window, width, height) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height

            call glf90wWindowSizeCallback(GLFWwindow_ptr(ptr = window), &
                                          int(width, kind=int32), &
                                          int(height, kind=int32))
        end subroutine glf90wWindowSizeWrapper

        subroutine glf90wWindowCloseWrapper(window) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window

            call glf90wWindowCloseCallback(GLFWwindow_ptr(ptr = window))
        end subroutine glf90wWindowCloseWrapper

        subroutine glf90wWindowRefreshWrapper(window) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window

            call glf90wWindowRefreshCallback(GLFWwindow_ptr(ptr = window))
        end subroutine glf90wWindowRefreshWrapper

        subroutine glf90wWindowFocusWrapper(window, focused) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: focused

            call glf90wWindowFocusCallback(GLFWwindow_ptr(ptr = window), &
                                           merge(.true., .false., focused == GLFW_TRUE))
        end subroutine glf90wWindowFocusWrapper

        subroutine glf90wWindowIconifyWrapper(window, iconified) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: iconified

            call glf90wWindowIconifyCallback(GLFWwindow_ptr(ptr = window), &
                                             merge(.true., .false., iconified == GLFW_TRUE))
        end subroutine glf90wWindowIconifyWrapper

        subroutine glf90wWindowMaximizeWrapper(window, maximized) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: maximized

            call glf90wWindowMaximizeCallback(GLFWwindow_ptr(ptr = window), &
                                              merge(.true., .false., maximized == GLFW_TRUE))
        end subroutine glf90wWindowMaximizeWrapper

        subroutine glf90wFramebufferSizeWrapper(window, width, height) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height

            call glf90wFramebufferSizeCallback(GLFWwindow_ptr(ptr = window), &
                                               int(width, kind=int32), &
                                               int(height, kind=int32))
        end subroutine glf90wFramebufferSizeWrapper

        subroutine glf90wWindowContentScaleWrapper(window, xscale, yscale) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float
            use, intrinsic :: iso_fortran_env, only: real32

            implicit none
            type(c_ptr),        value, intent(in) :: window
            real(kind=c_float), value, intent(in) :: xscale, yscale

            call glf90wWindowContentScaleCallback(GLFWwindow_ptr(ptr = window), &
                                                  real(xscale, kind=real32), &
                                                  real(yscale, kind=real32))
        end subroutine glf90wWindowContentScaleWrapper

        subroutine glf90wMouseButtonWrapper(window, button, action, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: button, action, mods

            call glf90wMouseButtonCallback(GLFWwindow_ptr(ptr = window), &
                                           int(button, kind=int32), &
                                           int(action, kind=int32), &
                                           int(mods, kind=int32))
        end subroutine glf90wMouseButtonWrapper

        subroutine glf90wCursorPosWrapper(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double
            use, intrinsic :: iso_fortran_env, only: real64

            implicit none
            type(c_ptr),       value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: x, y

            call glf90wCursorPosCallback(GLFWwindow_ptr(ptr = window), &
                                         real(x, kind=real64), &
                                         real(y, kind=real64))
        end subroutine glf90wCursorPosWrapper

        subroutine glf90wCursorEnterWrapper(window, entered) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: entered

            call glf90wCursorEnterCallback(GLFWwindow_ptr(ptr = window), &
                                           merge(.true., .false., entered == GLFW_TRUE))
        end subroutine glf90wCursorEnterWrapper 

        subroutine glf90wScrollWrapper(window, xoffset, yoffset)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double
            use, intrinsic :: iso_fortran_env, only: real64

            implicit none
            type(c_ptr),       value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: xoffset, yoffset

            call glf90wScrollCallback(GLFWwindow_ptr(ptr = window), &
                                      real(xoffset, kind=real64), &
                                      real(yoffset, kind=real64))
        end subroutine glf90wScrollWrapper

        subroutine glf90wKeyWrapper(window, key, scancode, action, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: key, scancode, action, mods

            call glf90wKeyCallback(GLFWwindow_ptr(ptr = window), &
                                   int(key, kind=int32), &
                                   int(scancode, kind=int32), &
                                   int(action, kind=int32), &
                                   int(mods, kind=int32))
        end subroutine glf90wKeyWrapper

        subroutine glf90wCharWrapper(window, codepoint) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: codepoint

            call glf90wCharCallback(GLFWwindow_ptr(ptr = window), &
                                    int(codepoint, kind=int32))
        end subroutine glf90wCharWrapper

        subroutine glf90wCharModsWrapper(window, codepoint, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: codepoint, mods

            call glf90wCharModsCallback(GLFWwindow_ptr(ptr = window), &
                                        int(codepoint, kind=int32), &
                                        int(mods, kind=int32))
        end subroutine glf90wCharModsWrapper

        subroutine glf90wDropWrapper(window, path_count, paths) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_int

            implicit none
            type(c_ptr), value,                 intent(in) :: window
            integer(kind=c_int), value,         intent(in) :: path_count
            type(c_ptr), dimension(path_count), intent(in) :: paths

            character(len=:, kind=c_char), dimension(:), target, allocatable :: path_array
            integer :: max_length
            integer :: i

            max_length = 0
            do i = 1,path_count
                max_length = max(max_length, c_strlen(paths(i)))
            end do

            allocate(character(len=max_length, kind=c_char) :: path_array(path_count)) ! This is supposed to be valid, right?

            do i = 1,path_count
                path_array(i) = c_f_string(paths(i))
            end do

            call glf90wDropCallback(GLFWwindow_ptr(ptr = window), path_array)
        end subroutine glf90wDropWrapper

        subroutine glf90wMonitorWrapper(monitor, event) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            type(c_ptr),         value, intent(in) :: monitor
            integer(kind=c_int), value, intent(in) :: event

            call glf90wMonitorCallback(GLFWmonitor_ptr(ptr = monitor), &
                                       int(event, kind=int32))
        end subroutine glf90wMonitorWrapper


        subroutine glf90wJoystickWrapper(jid, event) bind(C)
            use, intrinsic :: iso_c_binding, only: c_int
            use, intrinsic :: iso_fortran_env, only: int32

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int), value, intent(in) :: event

            call glf90wJoystickCallback(int(jid, kind=int32), int(event, kind=int32))
        end subroutine glf90wJoystickWrapper


        ! ----------------------------------------------------------------------
        ! GLF90W Pointer semantic for GLFW opaque pointer types
        ! ----------------------------------------------------------------------


        pure function associated_opaque(pointer, target) result(is_associated)
            use, intrinsic :: iso_c_binding, only: c_associated

            implicit none
            class(C_opaque_ptr), intent(in)           :: pointer
            class(C_opaque_ptr), optional, intent(in) :: target
            logical                                   :: is_associated

            if (present(target)) then
                is_associated = c_associated(pointer%ptr, target%ptr)
            else
                is_associated = c_associated(pointer%ptr)
            end if
        end function associated_opaque


        ! ----------------------------------------------------------------------
        ! GLF90W C-interoperability procedures
        ! ----------------------------------------------------------------------


        ! Converts a Fortran character string to a C interoperable string (character array)
        pure function f_c_string(fstr, asis) result(cstr)
            use, intrinsic :: iso_c_binding, only: c_char, c_null_char

            implicit none
            character(len=*), intent(in)                             :: fstr
            logical, optional, intent(in)                            :: asis
            character(len=1, kind=c_char), dimension(:), allocatable :: cstr

            integer :: length
            integer :: i

            if (present(asis)) then
                if (asis) then
                    length = len(fstr) + 1
                else
                    length = len_trim(fstr) + 1
                end if
            else
                length = len_trim(fstr) + 1
            end if

            allocate(character(len=1, kind=c_char) :: cstr(length))
            do i = 1,length
                cstr(i) = fstr(i:i)
            end do
            cstr(length + 1) = c_null_char
        end function f_c_string

        ! Converts a C interoperable string (character array) to a Fortran character string
        pure function c_str_f_string(cstr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_loc, c_char

            implicit none
            character(len=1, kind=c_char), dimension(:), target, intent(in) :: cstr
            character(len=c_strlen(c_loc(cstr)))                            :: fstr

            integer :: i

            do i = 1,len(fstr)
                fstr(i:i) = cstr(i)
            end do
        end function c_str_f_string

        ! Convert a C string (char*) to a Fortran character string
        function c_ptr_f_string(cptr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_associated, c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr), intent(in)       :: cptr
            character(len=:), allocatable :: fstr

            character(len=1, kind=c_char), dimension(:), pointer :: cstr
            integer :: i

            call c_f_pointer(cptr, cstr, [c_strlen(cptr)])
            allocate(character(len=len(cstr)) :: fstr)
            do i = 1,len(cstr)
                fstr(i:i) = cstr(i)
            end do
        end function c_ptr_f_string

        ! TODO test zero-length strings are not a problem ?
        ! Obtain a Fortran pointer to a C string (char*)
        subroutine c_f_strptr(cptr, fptr)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr), intent(in)                :: cptr
            character(len=:), pointer, intent(out) :: fptr

            character(len=c_strlen(cptr), kind=c_char), pointer :: temp

            call c_f_pointer(cptr, temp)
            fptr => temp
            temp => null()
        end subroutine c_f_strptr

end module glf90w
! -----------------
! GLF90W is provided under the zlib licence
!
! Copyright (C) 2024 Gaétan J.A.M. Jalin
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

