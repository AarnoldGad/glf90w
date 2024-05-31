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
    use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr, c_char, c_int, c_float, c_null_ptr, c_null_funptr

    implicit none
    private
    save


    ! --------------------------------------------------------------------------
    ! GLFW API tokens
    ! --------------------------------------------------------------------------


    integer(kind=c_int), bind(C, name="glf90w_version_major"),                public :: GLFW_VERSION_MAJOR
    integer(kind=c_int), bind(C, name="glf90w_version_minor"),                public :: GLFW_VERSION_MINOR
    integer(kind=c_int), bind(C, name="glf90w_version_revision"),             public :: GLFW_VERSION_REVISION
    integer(kind=c_int), bind(C, name="glf90w_true"),                         public :: GLFW_TRUE
    integer(kind=c_int), bind(C, name="glf90w_false"),                        public :: GLFW_FALSE

    integer(kind=c_int), bind(C, name="glf90w_release"),                      public :: GLFW_RELEASE
    integer(kind=c_int), bind(C, name="glf90w_press"),                        public :: GLFW_PRESS
    integer(kind=c_int), bind(C, name="glf90w_repeat"),                       public :: GLFW_REPEAT
    integer(kind=c_int), bind(C, name="glf90w_hat_centered"),                 public :: GLFW_HAT_CENTERED
    integer(kind=c_int), bind(C, name="glf90w_hat_up"),                       public :: GLFW_HAT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_right"),                    public :: GLFW_HAT_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_hat_down"),                     public :: GLFW_HAT_DOWN
    integer(kind=c_int), bind(C, name="glf90w_hat_left"),                     public :: GLFW_HAT_LEFT
    integer(kind=c_int), bind(C, name="glf90w_hat_right_up"),                 public :: GLFW_HAT_RIGHT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_right_down"),               public :: GLFW_HAT_RIGHT_DOWN
    integer(kind=c_int), bind(C, name="glf90w_hat_left_up"),                  public :: GLFW_HAT_LEFT_UP
    integer(kind=c_int), bind(C, name="glf90w_hat_left_down"),                public :: GLFW_HAT_LEFT_DOWN

    integer(kind=c_int), bind(C, name="glf90w_key_unknown"),                  public :: GLFW_KEY_UNKNOWN

    integer(kind=c_int), bind(C, name="glf90w_key_space"),                    public :: GLFW_KEY_SPACE
    integer(kind=c_int), bind(C, name="glf90w_key_apostrophe"),               public :: GLFW_KEY_APOSTROPHE
    integer(kind=c_int), bind(C, name="glf90w_key_comma"),                    public :: GLFW_KEY_COMMA
    integer(kind=c_int), bind(C, name="glf90w_key_minus"),                    public :: GLFW_KEY_MINUS
    integer(kind=c_int), bind(C, name="glf90w_key_period"),                   public :: GLFW_KEY_PERIOD
    integer(kind=c_int), bind(C, name="glf90w_key_slash"),                    public :: GLFW_KEY_SLASH
    integer(kind=c_int), bind(C, name="glf90w_key_0"),                        public :: GLFW_KEY_0
    integer(kind=c_int), bind(C, name="glf90w_key_1"),                        public :: GLFW_KEY_1
    integer(kind=c_int), bind(C, name="glf90w_key_2"),                        public :: GLFW_KEY_2
    integer(kind=c_int), bind(C, name="glf90w_key_3"),                        public :: GLFW_KEY_3
    integer(kind=c_int), bind(C, name="glf90w_key_4"),                        public :: GLFW_KEY_4
    integer(kind=c_int), bind(C, name="glf90w_key_5"),                        public :: GLFW_KEY_5
    integer(kind=c_int), bind(C, name="glf90w_key_6"),                        public :: GLFW_KEY_6
    integer(kind=c_int), bind(C, name="glf90w_key_7"),                        public :: GLFW_KEY_7
    integer(kind=c_int), bind(C, name="glf90w_key_8"),                        public :: GLFW_KEY_8
    integer(kind=c_int), bind(C, name="glf90w_key_9"),                        public :: GLFW_KEY_9
    integer(kind=c_int), bind(C, name="glf90w_key_semicolon"),                public :: GLFW_KEY_SEMICOLON
    integer(kind=c_int), bind(C, name="glf90w_key_equal"),                    public :: GLFW_KEY_EQUAL
    integer(kind=c_int), bind(C, name="glf90w_key_a"),                        public :: GLFW_KEY_A
    integer(kind=c_int), bind(C, name="glf90w_key_b"),                        public :: GLFW_KEY_B
    integer(kind=c_int), bind(C, name="glf90w_key_c"),                        public :: GLFW_KEY_C
    integer(kind=c_int), bind(C, name="glf90w_key_d"),                        public :: GLFW_KEY_D
    integer(kind=c_int), bind(C, name="glf90w_key_e"),                        public :: GLFW_KEY_E
    integer(kind=c_int), bind(C, name="glf90w_key_f"),                        public :: GLFW_KEY_F
    integer(kind=c_int), bind(C, name="glf90w_key_g"),                        public :: GLFW_KEY_G
    integer(kind=c_int), bind(C, name="glf90w_key_h"),                        public :: GLFW_KEY_H
    integer(kind=c_int), bind(C, name="glf90w_key_i"),                        public :: GLFW_KEY_I
    integer(kind=c_int), bind(C, name="glf90w_key_j"),                        public :: GLFW_KEY_J
    integer(kind=c_int), bind(C, name="glf90w_key_k"),                        public :: GLFW_KEY_K
    integer(kind=c_int), bind(C, name="glf90w_key_l"),                        public :: GLFW_KEY_L
    integer(kind=c_int), bind(C, name="glf90w_key_m"),                        public :: GLFW_KEY_M
    integer(kind=c_int), bind(C, name="glf90w_key_n"),                        public :: GLFW_KEY_N
    integer(kind=c_int), bind(C, name="glf90w_key_o"),                        public :: GLFW_KEY_O
    integer(kind=c_int), bind(C, name="glf90w_key_p"),                        public :: GLFW_KEY_P
    integer(kind=c_int), bind(C, name="glf90w_key_q"),                        public :: GLFW_KEY_Q
    integer(kind=c_int), bind(C, name="glf90w_key_r"),                        public :: GLFW_KEY_R
    integer(kind=c_int), bind(C, name="glf90w_key_s"),                        public :: GLFW_KEY_S
    integer(kind=c_int), bind(C, name="glf90w_key_t"),                        public :: GLFW_KEY_T
    integer(kind=c_int), bind(C, name="glf90w_key_u"),                        public :: GLFW_KEY_U
    integer(kind=c_int), bind(C, name="glf90w_key_v"),                        public :: GLFW_KEY_V
    integer(kind=c_int), bind(C, name="glf90w_key_w"),                        public :: GLFW_KEY_W
    integer(kind=c_int), bind(C, name="glf90w_key_x"),                        public :: GLFW_KEY_X
    integer(kind=c_int), bind(C, name="glf90w_key_y"),                        public :: GLFW_KEY_Y
    integer(kind=c_int), bind(C, name="glf90w_key_z"),                        public :: GLFW_KEY_Z
    integer(kind=c_int), bind(C, name="glf90w_key_left_bracket"),             public :: GLFW_KEY_LEFT_BRACKET
    integer(kind=c_int), bind(C, name="glf90w_key_backslash"),                public :: GLFW_KEY_BACKSLASH
    integer(kind=c_int), bind(C, name="glf90w_key_right_bracket"),            public :: GLFW_KEY_RIGHT_BRACKET
    integer(kind=c_int), bind(C, name="glf90w_key_grave_accent"),             public :: GLFW_KEY_GRAVE_ACCENT
    integer(kind=c_int), bind(C, name="glf90w_key_world_1"),                  public :: GLFW_KEY_WORLD_1
    integer(kind=c_int), bind(C, name="glf90w_key_world_2"),                  public :: GLFW_KEY_WORLD_2

    integer(kind=c_int), bind(C, name="glf90w_key_escape"),                   public :: GLFW_KEY_ESCAPE
    integer(kind=c_int), bind(C, name="glf90w_key_enter"),                    public :: GLFW_KEY_ENTER
    integer(kind=c_int), bind(C, name="glf90w_key_tab"),                      public :: GLFW_KEY_TAB
    integer(kind=c_int), bind(C, name="glf90w_key_backspace"),                public :: GLFW_KEY_BACKSPACE
    integer(kind=c_int), bind(C, name="glf90w_key_insert"),                   public :: GLFW_KEY_INSERT
    integer(kind=c_int), bind(C, name="glf90w_key_delete"),                   public :: GLFW_KEY_DELETE
    integer(kind=c_int), bind(C, name="glf90w_key_right"),                    public :: GLFW_KEY_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_key_left"),                     public :: GLFW_KEY_LEFT
    integer(kind=c_int), bind(C, name="glf90w_key_down"),                     public :: GLFW_KEY_DOWN
    integer(kind=c_int), bind(C, name="glf90w_key_up"),                       public :: GLFW_KEY_UP
    integer(kind=c_int), bind(C, name="glf90w_key_page_up"),                  public :: GLFW_KEY_PAGE_UP
    integer(kind=c_int), bind(C, name="glf90w_key_page_down"),                public :: GLFW_KEY_PAGE_DOWN
    integer(kind=c_int), bind(C, name="glf90w_key_home"),                     public :: GLFW_KEY_HOME
    integer(kind=c_int), bind(C, name="glf90w_key_end"),                      public :: GLFW_KEY_END
    integer(kind=c_int), bind(C, name="glf90w_key_caps_lock"),                public :: GLFW_KEY_CAPS_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_scroll_lock"),              public :: GLFW_KEY_SCROLL_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_num_lock"),                 public :: GLFW_KEY_NUM_LOCK
    integer(kind=c_int), bind(C, name="glf90w_key_print_screen"),             public :: GLFW_KEY_PRINT_SCREEN
    integer(kind=c_int), bind(C, name="glf90w_key_pause"),                    public :: GLFW_KEY_PAUSE
    integer(kind=c_int), bind(C, name="glf90w_key_f1"),                       public :: GLFW_KEY_F1
    integer(kind=c_int), bind(C, name="glf90w_key_f2"),                       public :: GLFW_KEY_F2
    integer(kind=c_int), bind(C, name="glf90w_key_f3"),                       public :: GLFW_KEY_F3
    integer(kind=c_int), bind(C, name="glf90w_key_f4"),                       public :: GLFW_KEY_F4
    integer(kind=c_int), bind(C, name="glf90w_key_f5"),                       public :: GLFW_KEY_F5
    integer(kind=c_int), bind(C, name="glf90w_key_f6"),                       public :: GLFW_KEY_F6
    integer(kind=c_int), bind(C, name="glf90w_key_f7"),                       public :: GLFW_KEY_F7
    integer(kind=c_int), bind(C, name="glf90w_key_f8"),                       public :: GLFW_KEY_F8
    integer(kind=c_int), bind(C, name="glf90w_key_f9"),                       public :: GLFW_KEY_F9
    integer(kind=c_int), bind(C, name="glf90w_key_f10"),                      public :: GLFW_KEY_F10
    integer(kind=c_int), bind(C, name="glf90w_key_f11"),                      public :: GLFW_KEY_F11
    integer(kind=c_int), bind(C, name="glf90w_key_f12"),                      public :: GLFW_KEY_F12
    integer(kind=c_int), bind(C, name="glf90w_key_f13"),                      public :: GLFW_KEY_F13
    integer(kind=c_int), bind(C, name="glf90w_key_f14"),                      public :: GLFW_KEY_F14
    integer(kind=c_int), bind(C, name="glf90w_key_f15"),                      public :: GLFW_KEY_F15
    integer(kind=c_int), bind(C, name="glf90w_key_f16"),                      public :: GLFW_KEY_F16
    integer(kind=c_int), bind(C, name="glf90w_key_f17"),                      public :: GLFW_KEY_F17
    integer(kind=c_int), bind(C, name="glf90w_key_f18"),                      public :: GLFW_KEY_F18
    integer(kind=c_int), bind(C, name="glf90w_key_f19"),                      public :: GLFW_KEY_F19
    integer(kind=c_int), bind(C, name="glf90w_key_f20"),                      public :: GLFW_KEY_F20
    integer(kind=c_int), bind(C, name="glf90w_key_f21"),                      public :: GLFW_KEY_F21
    integer(kind=c_int), bind(C, name="glf90w_key_f22"),                      public :: GLFW_KEY_F22
    integer(kind=c_int), bind(C, name="glf90w_key_f23"),                      public :: GLFW_KEY_F23
    integer(kind=c_int), bind(C, name="glf90w_key_f24"),                      public :: GLFW_KEY_F24
    integer(kind=c_int), bind(C, name="glf90w_key_f25"),                      public :: GLFW_KEY_F25
    integer(kind=c_int), bind(C, name="glf90w_key_kp_0"),                     public :: GLFW_KEY_KP_0
    integer(kind=c_int), bind(C, name="glf90w_key_kp_1"),                     public :: GLFW_KEY_KP_1
    integer(kind=c_int), bind(C, name="glf90w_key_kp_2"),                     public :: GLFW_KEY_KP_2
    integer(kind=c_int), bind(C, name="glf90w_key_kp_3"),                     public :: GLFW_KEY_KP_3
    integer(kind=c_int), bind(C, name="glf90w_key_kp_4"),                     public :: GLFW_KEY_KP_4
    integer(kind=c_int), bind(C, name="glf90w_key_kp_5"),                     public :: GLFW_KEY_KP_5
    integer(kind=c_int), bind(C, name="glf90w_key_kp_6"),                     public :: GLFW_KEY_KP_6
    integer(kind=c_int), bind(C, name="glf90w_key_kp_7"),                     public :: GLFW_KEY_KP_7
    integer(kind=c_int), bind(C, name="glf90w_key_kp_8"),                     public :: GLFW_KEY_KP_8
    integer(kind=c_int), bind(C, name="glf90w_key_kp_9"),                     public :: GLFW_KEY_KP_9
    integer(kind=c_int), bind(C, name="glf90w_key_kp_decimal"),               public :: GLFW_KEY_KP_DECIMAL
    integer(kind=c_int), bind(C, name="glf90w_key_kp_divide"),                public :: GLFW_KEY_KP_DIVIDE
    integer(kind=c_int), bind(C, name="glf90w_key_kp_multiply"),              public :: GLFW_KEY_KP_MULTIPLY
    integer(kind=c_int), bind(C, name="glf90w_key_kp_subtract"),              public :: GLFW_KEY_KP_SUBTRACT
    integer(kind=c_int), bind(C, name="glf90w_key_kp_add"),                   public :: GLFW_KEY_KP_ADD
    integer(kind=c_int), bind(C, name="glf90w_key_kp_enter"),                 public :: GLFW_KEY_KP_ENTER
    integer(kind=c_int), bind(C, name="glf90w_key_kp_equal"),                 public :: GLFW_KEY_KP_EQUAL
    integer(kind=c_int), bind(C, name="glf90w_key_left_shift"),               public :: GLFW_KEY_LEFT_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_key_left_control"),             public :: GLFW_KEY_LEFT_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_key_left_alt"),                 public :: GLFW_KEY_LEFT_ALT
    integer(kind=c_int), bind(C, name="glf90w_key_left_super"),               public :: GLFW_KEY_LEFT_SUPER
    integer(kind=c_int), bind(C, name="glf90w_key_right_shift"),              public :: GLFW_KEY_RIGHT_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_key_right_control"),            public :: GLFW_KEY_RIGHT_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_key_right_alt"),                public :: GLFW_KEY_RIGHT_ALT
    integer(kind=c_int), bind(C, name="glf90w_key_right_super"),              public :: GLFW_KEY_RIGHT_SUPER
    integer(kind=c_int), bind(C, name="glf90w_key_menu"),                     public :: GLFW_KEY_MENU

    integer(kind=c_int), bind(C, name="glf90w_key_last"),                     public :: GLFW_KEY_LAST

    integer(kind=c_int), bind(C, name="glf90w_mod_shift"),                    public :: GLFW_MOD_SHIFT
    integer(kind=c_int), bind(C, name="glf90w_mod_control"),                  public :: GLFW_MOD_CONTROL
    integer(kind=c_int), bind(C, name="glf90w_mod_alt"),                      public :: GLFW_MOD_ALT
    integer(kind=c_int), bind(C, name="glf90w_mod_super"),                    public :: GLFW_MOD_SUPER
    integer(kind=c_int), bind(C, name="glf90w_mod_caps_lock"),                public :: GLFW_MOD_CAPS_LOCK
    integer(kind=c_int), bind(C, name="glf90w_mod_num_lock"),                 public :: GLFW_MOD_NUM_LOCK

    integer(kind=c_int), bind(C, name="glf90w_mouse_button_1"),               public :: GLFW_MOUSE_BUTTON_1
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_2"),               public :: GLFW_MOUSE_BUTTON_2
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_3"),               public :: GLFW_MOUSE_BUTTON_3
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_4"),               public :: GLFW_MOUSE_BUTTON_4
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_5"),               public :: GLFW_MOUSE_BUTTON_5
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_6"),               public :: GLFW_MOUSE_BUTTON_6
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_7"),               public :: GLFW_MOUSE_BUTTON_7
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_8"),               public :: GLFW_MOUSE_BUTTON_8
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_last"),            public :: GLFW_MOUSE_BUTTON_LAST
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_left"),            public :: GLFW_MOUSE_BUTTON_LEFT
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_right"),           public :: GLFW_MOUSE_BUTTON_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_mouse_button_middle"),          public :: GLFW_MOUSE_BUTTON_MIDDLE
    integer(kind=c_int), bind(C, name="glf90w_joystick_1"),                   public :: GLFW_JOYSTICK_1
    integer(kind=c_int), bind(C, name="glf90w_joystick_2"),                   public :: GLFW_JOYSTICK_2
    integer(kind=c_int), bind(C, name="glf90w_joystick_3"),                   public :: GLFW_JOYSTICK_3
    integer(kind=c_int), bind(C, name="glf90w_joystick_4"),                   public :: GLFW_JOYSTICK_4
    integer(kind=c_int), bind(C, name="glf90w_joystick_5"),                   public :: GLFW_JOYSTICK_5
    integer(kind=c_int), bind(C, name="glf90w_joystick_6"),                   public :: GLFW_JOYSTICK_6
    integer(kind=c_int), bind(C, name="glf90w_joystick_7"),                   public :: GLFW_JOYSTICK_7
    integer(kind=c_int), bind(C, name="glf90w_joystick_8"),                   public :: GLFW_JOYSTICK_8
    integer(kind=c_int), bind(C, name="glf90w_joystick_9"),                   public :: GLFW_JOYSTICK_9
    integer(kind=c_int), bind(C, name="glf90w_joystick_10"),                  public :: GLFW_JOYSTICK_10
    integer(kind=c_int), bind(C, name="glf90w_joystick_11"),                  public :: GLFW_JOYSTICK_11
    integer(kind=c_int), bind(C, name="glf90w_joystick_12"),                  public :: GLFW_JOYSTICK_12
    integer(kind=c_int), bind(C, name="glf90w_joystick_13"),                  public :: GLFW_JOYSTICK_13
    integer(kind=c_int), bind(C, name="glf90w_joystick_14"),                  public :: GLFW_JOYSTICK_14
    integer(kind=c_int), bind(C, name="glf90w_joystick_15"),                  public :: GLFW_JOYSTICK_15
    integer(kind=c_int), bind(C, name="glf90w_joystick_16"),                  public :: GLFW_JOYSTICK_16
    integer(kind=c_int), bind(C, name="glf90w_joystick_last"),                public :: GLFW_JOYSTICK_LAST
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_a"),             public :: GLFW_GAMEPAD_BUTTON_A
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_b"),             public :: GLFW_GAMEPAD_BUTTON_B
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_x"),             public :: GLFW_GAMEPAD_BUTTON_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_y"),             public :: GLFW_GAMEPAD_BUTTON_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_left_bumper"),   public :: GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_right_bumper"),  public :: GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_back"),          public :: GLFW_GAMEPAD_BUTTON_BACK
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_start"),         public :: GLFW_GAMEPAD_BUTTON_START
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_guide"),         public :: GLFW_GAMEPAD_BUTTON_GUIDE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_left_thumb"),    public :: GLFW_GAMEPAD_BUTTON_LEFT_THUMB
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_right_thumb"),   public :: GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_up"),       public :: GLFW_GAMEPAD_BUTTON_DPAD_UP
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_right"),    public :: GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_down"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_DOWN
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_dpad_left"),     public :: GLFW_GAMEPAD_BUTTON_DPAD_LEFT
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_last"),          public :: GLFW_GAMEPAD_BUTTON_LAST

    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_cross"),         public :: GLFW_GAMEPAD_BUTTON_CROSS
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_circle"),        public :: GLFW_GAMEPAD_BUTTON_CIRCLE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_square"),        public :: GLFW_GAMEPAD_BUTTON_SQUARE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_button_triangle"),      public :: GLFW_GAMEPAD_BUTTON_TRIANGLE
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_x"),          public :: GLFW_GAMEPAD_AXIS_LEFT_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_y"),          public :: GLFW_GAMEPAD_AXIS_LEFT_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_x"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_X
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_y"),         public :: GLFW_GAMEPAD_AXIS_RIGHT_Y
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_left_trigger"),    public :: GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_right_trigger"),   public :: GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
    integer(kind=c_int), bind(C, name="glf90w_gamepad_axis_last"),            public :: GLFW_GAMEPAD_AXIS_LAST
    integer(kind=c_int), bind(C, name="glf90w_no_error"),                     public :: GLFW_NO_ERROR
    integer(kind=c_int), bind(C, name="glf90w_not_initialized"),              public :: GLFW_NOT_INITIALIZED
    integer(kind=c_int), bind(C, name="glf90w_no_current_context"),           public :: GLFW_NO_CURRENT_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_invalid_enum"),                 public :: GLFW_INVALID_ENUM
    integer(kind=c_int), bind(C, name="glf90w_invalid_value"),                public :: GLFW_INVALID_VALUE
    integer(kind=c_int), bind(C, name="glf90w_out_of_memory"),                public :: GLFW_OUT_OF_MEMORY
    integer(kind=c_int), bind(C, name="glf90w_api_unavailable"),              public :: GLFW_API_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_version_unavailable"),          public :: GLFW_VERSION_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_platform_error"),               public :: GLFW_PLATFORM_ERROR
    integer(kind=c_int), bind(C, name="glf90w_format_unavailable"),           public :: GLFW_FORMAT_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_no_window_context"),            public :: GLFW_NO_WINDOW_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_cursor_unavailable"),           public :: GLFW_CURSOR_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_feature_unavailable"),          public :: GLFW_FEATURE_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_feature_unimplemented"),        public :: GLFW_FEATURE_UNIMPLEMENTED
    integer(kind=c_int), bind(C, name="glf90w_platform_unavailable"),         public :: GLFW_PLATFORM_UNAVAILABLE
    integer(kind=c_int), bind(C, name="glf90w_focused"),                      public :: GLFW_FOCUSED
    integer(kind=c_int), bind(C, name="glf90w_iconified"),                    public :: GLFW_ICONIFIED
    integer(kind=c_int), bind(C, name="glf90w_resizable"),                    public :: GLFW_RESIZABLE
    integer(kind=c_int), bind(C, name="glf90w_visible"),                      public :: GLFW_VISIBLE
    integer(kind=c_int), bind(C, name="glf90w_decorated"),                    public :: GLFW_DECORATED
    integer(kind=c_int), bind(C, name="glf90w_auto_iconify"),                 public :: GLFW_AUTO_ICONIFY
    integer(kind=c_int), bind(C, name="glf90w_floating"),                     public :: GLFW_FLOATING
    integer(kind=c_int), bind(C, name="glf90w_maximized"),                    public :: GLFW_MAXIMIZED
    integer(kind=c_int), bind(C, name="glf90w_center_cursor"),                public :: GLFW_CENTER_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_transparent_framebuffer"),      public :: GLFW_TRANSPARENT_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_hovered"),                      public :: GLFW_HOVERED
    integer(kind=c_int), bind(C, name="glf90w_focus_on_show"),                public :: GLFW_FOCUS_ON_SHOW

    integer(kind=c_int), bind(C, name="glf90w_mouse_passthrough"),            public :: GLFW_MOUSE_PASSTHROUGH

    integer(kind=c_int), bind(C, name="glf90w_position_x"),                   public :: GLFW_POSITION_X
    integer(kind=c_int), bind(C, name="glf90w_position_y"),                   public :: GLFW_POSITION_Y

    integer(kind=c_int), bind(C, name="glf90w_red_bits"),                     public :: GLFW_RED_BITS
    integer(kind=c_int), bind(C, name="glf90w_green_bits"),                   public :: GLFW_GREEN_BITS
    integer(kind=c_int), bind(C, name="glf90w_blue_bits"),                    public :: GLFW_BLUE_BITS
    integer(kind=c_int), bind(C, name="glf90w_alpha_bits"),                   public :: GLFW_ALPHA_BITS
    integer(kind=c_int), bind(C, name="glf90w_depth_bits"),                   public :: GLFW_DEPTH_BITS
    integer(kind=c_int), bind(C, name="glf90w_stencil_bits"),                 public :: GLFW_STENCIL_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_red_bits"),               public :: GLFW_ACCUM_RED_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_green_bits"),             public :: GLFW_ACCUM_GREEN_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_blue_bits"),              public :: GLFW_ACCUM_BLUE_BITS
    integer(kind=c_int), bind(C, name="glf90w_accum_alpha_bits"),             public :: GLFW_ACCUM_ALPHA_BITS
    integer(kind=c_int), bind(C, name="glf90w_aux_buffers"),                  public :: GLFW_AUX_BUFFERS
    integer(kind=c_int), bind(C, name="glf90w_stereo"),                       public :: GLFW_STEREO
    integer(kind=c_int), bind(C, name="glf90w_samples"),                      public :: GLFW_SAMPLES
    integer(kind=c_int), bind(C, name="glf90w_srgb_capable"),                 public :: GLFW_SRGB_CAPABLE
    integer(kind=c_int), bind(C, name="glf90w_refresh_rate"),                 public :: GLFW_REFRESH_RATE
    integer(kind=c_int), bind(C, name="glf90w_doublebuffer"),                 public :: GLFW_DOUBLEBUFFER

    integer(kind=c_int), bind(C, name="glf90w_client_api"),                   public :: GLFW_CLIENT_API
    integer(kind=c_int), bind(C, name="glf90w_context_version_major"),        public :: GLFW_CONTEXT_VERSION_MAJOR
    integer(kind=c_int), bind(C, name="glf90w_context_version_minor"),        public :: GLFW_CONTEXT_VERSION_MINOR
    integer(kind=c_int), bind(C, name="glf90w_context_revision"),             public :: GLFW_CONTEXT_REVISION
    integer(kind=c_int), bind(C, name="glf90w_context_robustness"),           public :: GLFW_CONTEXT_ROBUSTNESS
    integer(kind=c_int), bind(C, name="glf90w_opengl_forward_compat"),        public :: GLFW_OPENGL_FORWARD_COMPAT
    integer(kind=c_int), bind(C, name="glf90w_context_debug"),                public :: GLFW_CONTEXT_DEBUG
    integer(kind=c_int), bind(C, name="glf90w_opengl_debug_context"),         public :: GLFW_OPENGL_DEBUG_CONTEXT
    integer(kind=c_int), bind(C, name="glf90w_opengl_profile"),               public :: GLFW_OPENGL_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_context_release_behavior"),     public :: GLFW_CONTEXT_RELEASE_BEHAVIOR
    integer(kind=c_int), bind(C, name="glf90w_context_no_error"),             public :: GLFW_CONTEXT_NO_ERROR
    integer(kind=c_int), bind(C, name="glf90w_context_creation_api"),         public :: GLFW_CONTEXT_CREATION_API
    integer(kind=c_int), bind(C, name="glf90w_scale_to_monitor"),             public :: GLFW_SCALE_TO_MONITOR
    integer(kind=c_int), bind(C, name="glf90w_scale_framebuffer"),            public :: GLFW_SCALE_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_cocoa_retina_framebuffer"),     public :: GLFW_COCOA_RETINA_FRAMEBUFFER
    integer(kind=c_int), bind(C, name="glf90w_cocoa_frame_name"),             public :: GLFW_COCOA_FRAME_NAME
    integer(kind=c_int), bind(C, name="glf90w_cocoa_graphics_switching"),     public :: GLFW_COCOA_GRAPHICS_SWITCHING
    integer(kind=c_int), bind(C, name="glf90w_x11_class_name"),               public :: GLFW_X11_CLASS_NAME
    integer(kind=c_int), bind(C, name="glf90w_x11_instance_name"),            public :: GLFW_X11_INSTANCE_NAME
    integer(kind=c_int), bind(C, name="glf90w_win32_keyboard_menu"),          public :: GLFW_WIN32_KEYBOARD_MENU
    integer(kind=c_int), bind(C, name="glf90w_win32_showdefault"),            public :: GLFW_WIN32_SHOWDEFAULT
    integer(kind=c_int), bind(C, name="glf90w_wayland_app_id"),               public :: GLFW_WAYLAND_APP_ID
    integer(kind=c_int), bind(C, name="glf90w_no_api"),                       public :: GLFW_NO_API
    integer(kind=c_int), bind(C, name="glf90w_opengl_api"),                   public :: GLFW_OPENGL_API
    integer(kind=c_int), bind(C, name="glf90w_opengl_es_api"),                public :: GLFW_OPENGL_ES_API

    integer(kind=c_int), bind(C, name="glf90w_no_robustness"),                public :: GLFW_NO_ROBUSTNESS
    integer(kind=c_int), bind(C, name="glf90w_no_reset_notification"),        public :: GLFW_NO_RESET_NOTIFICATION
    integer(kind=c_int), bind(C, name="glf90w_lose_context_on_reset"),        public :: GLFW_LOSE_CONTEXT_ON_RESET

    integer(kind=c_int), bind(C, name="glf90w_opengl_any_profile"),           public :: GLFW_OPENGL_ANY_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_opengl_core_profile"),          public :: GLFW_OPENGL_CORE_PROFILE
    integer(kind=c_int), bind(C, name="glf90w_opengl_compat_profile"),        public :: GLFW_OPENGL_COMPAT_PROFILE

    integer(kind=c_int), bind(C, name="glf90w_cursor"),                       public :: GLFW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_sticky_keys"),                  public :: GLFW_STICKY_KEYS
    integer(kind=c_int), bind(C, name="glf90w_sticky_mouse_buttons"),         public :: GLFW_STICKY_MOUSE_BUTTONS
    integer(kind=c_int), bind(C, name="glf90w_lock_key_mods"),                public :: GLFW_LOCK_KEY_MODS
    integer(kind=c_int), bind(C, name="glf90w_raw_mouse_motion"),             public :: GLFW_RAW_MOUSE_MOTION

    integer(kind=c_int), bind(C, name="glf90w_cursor_normal"),                public :: GLFW_CURSOR_NORMAL
    integer(kind=c_int), bind(C, name="glf90w_cursor_hidden"),                public :: GLFW_CURSOR_HIDDEN
    integer(kind=c_int), bind(C, name="glf90w_cursor_disabled"),              public :: GLFW_CURSOR_DISABLED
    integer(kind=c_int), bind(C, name="glf90w_cursor_captured"),              public :: GLFW_CURSOR_CAPTURED

    integer(kind=c_int), bind(C, name="glf90w_any_release_behavior"),         public :: GLFW_ANY_RELEASE_BEHAVIOR
    integer(kind=c_int), bind(C, name="glf90w_release_behavior_flush"),       public :: GLFW_RELEASE_BEHAVIOR_FLUSH
    integer(kind=c_int), bind(C, name="glf90w_release_behavior_none"),        public :: GLFW_RELEASE_BEHAVIOR_NONE

    integer(kind=c_int), bind(C, name="glf90w_native_context_api"),           public :: GLFW_NATIVE_CONTEXT_API
    integer(kind=c_int), bind(C, name="glf90w_egl_context_api"),              public :: GLFW_EGL_CONTEXT_API
    integer(kind=c_int), bind(C, name="glf90w_osmesa_context_api"),           public :: GLFW_OSMESA_CONTEXT_API

    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_none"),     public :: GLFW_ANGLE_PLATFORM_TYPE_NONE
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_opengl"),   public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGL
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_opengles"), public :: GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_d3d9"),     public :: GLFW_ANGLE_PLATFORM_TYPE_D3D9
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_d3d11"),    public :: GLFW_ANGLE_PLATFORM_TYPE_D3D11
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_vulkan"),   public :: GLFW_ANGLE_PLATFORM_TYPE_VULKAN
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type_metal"),    public :: GLFW_ANGLE_PLATFORM_TYPE_METAL

    integer(kind=c_int), bind(C, name="glf90w_wayland_prefer_libdecor"),      public :: GLFW_WAYLAND_PREFER_LIBDECOR
    integer(kind=c_int), bind(C, name="glf90w_wayland_disable_libdecor"),     public :: GLFW_WAYLAND_DISABLE_LIBDECOR

    integer(kind=c_int), bind(C, name="glf90w_any_position"),                 public :: GLFW_ANY_POSITION

    integer(kind=c_int), bind(C, name="glf90w_arrow_cursor"),                 public :: GLFW_ARROW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_ibeam_cursor"),                 public :: GLFW_IBEAM_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_crosshair_cursor"),             public :: GLFW_CROSSHAIR_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_pointing_hand_cursor"),         public :: GLFW_POINTING_HAND_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_ew_cursor"),             public :: GLFW_RESIZE_EW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_ns_cursor"),             public :: GLFW_RESIZE_NS_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_nwse_cursor"),           public :: GLFW_RESIZE_NWSE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_nesw_cursor"),           public :: GLFW_RESIZE_NESW_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_resize_all_cursor"),            public :: GLFW_RESIZE_ALL_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_not_allowed_cursor"),           public :: GLFW_NOT_ALLOWED_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_hresize_cursor"),               public :: GLFW_HRESIZE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_vresize_cursor"),               public :: GLFW_VRESIZE_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_hand_cursor"),                  public :: GLFW_HAND_CURSOR
    integer(kind=c_int), bind(C, name="glf90w_connected"),                    public :: GLFW_CONNECTED
    integer(kind=c_int), bind(C, name="glf90w_disconnected"),                 public :: GLFW_DISCONNECTED

    integer(kind=c_int), bind(C, name="glf90w_joystick_hat_buttons"),         public :: GLFW_JOYSTICK_HAT_BUTTONS
    integer(kind=c_int), bind(C, name="glf90w_angle_platform_type"),          public :: GLFW_ANGLE_PLATFORM_TYPE
    integer(kind=c_int), bind(C, name="glf90w_platform"),                     public :: GLFW_PLATFORM
    integer(kind=c_int), bind(C, name="glf90w_cocoa_chdir_resources"),        public :: GLFW_COCOA_CHDIR_RESOURCES
    integer(kind=c_int), bind(C, name="glf90w_cocoa_menubar"),                public :: GLFW_COCOA_MENUBAR
    integer(kind=c_int), bind(C, name="glf90w_x11_xcb_vulkan_surface"),       public :: GLFW_X11_XCB_VULKAN_SURFACE
    integer(kind=c_int), bind(C, name="glf90w_wayland_libdecor"),             public :: GLFW_WAYLAND_LIBDECOR
    integer(kind=c_int), bind(C, name="glf90w_any_platform"),                 public :: GLFW_ANY_PLATFORM
    integer(kind=c_int), bind(C, name="glf90w_platform_win32"),               public :: GLFW_PLATFORM_WIN32
    integer(kind=c_int), bind(C, name="glf90w_platform_cocoa"),               public :: GLFW_PLATFORM_COCOA
    integer(kind=c_int), bind(C, name="glf90w_platform_wayland"),             public :: GLFW_PLATFORM_WAYLAND
    integer(kind=c_int), bind(C, name="glf90w_platform_x11"),                 public :: GLFW_PLATFORM_X11
    integer(kind=c_int), bind(C, name="glf90w_platform_null"),                public :: GLFW_PLATFORM_NULL
    integer(kind=c_int), bind(C, name="glf90w_dont_care"),                    public :: GLFW_DONT_CARE


    ! --------------------------------------------------------------------------
    ! GLF90W API types
    ! --------------------------------------------------------------------------


    public :: associated

    type, abstract :: C_opaque_ptr
        private
        type(c_ptr) :: ptr = c_null_ptr
    end type c_opaque_ptr

    type, public :: string_ptr
        character(len=:, kind=c_char), pointer :: str => null()
    end type string_ptr

    interface associated
        module procedure :: associated_opaque
    end interface associated


    ! --------------------------------------------------------------------------
    ! GLFW API types
    ! --------------------------------------------------------------------------


    public :: &
        ! -- typedef void (*GLFWglproc)(void)
        GLFWglproc, &
        ! -- typedef void (*GLFWvkproc)(void)
        GLFWvkproc

    type, extends(C_opaque_ptr), public :: GLFWmonitor_ptr
    end type GLFWmonitor_ptr

    type, extends(C_opaque_ptr), public :: GLFWwindow_ptr
    end type GLFWwindow_ptr

    type, extends(C_opaque_ptr), public :: GLFWcursor_ptr
    end type GLFWcursor_ptr

    public :: &
        !! -- typedef void* (*GLFWallocatefun)(size_t size, void* user)
        ! GLFWallocatefun
        !! -- typedef void* (*GLFWreallocatefun)(void* block, size_t size, void* user)
        ! GLFWreallocatefun, &
        !! -- typedef void (*GLFWdeallocatefun)(void* block, void* user)
        ! GLFWdeallocatefun, &
        ! -- typedef void (*GLFWerrorfun)(int error_code, char description)
        GLFWerrorfun, &
        ! -- typedef void (*GLFWwindowposfun)(GLFWwindow_ptr window, int x, int y)
        GLFWwindowposfun, &
        ! -- typedef void (*GLFWwindowsizefun)(GLFWwindow_ptr window, int x, int y)
        GLFWwindowsizefun, &
        ! -- typedef void (*GLFWwindowclosefun)(GLFWwindow_ptr window);
        GLFWwindowclosefun, &
        ! -- typedef void (*GLFWwindowrefreshfun)(GLFWwindow_ptr window);
        GLFWwindowrefreshfun, &
        ! -- typedef void (*GLFWwindowfocusfun)(GLFWwindow_ptr window, int focused);
        GLFWwindowfocusfun, &
        ! -- typedef void (*GLFWwindowiconifyfun)(GLFWwindow_ptr window, int iconified);
        GLFWwindowiconifyfun, &
        ! -- typedef void (*GLFWwindowmaximizefun)(GLFWwindow_ptr window, int maximized);
        GLFWwindowmaximizefun, &
        ! -- typedef void (*GLFWframebuffersizefun)(GLFWwindow_ptr window, int width, int height);
        GLFWframebuffersizefun, &
        ! -- typedef void (*GLFWwindowcontentscalefun)(GLFWwindow_ptr window, float xscale, float yscale);
        GLFWwindowcontentscalefun, &
        ! -- typedef void (*GLFWmousebuttonfun)(GLFWwindow_ptr window, int button, int action, int mods);
        GLFWmousebuttonfun, &
        ! -- typedef void (*GLFWcursorposfun)(GLFWwindow_ptr window, double xpos, double ypos);
        GLFWcursorposfun, &
        ! -- typedef void (*GLFWcursorenterfun)(GLFWwindow_ptr window, int entered);
        GLFWcursorenterfun, &
        ! -- typedef void (*GLFWscrollfun)(GLFWwindow_ptr window, double xoffset, double yoffset);
        GLFWscrollfun, &
        ! -- typedef void (*GLFWkeyfun)(GLFWwindow_ptr window, int key, int scancode, int action, int mods);
        GLFWkeyfun, &
        ! -- typedef void (*GLFWcharfun)(GLFWwindow_ptr window, unsigned int codepoint);
        GLFWcharfun, &
        ! -- typedef void (*GLFWcharmodsfun)(GLFWwindow_ptr window, unsigned int codepoint, int mods);
        GLFWcharmodsfun, &
        ! -- typedef void (*GLFWdropfun)(GLFWwindow_ptr window, int path_count, const char* paths[]);
        GLFWdropfun, &
        ! -- typedef void (*GLFWmonitorfun)(GLFWmonitor_ptr IN monitor, int IN description)
        GLFWmonitorfun, &
        ! -- typedef void (*GLFWjoystickfun)(int IN jid, int IN event)
        GLFWjoystickfun

    type, bind(C), public :: GLFWvidmode
        integer(kind=c_int) :: width
        integer(kind=c_int) :: height
        integer(kind=c_int) :: redBits
        integer(kind=c_int) :: greenBits
        integer(kind=c_int) :: blueBits
        integer(kind=c_int) :: refreshRate
    end type GLFWvidmode

    ! TODO Those are supposed to be "unsigned short*", leaving it to the user for now...
    !      But should make a wrapper
    type, bind(C), public :: GLFWgammaramp
        type(c_ptr) :: red
        type(c_ptr) :: green
        type(c_ptr) :: blue
        integer(kind=c_int) :: size
    end type GLFWgammaramp

    ! TODO pixels is supposed to be "unsigned char*", maybe make a cleaner wrapper like
    !
    ! type, public :: GLFWimage(width, height)
    !   integer(kind=c_int), len :: width, height
    !   character(kind=c_char), dimension(:), pointer :: pixels
    ! end type GLFWimage
    !
    ! or something
    type, bind(C), public :: GLFWimage
        integer(kind=c_int) :: width
        integer(kind=c_int) :: height
        type(c_ptr) :: pixels
    end type GLFWimage

    type, bind(C), public :: GLFWgamepadstate
        character(kind=c_char), dimension(15) :: buttons ! NOTE Not sur if integer(c_signed_char) would be better
        real(kind=c_float),     dimension(6)  :: axes
    end type GLFWgamepadstate

!    type, public :: GLFWallocator
!        procedure(GLFWallocatefun),   pointer :: allocate_fn
!        procedure(GLFWreallocatefun), pointer :: reallocate_fn
!        procedure(GLFWdeallocatefun), pointer :: deallocate_fn
!        type(c_ptr)                           :: user
!    end type GLFWallocator

    type, bind(C), public :: GLFWallocator
        type(c_funptr) :: allocate_fn   = c_null_funptr
        type(c_funptr) :: reallocate_fn = c_null_funptr
        type(c_funptr) :: deallocate_fn = c_null_funptr
        type(c_ptr)    :: user          = c_null_ptr
    end type GLFWallocator


    ! --------------------------------------------------------------------------
    ! GLF90W API abstract interfaces
    ! --------------------------------------------------------------------------

    ! NOTE For completeness but not sure this is any useful
    abstract interface
        subroutine GLFWglproc()
        end subroutine
    end interface

    abstract interface
        subroutine GLFWvkproc()
        end subroutine
    end interface

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
            use, intrinsic :: iso_c_binding, only: c_int, c_char

            implicit none
            integer(kind=c_int),           intent(in) :: error_code
            character(len=*, kind=c_char), intent(in) :: description
        end subroutine GLFWerrorfun
    end interface

    abstract interface
        subroutine GLFWwindowposfun(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: x, y
        end subroutine GLFWwindowposfun
    end interface

    abstract interface
        subroutine GLFWwindowsizefun(window, width, height)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: width, height
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
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: width, height
        end subroutine GLFWframebuffersizefun
    end interface

    abstract interface
        subroutine GLFWwindowcontentscalefun(window, xscale, yscale)
            use, intrinsic :: iso_c_binding, only: c_float
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_float),   intent(in) :: xscale, yscale
        end subroutine GLFWwindowcontentscalefun
    end interface

    abstract interface
        subroutine GLFWmousebuttonfun(window, button, action, mods)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: button, action, mods
        end subroutine GLFWmousebuttonfun
    end interface

    abstract interface
        subroutine GLFWcursorposfun(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_double
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_double),  intent(in) :: x, y
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
            use, intrinsic :: iso_c_binding, only: c_double
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_double),  intent(in) :: xoffset, yoffset
        end subroutine GLFWscrollfun
    end interface

    abstract interface
        subroutine GLFWkeyfun(window, key, scancode, action, mods)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: key, scancode, action, mods
        end subroutine GLFWkeyfun
    end interface

    abstract interface
        subroutine GLFWcharfun(window, codepoint)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: codepoint ! NOTE This is supposed to be unsigned int
        end subroutine GLFWcharfun
    end interface

    abstract interface
        subroutine GLFWcharmodsfun(window, codepoint, mods)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: codepoint ! NOTE This is supposed to be unsigned int
            integer(kind=c_int),  intent(in) :: mods
        end subroutine GLFWcharmodsfun
    end interface

    abstract interface
        subroutine GLFWdropfun(window, paths)
            import :: GLFWwindow_ptr

            implicit none
            type(GLFWwindow_ptr),                    intent(in) :: window
            character(len=:), dimension(:), pointer, intent(in) :: paths
        end subroutine GLFWdropfun
    end interface

    abstract interface
        subroutine GLFWmonitorfun(monitor, event)
            use, intrinsic :: iso_c_binding, only: c_int
            import :: GLFWmonitor_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            integer(kind=c_int),   intent(in) :: event
        end subroutine GLFWmonitorfun
    end interface

    abstract interface
        subroutine GLFWjoystickfun(jid, event)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            integer(kind=c_int), intent(in) :: event
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
        ! -- void glfwInitAllocator(GLFWallocator IN allocator)
        glfwInitAllocator, &
        ! TODO Vulkan support
        !! -- void glfwInitVulkanLoader(PFN_vkGetInstanceProcAddr IN loader)
        ! glfwInitVulkanLoader, &
        ! -- void glfwGetVersion(int OUT major, int OUT minor, int OUT rev)
        glfwGetVersion, &
        ! -- char POINTER glfwGetVersionString() result(str)
        glfwGetVersionString, &
        ! -- int glfwGetError(char OPTIONAL POINTER OUT description) result(error_code)
        glfwGetError, &
        ! -- GLFWerrorfun POINTER glfwSetErrorCallback(GLFWerrorfun OPTIONAL IN callback) result(prev_callback)
        glfwSetErrorCallback, &
        ! -- int glfwGetPlatform() result(platform)
        glfwGetPlatform, &
        ! -- logical glfwPlatformSupported(int IN platform) result(supported)
        glfwPlatformSupported, &
        ! -- GLFWmonitor_ptr(:) glfwGetMonitors() result(monitors)
        glfwGetMonitors, &
        ! -- GLFWmonitor_ptr glfwGetPrimaryMonitor() result(monitor)
        glfwGetPrimaryMonitor, &
        ! -- void glfwGetMonitorPos(GLFWmonitor_ptr IN monitor, int OPTIONAL OUT x, int OPTIONAL OUT y)
        glfwGetMonitorPos, &
        ! -- void glfwGetMonitorWorkarea(GLFWmonitor_ptr IN monitor, int OPTIONAL OUT x, int OPTIONAL OUT y,
        !                                                            int OPTIONAL OUT w, int OPTIONAL OUT h)
        glfwGetMonitorWorkarea, &
        ! -- void glfwGetMonitorPhysicalSize(GLFWmonitor_ptr IN monitor, int OPTIONAL OUT widthMM,
        !                                                                int OPTIONAL OUT heightMM)
        glfwGetMonitorPhysicalSize, &
        ! -- void glfwGetMonitorContentScale(GLFWmonitor_ptr IN monitor, float OPTIONAL OUT xscale,
        !                                                                float OPTIONAL OUT yscale)
        glfwGetMonitorContentScale, &
        ! -- char POINTER glfwGetMonitorName(GLFWmonitor_ptr IN monitor) result(name)
        glfwGetMonitorName, &
        ! -- void glfwSetMonitorUserPointer(GLFWmonitor_ptr IN monitor, type(c_ptr) IN user_pointer)
        glfwSetMonitorUserPointer, &
        ! -- type(c_ptr) glfwGetMonitorUserPointer(GLFWmonitor_ptr IN monitor) result(user_pointer)
        glfwGetMonitorUserPointer, &
        ! -- GLFWmonitorfun POINTER glfwSetMonitorCallback(GLFWmonitorfun OPTIONAL IN callback) result(prev_callback)
        glfwSetMonitorCallback, &
        ! -- GLFWvidmode(:) POINTER glfwGetVideoModes(GLFWmonitor_ptr IN monitor) result(vidmodes)
        glfwGetVideoModes, &
        ! -- GLFWvidmode POINTER glfwGetVideoMode(GLFWmonitor_ptr IN monitor) result(vidmode)
        glfwGetVideoMode, &
        ! -- void glfwSetGamma(GLFWmonitor_ptr IN monitor, real IN gamma)
        glfwSetGamma, &
        ! -- GLFWgammaramp POINTER glfwGetGammaRamp(GLFWmonitor_ptr IN monitor) result(gammaramp)
        glfwGetGammaRamp, &
        ! -- void glfwSetGammaRamp(GLFWmonitor_ptr IN monitor, GLFWgammaramp POINTER IN gammaramp)
        glfwSetGammaRamp, &
        ! -- void glfwDefaultWindowHints(void)
        glfwDefaultWindowHints, &
        ! -- void glfwWindowHint(int IN hint, int IN value)
        glfwWindowHint, &
        ! -- void glfwWindowHintString(int IN hint, char IN value)
        glfwWindowHintString, &
        ! -- GLFWwindow_ptr glfwCreateWindow(int IN width, int IN height, char IN title,
        !                                    GLFWmonitor_ptr OPTIONAL IN monitor, GLFWwindow_ptr OPTIONAL IN share) result(window)
        glfwCreateWindow, &
        ! -- void glfwDestroyWindow(GLFWwindow_ptr IN window)
        glfwDestroyWindow, &
        ! -- logical glfwWindowShouldClose(GLFWwindow_ptr IN window) result(closeflag)
        glfwWindowShouldClose, &
        ! -- void glfwSetWindowShouldClose(GLFWwindow_ptr IN window, logical IN val)
        glfwSetWindowShouldClose, &
        ! -- char POINTER glfwGetWindowTitle(GLFWwindow_ptr IN window) result(title)
        glfwGetWindowTitle, &
        ! -- void glfwSetWindowTitle(GLFWwindow_ptr IN window, char IN title)
        glfwSetWindowTitle, &
        ! -- void glfwSetWindowIcon(GLFWwindow_ptr IN window, GLFWimage(:) IN images)
        glfwSetWindowIcon, &
        ! -- void glfwGetWindowPos(GLFWwindow_ptr IN window, int OPTIONAL OUT x, int OPTIONAL OUT y)
        glfwGetWindowPos, &
        ! -- void glfwSetWindowPos(GLFWwindow_ptr IN window, int IN x, int IN y)
        glfwSetWindowPos, &
        ! -- void glfwGetWindowSize(GLFWwindow_ptr IN window, int OPTIONAL OUT width, int OPTIONAL OUT height)
        glfwGetWindowSize, &
        ! -- void glfwSetWindowSizeLimits(GLFWwindow_ptr IN window, int IN minwidth, int IN minheight,
        !                                                           int IN maxwidth, int IN maxheight)
        glfwSetWindowSizeLimits, &
        ! -- void glfwSetWindowAspectRatio(GLFWwindow_ptr IN window, int IN numer, int IN denom)
        glfwSetWindowAspectRatio, &
        ! -- void glfwSetWindowSize(GLFWwindow_ptr IN window, int IN width, int IN height)
        glfwSetWindowSize, &
        ! -- void glfwGetFramebufferSize(GLFWwindow_ptr IN window, int OPTIONAL OUT width, int OPTIONAL OUT height)
        glfwGetFramebufferSize, &
        ! -- void glfwGetWindowFrameSize(GLFWwindow_ptr IN window, int OPTIONAL OUT left, int OPTIONAL OUT top,
        !                                                          int OPTIONAL OUT right, int OPTIONAL OUT bottom)
        glfwGetWindowFrameSize, &
        ! -- void glfwGetWindowContentScale(GLFWwindow_ptr IN window, int OPTIONAL OUT xscale, int OPTIONAL OUT yscale)
        glfwGetWindowContentScale, &
        ! -- float glfwGetWindowOpacity(GLFWwindow_ptr IN window) result(opacity)
        glfwGetWindowOpacity, &
        ! -- void glfwSetWindowOpacity(GLFWwindow_ptr IN window, float IN opacity)
        glfwSetWindowOpacity, &
        ! -- void glfwIconifyWindow(GLFWwindow_ptr IN window)
        glfwIconifyWindow, &
        ! -- void glfwRestoreWindow(GLFWwindow_ptr IN window)
        glfwRestoreWindow, &
        ! -- void glfwMaximizeWindow(GLFWwindow_ptr IN window)
        glfwMaximizeWindow, &
        ! -- void glfwShowWindow(GLFWwindow_ptr IN window)
        glfwShowWindow, &
        ! -- void glfwHideWindow(GLFWwindow_ptr IN window)
        glfwHideWindow, &
        ! -- void glfwFocusWindow(GLFWwindow_ptr IN window)
        glfwFocusWindow, &
        ! -- void glfwRequestWindowAttention(GLFWwindow_ptr IN window)
        glfwRequestWindowAttention, &
        ! -- GLFWmonitor_ptr glfwGetWindowMonitor(GLFWwindow_ptr IN window) result(monitor)
        glfwGetWindowMonitor, &
        ! -- void glfwSetWindowMonitor(GLFWwindow_ptr IN window, GLFWmonitor_ptr OPTIONAL IN monitor,
        !                              int IN x, int IN y, int IN width, int IN height, int IN refresh_rate)
        glfwSetWindowMonitor, &
        ! -- int glfwGetWindowAttrib(GLFWwindow_ptr IN window, int IN attrib) result(val)
        glfwGetWindowAttrib, &
        ! -- void glfwSetWindowAttrib(GLFWwindow_ptr IN window, int IN attrib, int IN val)
        glfwSetWindowAttrib, &
        ! -- void glfwSetWindowUserPointer(GLFWwindow_ptr IN window, void* IN user_pointer)
        glfwSetWindowUserPointer, &
        ! -- void* glfwGetWindowUserPointer(GLFWwindow_ptr IN window) result(user_pointer)
        glfwGetWindowUserPointer, &
        ! -- GLFWwindowposfun POINTER glfwSetWindowPosCallback(GLFWwindow_ptr IN window,
        !                   GLFWwindowposfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowPosCallback, &
        ! -- GLFWwindowsizefun POINTER glfwSetWindowSizeCallback(GLFWwindow_ptr IN window, 
        !                    GLFWwindowsizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowSizeCallback, &
        ! -- GLFWwindowclosefun POINTER glfwSetWindowCloseCallback(GLFWwindow_ptr IN window,
        !                     GLFWwindowclosefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowCloseCallback, &
        ! -- GLFWwindowrefreshfun POINTER glfwSetWindowRefreshCallback(GLFWwindow_ptr IN window,
        !                       GLFWwindowrefreshfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowRefreshCallback, &
        ! -- GLFWwindowfocusfun POINTER glfwSetWindowFocusCallback(GLFWwindow_ptr IN window,
        !                       GLFWwindowfocusfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowFocusCallback, &
        ! -- GLFWwindowiconifyfun POINTER glfwSetWindowIconifyCallback(GLFWwindow_ptr IN window,
        !                       GLFWwindowiconifyfun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowIconifyCallback, &
        ! -- GLFWwindowmaximizefun POINTER glfwSetWindowMaximizeCallback(GLFWwindow_ptr IN window,
        !                        GLFWwindowmaximizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowMaximizeCallback, &
        ! -- GLFWframebuffersizefun POINTER glfwSetFramebufferSizeCallback(GLFWwindow_ptr IN window,
        !                         GLFWframebuffersizefun OPTIONAL IN callback) result(prev_callback)
        glfwSetFramebufferSizeCallback, &
        ! -- GLFWwindowcontentscalefun POINTER glfwSetWindowContentScaleCallback(GLFWwindow_ptr IN window,
        !                            GLFWwindowcontentscalefun OPTIONAL IN callback) result(prev_callback)
        glfwSetWindowContentScaleCallback, &
        ! -- void glfwPollEvents()
        glfwPollEvents, &
        ! -- void glfwWaitEvents()
        glfwWaitEvents, &
        ! -- void glfwWaitEventsTimeout(double IN timeout)
        glfwWaitEventsTimeout, &
        ! -- void glfwPostEmptyEvent()
        glfwPostEmptyEvent, &
        ! -- int glfwGetInputMode(GLFWwindow_ptr IN window, int IN mode) result(val)
        glfwGetInputMode, &
        ! -- void glfwSetInputMode(GLFWwindow_ptr IN window, int IN mode, int IN val)
        glfwSetInputMode, &
        ! -- logical glfwRawMouseMotionSupported() result(supported)
        glfwRawMouseMotionSupported, &
        ! -- char POINTER glfwGetKeyName(int IN key, int IN scancode) result(name)
        glfwGetKeyName, &
        ! -- int glfwGetKeyScancode(int IN key) result(scancode)
        glfwGetKeyScancode, &
        ! -- int glfwGetKey(GLFWwindow_ptr IN window, int IN key) result(status)
        glfwGetKey, &
        ! -- int glfwGetMouseButton(GLFWwindow_ptr IN window, int IN button) result(status)
        glfwGetMouseButton, &
        ! -- void glfwGetCursorPos(GLFWwindow_ptr IN window, double OPTIONAL OUT x, double OPTIONAL OUT y)
        glfwGetCursorPos, &
        ! -- void glfwSetCursorPos(GLFWwindow_ptr IN window, double IN x, double IN y)
        glfwSetCursorPos, &
        ! -- GLFWcursor_ptr glfwCreateCursor(GLFWimage IN image, int IN xhot, int IN yhot) result(cursor)
        glfwCreateCursor, &
        ! -- GLFWcursor_ptr glfwCreateStandardCursor(int IN shape) result(cursor)
        glfwCreateStandardCursor, &
        ! -- void glfwDestroyCursor(GLFWcursor_ptr IN cursor)
        glfwDestroyCursor, &
        ! -- void glfwSetCursor(GLFWwindow_ptr IN window, GLFWcursor_ptr IN cursor)
        glfwSetCursor, &
        ! -- GLFWkeyfun POINTER glfwSetKeyCallback(GLFWwindow_ptr IN window,
        !                                          GLFWkeyfun OPTIONAL IN callback) result(prev_callback)
        glfwSetKeyCallback, &
        ! -- GLFWcharfun POINTER glfwSetCharCallback(GLFWwindow_ptr IN window,
        !                                            GLFWcharfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCharCallback, &
        ! -- GLFWcharmodsfun POINTER glfwSetCharModsCallback(GLFWwindow_ptr IN window,
        !                                                    GLFWcharmodsfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCharModsCallback, &
        ! -- GLFWmousebuttonfun POINTER glfwSetMouseButtonCallback(GLFWwindow_ptr IN window,
        !                                                          GLFWmousebuttonfun OPTIONAL IN callback) result(prev_callback)
        glfwSetMouseButtonCallback, &
        ! -- GLFWcursorposfun POINTER glfwSetCursorPosCallback(GLFWwindow_ptr IN window,
        !                                                      GLFWcursorposfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCursorPosCallback, &
        ! -- GLFWcursorenterfun POINTER glfwSetCursorEnterCallback(GLFWwindow_ptr IN window,
        !                                                          GLFWcursorenterfun OPTIONAL IN callback) result(prev_callback)
        glfwSetCursorEnterCallback, &
        ! -- GLFWscrollfun POINTER glfwSetScrollCallback(GLFWwindow_ptr IN window,
        !                                                GLFWscrollfun OPTIONAL IN callback) result(prev_callback)
        glfwSetScrollCallback, &
        ! -- GLFWdropfun POINTER glfwSetDropCallback(GLFWwindow_ptr IN window,
        !                                            GLFWdropfun OPTIONAL IN callback) result(prev_callback)
        glfwSetDropCallback, &
        ! -- logical glfwJoystickPresent(int IN jid) result(is_present)
        glfwJoystickPresent, &
        ! -- real(:) glfwGetJoystickAxes(int IN jid) result(axes)
        ! Note: The "count" parameter from the original function can be obtained from size(axes) instead
        !       size(axes) = 0 if joystick is not present (axes == NULL from C side)
        glfwGetJoystickAxes, &
        ! -- char(:) glfwGetJoystickButtons(int IN jid) result(states)
        glfwGetJoystickButtons, &
        ! -- char(:) glfwGetJoystickHats(int IN jid) result(states)
        glfwGetJoystickHats, &
        ! -- char POINTER glfwGetJoystickName(int IN jid) result(name)
        glfwGetJoystickName, &
        ! -- char POINTER glfwGetJoystickGUID(int IN jid) result(GUID)
        glfwGetJoystickGUID, &
        ! -- void glfwSetJoystickUserPointer(int IN jid, void* IN user_pointer)
        glfwSetJoystickUserPointer, &
        ! -- void* glfwGetJoystickUserPointer(int IN jid) result(user_pointer)
        glfwGetJoystickUserPointer, &
        ! -- logical glfwJoystickIsGamepad(int IN jid) result(is_gamepad)
        glfwJoystickIsGamepad, &
        ! -- GLFWjoystickfun POINTER glfwSetJoystickCallback(GLFWjoystickfun OPTIONAL IN callback) result(prev_callback)
        glfwSetJoystickCallback, &
        ! -- logical glfwJoystickIsGamepad(char IN mappings) result(success)
        glfwUpdateGamepadMappings, &
        ! -- char POINTER glfwGetGamepadName(int IN jid) result(name)
        glfwGetGamepadName, &
        ! -- logical glfwGetGamepadState(int IN jid, GLFWgamepadstate OUT state) result(success)
        glfwGetGamepadState, &
        ! -- void glfwSetClipboardString(GLFWwindow_ptr IN window, char IN string)
        glfwSetClipboardString, &
        ! -- char glfwSetClipboardString(GLFWwindow_ptr IN window) result(string)
        glfwGetClipboardString, &
        ! -- double glfwGetTime() result(time)
        glfwGetTime, &
        ! -- void glfwSetTime(double IN time)
        glfwSetTime, &
        ! -- long glfwGetTimerValue() result(value)
        glfwGetTimerValue, &
        ! -- long glfwGetTimerFrequency() result(frequency)
        glfwGetTimerFrequency, &
        ! -- void glfwMakeContextCurrent(GLFWwindow_ptr IN window)
        glfwMakeContextCurrent, &
        ! -- GLFWwindow_ptr glfwGetCurrentContext() result(window)
        glfwGetCurrentContext, &
        ! -- void glfwSwapBuffers(GLFWwindow_ptr IN window)
        glfwSwapBuffers, &
        ! -- void glfwSwapInterval(int IN interval)
        glfwSwapInterval, &
        ! -- logical glfwExtensionSupported(char IN extension) result(supported)
        glfwExtensionSupported, &
        ! -- GLFWglproc glfwGetProcAddress(char IN procname) result(procaddr)
        glfwGetProcAddress, &
        ! -- logical glfwVulkanSupported() result(supported)
        glfwVulkanSupported, &
        ! -- string_ptr(:) glfwGetRequiredInstanceExtensions(void) result(names)
        glfwGetRequiredInstanceExtensions
        ! TODO Vulkan support
        ! GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname);
        ! int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
        ! VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);



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
        subroutine glfwInitHint(hint, val) bind(C, name="glfwInitHint")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: hint
            integer(kind=c_int), value, intent(in) :: val
        end subroutine glfwInitHint
    end interface

    interface
        subroutine glfwInitAllocator(allocator) bind(C, name="glfwInitAllocator")
            import :: GLFWallocator

            implicit none
            type(GLFWallocator), intent(in) :: allocator
        end subroutine glfwInitAllocator
    end interface

    ! TODO Vulkan support
    ! void glfwInitVulkanLoader(PFN_vkGetInstanceProcAddr loader);

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
            type(c_ptr), value,  intent(in)  :: monitor
            integer(kind=c_int), intent(out) :: x, y
        end subroutine c_glfwGetMonitorPos
    end interface

    interface
        subroutine c_glfwGetMonitorWorkarea(monitor, x, y, w, h) bind(C, name="glfwGetMonitorWorkarea")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: monitor
            integer(kind=c_int), intent(out) :: x, y, w, h
        end subroutine c_glfwGetMonitorWorkarea
    end interface

    interface
        subroutine c_glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM) bind(C, name="glfwGetMonitorPhysicalSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: monitor
            integer(kind=c_int), intent(out) :: widthMM, heightMM
        end subroutine c_glfwGetMonitorPhysicalSize
    end interface

    interface
        subroutine c_glfwGetMonitorContentScale(monitor, xscale, yscale) bind(C, name="glfwGetMonitorContentScale")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr), value, intent(in)  :: monitor
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
        function c_glfwGetVideoModes(monitor, count) result(vidmodes) bind(C, name="glfwGetVideoModes")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            integer(kind=c_int)            :: count
            type(c_ptr)                    :: vidmodes
        end function c_glfwGetVideoModes
    end interface

    interface
        function c_glfwGetVideoMode(monitor) result(vidmode) bind(C, name="glfwGetVideoMode")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: vidmode
        end function c_glfwGetVideoMode
    end interface

    interface
        subroutine c_glfwSetGamma(monitor, gamma) bind(C, name="glfwSetGamma")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr),        value, intent(in) :: monitor
            real(kind=c_float), value, intent(in) :: gamma
        end subroutine c_glfwSetGamma
    end interface

    interface
        function c_glfwGetGammaRamp(monitor) result(gammaramp) bind(C, name="glfwGetGammaRamp")
            use, intrinsic :: iso_c_binding, only: c_ptr

            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr)                    :: gammaramp
        end function c_glfwGetGammaRamp
    end interface

    interface
        subroutine c_glfwSetGammaRamp(monitor, gammaramp) bind(C, name="glfwSetGammaRamp")
            use, intrinsic :: iso_c_binding, only: c_ptr

            type(c_ptr), value, intent(in) :: monitor
            type(c_ptr), value, intent(in) :: gammaramp
        end subroutine c_glfwSetGammaRamp
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
        subroutine c_glfwWindowHintString(hint, val) bind(C, name="glfwWindowHintString")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int), value,                  intent(in) :: hint
            character(len=1, kind=c_char), dimension(*), intent(in) :: val
        end subroutine c_glfwWindowHintString
    end interface

    interface
        function c_glfwCreateWindow(width, height, title, monitor, share) result(window) bind(C, name="glfwCreateWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int, c_char

            implicit none
            integer(kind=c_int), value,                  intent(in) :: width, height
            character(len=1, kind=c_char), dimension(*), intent(in) :: title
            type(c_ptr), value,                          intent(in) :: monitor
            type(c_ptr), value,                          intent(in) :: share
            type(c_ptr)                                             :: window
        end function c_glfwCreateWindow
    end interface

    interface
        subroutine c_glfwDestroyWindow(window) bind(C, name="glfwDestroyWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwDestroyWindow
    end interface

    interface
        function c_glfwWindowShouldClose(window) result(closeflag) bind(C, name="glfwWindowShouldClose")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value, intent(in) :: window
            integer(kind=c_int)            :: closeflag
        end function c_glfwWindowShouldClose
    end interface

    interface
        subroutine c_glfwSetWindowShouldClose(window, val) bind(C, name="glfwSetWindowShouldClose")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetWindowShouldClose
    end interface

    interface
        function c_glfwGetWindowTitle(window) result(title) bind(C, name="glfwGetWindowTitle")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: title
        end function c_glfwGetWindowTitle
    end interface

    interface
        subroutine c_glfwSetWindowTitle(window, title) bind(C, name="glfwSetWindowTitle")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char

            implicit none
            type(c_ptr), value,                          intent(in) :: window
            character(len=1, kind=c_char), dimension(*), intent(in) :: title
        end subroutine c_glfwSetWindowTitle
    end interface

    interface
        subroutine c_glfwSetWindowIcon(window, count, images) bind(C, name="glfwSetWindowIcon")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: count
            type(c_ptr),         value, intent(in) :: images
        end subroutine c_glfwSetWindowIcon
    end interface

    interface
        subroutine c_glfwGetWindowPos(window, x, y) bind(C, name="glfwGetWindowPos")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            integer(kind=c_int), intent(out) :: x, y
        end subroutine c_glfwGetWindowPos
    end interface

    interface
        subroutine c_glfwSetWindowPos(window, x, y) bind(C, name="glfwSetWindowPos")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: x, y
        end subroutine c_glfwSetWindowPos
    end interface

    interface
        subroutine c_glfwGetWindowSize(window, width, height) bind(C, name="glfwGetWindowSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            integer(kind=c_int), intent(out) :: width, height
        end subroutine c_glfwGetWindowSize
    end interface

    interface
        subroutine c_glfwSetWindowSizeLimits(window, minw, minh, maxw, maxh) bind(C, name="glfwSetWindowSizeLimits")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: minw, minh, maxw, maxh
        end subroutine c_glfwSetWindowSizeLimits
    end interface

    interface
        subroutine c_glfwSetWindowAspectRatio(window, numer, denom) bind(C, name="glfwSetWindowAspectRatio")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: numer, denom
        end subroutine c_glfwSetWindowAspectRatio
    end interface

    interface
        subroutine c_glfwSetWindowSize(window, width, height) bind(C, name="glfwSetWindowSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height
        end subroutine c_glfwSetWindowSize
    end interface

    interface
        subroutine c_glfwGetFramebufferSize(window, width, height) bind(C, name="glfwGetFramebufferSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            integer(kind=c_int), intent(out) :: width, height
        end subroutine c_glfwGetFramebufferSize
    end interface

    interface
        subroutine c_glfwGetWindowFrameSize(window, left, top, right, bottom) bind(C, name="glfwGetWindowFrameSize")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            integer(kind=c_int), intent(out) :: left, top, right, bottom
        end subroutine c_glfwGetWindowFrameSize
    end interface

    interface
        subroutine c_glfwGetWindowContentScale(window, xscale, yscale) bind(C, name="glfwGetWindowContentScale")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            real(kind=c_float),  intent(out) :: xscale, yscale
        end subroutine c_glfwGetWindowContentScale
    end interface

    interface
        function c_glfwGetWindowOpacity(window) result(opacity) bind(C, name="glfwGetWindowOpacity")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr), value, intent(in) :: window
            real(kind=c_float)             :: opacity
        end function c_glfwGetWindowOpacity
    end interface

    interface
        subroutine c_glfwSetWindowOpacity(window, opacity) bind(C, name="glfwSetWindowOpacity")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr),        value, intent(in) :: window
            real(kind=c_float), value, intent(in) :: opacity
        end subroutine c_glfwSetWindowOpacity
    end interface

    interface
        subroutine c_glfwIconifyWindow(window) bind(C, name="glfwIconifyWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwIconifyWindow
    end interface

    interface
        subroutine c_glfwRestoreWindow(window) bind(C, name="glfwRestoreWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwRestoreWindow
    end interface

    interface
        subroutine c_glfwMaximizeWindow(window) bind(C, name="glfwMaximizeWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwMaximizeWindow
    end interface

    interface
        subroutine c_glfwShowWindow(window) bind(C, name="glfwShowWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwShowWindow
    end interface

    interface
        subroutine c_glfwHideWindow(window) bind(C, name="glfwHideWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwHideWindow
    end interface

    interface
        subroutine c_glfwFocusWindow(window) bind(C, name="glfwFocusWindow")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwFocusWindow
    end interface

    interface
        subroutine c_glfwRequestWindowAttention(window) bind(C, name="glfwRequestWindowAttention")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwRequestWindowAttention
    end interface

    interface
        function c_glfwGetWindowMonitor(window) result(monitor) bind(C, name="glfwGetWindowMonitor")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: monitor
        end function c_glfwGetWindowMonitor
    end interface

    interface
        subroutine c_glfwSetWindowMonitor(window, monitor, x, y, w, h, refresh_rate) bind(C, name="glfwSetWindowMonitor")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            type(c_ptr),         value, intent(in) :: monitor
            integer(kind=c_int), value, intent(in) :: x, y, w, h, refresh_rate
        end subroutine c_glfwSetWindowMonitor
    end interface

    interface
        function c_glfwGetWindowAttrib(window, attrib) result(val) bind(C, name="glfwGetWindowAttrib")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: attrib
            integer(kind=c_int)                    :: val
        end function c_glfwGetWindowAttrib
    end interface

    interface
        subroutine c_glfwSetWindowAttrib(window, attrib, val) bind(C, name="glfwSetWindowAttrib")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: attrib
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetWindowAttrib
    end interface

    interface
        subroutine c_glfwSetWindowUserPointer(window, user_pointer) bind(C, name="glfwSetWindowUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr), value, intent(in) :: user_pointer
        end subroutine c_glfwSetWindowUserPointer
    end interface

    interface
        function c_glfwGetWindowUserPointer(window) result(user_pointer) bind(C, name="glfwGetWindowUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: user_pointer
        end function c_glfwGetWindowUserPointer
    end interface

    interface
        function c_glfwSetWindowPosCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowPosCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowPosCallback
    end interface

    interface
        function c_glfwSetWindowSizeCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowSizeCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowSizeCallback
    end interface

    interface
        function c_glfwSetWindowCloseCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowCloseCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowCloseCallback
    end interface

    interface
        function c_glfwSetWindowRefreshCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowRefreshCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowRefreshCallback
    end interface

    interface
        function c_glfwSetWindowFocusCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowFocusCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowFocusCallback
    end interface

    interface
        function c_glfwSetWindowIconifyCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowIconifyCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowIconifyCallback
    end interface

    interface
        function c_glfwSetWindowMaximizeCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowMaximizeCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowMaximizeCallback
    end interface

    interface
        function c_glfwSetFramebufferSizeCallback(window, callback) result(prev_callback) bind(C, name="glfwSetFramebufferSizeCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetFramebufferSizeCallback
    end interface

    interface
        function c_glfwSetWindowContentScaleCallback(window, callback) result(prev_callback) bind(C, name="glfwSetWindowContentScaleCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetWindowContentScaleCallback
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
        function c_glfwGetInputMode(window, mode) result(val) bind(C, name="glfwGetInputMode")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: mode
            integer(kind=c_int)                    :: val
        end function c_glfwGetInputMode
    end interface

    interface
        subroutine c_glfwSetInputMode(window, mode, val) bind(C, name="glfwSetInputMode")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: mode
            integer(kind=c_int), value, intent(in) :: val
        end subroutine c_glfwSetInputMode
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
        function c_glfwGetKey(window, key) result(status) bind(C, name="glfwGetKey")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: key
            integer(kind=c_int)                    :: status
        end function c_glfwGetKey
    end interface

    interface
        function c_glfwGetMouseButton(window, button) result(status) bind(C, name="glfwGetMouseButton")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: button
            integer(kind=c_int)                    :: status
        end function c_glfwGetMouseButton
    end interface

    interface
        subroutine c_glfwGetCursorPos(window, x, y) bind(C, name="glfwGetCursorPos")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double

            implicit none
            type(c_ptr), value,  intent(in)  :: window
            real(kind=c_double), intent(out) :: x, y
        end subroutine c_glfwGetCursorPos
    end interface

    interface
        subroutine c_glfwSetCursorPos(window, x, y) bind(C, name="glfwSetCursorPos")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double

            implicit none
            type(c_ptr),         value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: x, y
        end subroutine c_glfwSetCursorPos
    end interface

    interface
        function c_glfwCreateCursor(image, xhot, yhot) result(cursor) bind(C, name="glfwCreateCursor")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: image
            integer(kind=c_int), value, intent(in) :: xhot, yhot
            type(c_ptr)                            :: cursor
        end function c_glfwCreateCursor
    end interface

    interface
        function c_glfwCreateStandardCursor(cursor_shape) result(cursor) bind(C, name="glfwCreateStandardCursor")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: cursor_shape
            type(c_ptr)                            :: cursor
        end function c_glfwCreateStandardCursor
    end interface

    interface
        subroutine c_glfwDestroyCursor(cursor) bind(C, name="glfwDestroyCursor")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: cursor
        end subroutine c_glfwDestroyCursor
    end interface

    interface
        subroutine c_glfwSetCursor(window, cursor) bind(C, name="glfwSetCursor")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr), value, intent(in) :: cursor
        end subroutine c_glfwSetCursor
    end interface

    interface
        function c_glfwSetKeyCallback(window, callback) result(prev_callback) bind(C, name="glfwSetKeyCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetKeyCallback
    end interface

    interface
        function c_glfwSetCharCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCharCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCharCallback
    end interface

    interface
        function c_glfwSetCharModsCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCharModsCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCharModsCallback
    end interface

    interface
        function c_glfwSetMouseButtonCallback(window, callback) result(prev_callback) bind(C, name="glfwSetMouseButtonCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetMouseButtonCallback
    end interface

    interface
        function c_glfwSetCursorPosCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCursorPosCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCursorPosCallback
    end interface

    interface
        function c_glfwSetCursorEnterCallback(window, callback) result(prev_callback) bind(C, name="glfwSetCursorEnterCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetCursorEnterCallback
    end interface

    interface
        function c_glfwSetScrollCallback(window, callback) result(prev_callback) bind(C, name="glfwSetScrollCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetScrollCallback
    end interface

    interface
        function c_glfwSetDropCallback(window, callback) result(prev_callback) bind(C, name="glfwSetDropCallback")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_funptr

            implicit none
            type(c_ptr),    value, intent(in) :: window
            type(c_funptr), value, intent(in) :: callback
            type(c_funptr)                    :: prev_callback
        end function c_glfwSetDropCallback
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
        function c_glfwGetJoystickButtons(jid, count) result(states) bind(C, name="glfwGetJoystickButtons")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: states
        end function c_glfwGetJoystickButtons
    end interface

    interface
        function c_glfwGetJoystickHats(jid, count) result(states) bind(C, name="glfwGetJoystickHats")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int)                    :: count
            type(c_ptr)                            :: states
        end function c_glfwGetJoystickHats
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
        subroutine glfwSetJoystickUserPointer(jid, user_pointer) bind(C, name="glfwSetJoystickUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr),         value, intent(in) :: user_pointer
        end subroutine glfwSetJoystickUserPointer
    end interface

    interface
        function glfwGetJoystickUserPointer(jid) result(user_pointer) bind(C, name="glfwGetJoystickUserPointer")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(c_ptr)                            :: user_pointer
        end function glfwGetJoystickUserPointer
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
        function c_glfwGetGamepadState(jid, state) result(success) bind(C, name="glfwGetGamepadState")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int
            import GLFWgamepadstate

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            type(GLFWgamepadstate)                 :: state
            integer(kind=c_int)                    :: success
        end function c_glfwGetGamepadState
    end interface

    interface
        subroutine c_glfwSetClipboardString(window, string) bind(C, name="glfwSetClipboardString")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char

            implicit none
            type(c_ptr), value,                          intent(in) :: window
            character(len=1, kind=c_char), dimension(*), intent(in) :: string
        end subroutine c_glfwSetClipboardString
    end interface

    interface
        function c_glfwGetClipboardString(window) result(string) bind(C, name="glfwGetClipboardString")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
            type(c_ptr)                    :: string
        end function c_glfwGetClipboardString
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
        subroutine c_glfwMakeContextCurrent(window) bind(C, name="glfwMakeContextCurrent")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwMakeContextCurrent
    end interface

    interface
        function c_glfwGetCurrentContext() result(window) bind(C, name="glfwGetCurrentContext")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr) :: window
        end function c_glfwGetCurrentContext
    end interface

    interface
        subroutine c_glfwSwapBuffers(window) bind(C, name="glfwSwapBuffers")
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(c_ptr), value, intent(in) :: window
        end subroutine c_glfwSwapBuffers
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
        function c_glfwGetProcAddress(procname) result(procaddr) bind(C, name="glfwGetProcAddress")
            use, intrinsic :: iso_c_binding, only: c_funptr, c_char

            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: procname
            type(c_funptr)                                          :: procaddr
        end function c_glfwGetProcAddress
    end interface

    interface
        function c_glfwVulkanSupported() result(supported) bind(C, name="glfwVulkanSupported")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwVulkanSupported
    end interface

    interface
        function c_glfwGetRequiredInstanceExtensions(count) result(names) bind(C, name="glfwGetRequiredInstanceExtensions")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int32_t

            implicit none
            integer(kind=c_int32_t) :: count
            type(c_ptr)             :: names
        end function c_glfwGetRequiredInstanceExtensions
    end interface

    ! TODO Vulkan support
    ! GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname);
    ! int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
    ! VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);



    ! --------------------------------------------------------------------------
    ! GLF90W C-interoperability function interfaces
    ! --------------------------------------------------------------------------


    interface c_strlen
        pure function c_ptr_strlen(cstr) result(length) bind(C, name="strlen")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
            implicit none
            type(c_ptr), intent(in) :: cstr
            integer(kind=c_size_t)  :: length
        end function c_ptr_strlen

        pure function c_char_strlen(cstr) result(length) bind(C, name="strlen")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_size_t
            implicit none
            character(len=1, kind=c_char), dimension(*), intent(in) :: cstr
            integer(kind=c_size_t)  :: length
        end function c_char_strlen
    end interface c_strlen

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

            success = merge(.false., .true., c_glfwInit() == GLFW_FALSE)
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
            character(len=:, kind=c_char), pointer :: str

            type(c_ptr) :: c_str

            c_str = c_glfwGetVersionString()
            call c_f_strpointer(c_str, str)
        end function glfwGetVersionString

        function glfwGetError(description) result(error_code)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_int, c_char

            implicit none
            character(len=:, kind=c_char), pointer, optional :: description
            integer(kind=c_int)                              :: error_code

            type(c_ptr) :: c_desc

            error_code = c_glfwGetError(c_desc)
            if (present(description)) then
                if (c_associated(c_desc)) then
                    call c_f_strpointer(c_desc, description)
                else
                    description => null()
                end if
            end if
        end function glfwGetError

        function glfwSetErrorCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            procedure(GLFWerrorfun), optional :: callback
            procedure(GLFWerrorfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wErrorCallback
            if (present(callback)) then
                res = c_glfwSetErrorCallback(c_funloc(glf90wErrorWrapper))
                glf90wErrorCallback => callback
            else
                res = c_glfwSetErrorCallback(c_null_funptr)
                glf90wErrorCallback => null()
            end if
        end function glfwSetErrorCallback

        function glfwPlatformSupported(platform) result(supported)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: platform
            logical                         :: supported

            supported = merge(.false., .true., c_glfwPlatformSupported(platform) == GLFW_FALSE)
        end function glfwPlatformSupported

        function glfwGetMonitors() result(monitors)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_int

            implicit none
            type(GLFWmonitor_ptr), dimension(:), allocatable :: monitors

            type(c_ptr) :: c_monitors
            integer(kind=c_int) :: count
            type(c_ptr), dimension(:), pointer :: ptr_array
            count = 0

            c_monitors = c_glfwGetMonitors(count)
            allocate(monitors(count))
            if (count > 0) then
                call c_f_pointer(c_monitors, ptr_array, [count])
                monitors(:)%ptr = ptr_array
            end if
        end function glfwGetMonitors

        function glfwGetPrimaryMonitor() result(monitor)
            implicit none
            type(GLFWmonitor_ptr) :: monitor

            monitor = GLFWmonitor_ptr(ptr = c_glfwGetPrimaryMonitor())
        end function glfwGetPrimaryMonitor

        subroutine glfwGetMonitorPos(monitor, x, y)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWmonitor_ptr),         intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y

            integer(kind=c_int) :: c_x, c_y

            call c_glfwGetMonitorPos(monitor%ptr, c_x, c_y)
            if (present(x)) x = c_x
            if (present(y)) y = c_y
        end subroutine glfwGetMonitorPos

        subroutine glfwGetMonitorWorkarea(monitor, x, y, width, height)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWmonitor_ptr),         intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: x, y, width, height

            integer(kind=c_int) :: c_x, c_y, c_w, c_h

            call c_glfwGetMonitorWorkarea(monitor%ptr, c_x, c_y, c_w, c_h)
            if (present(x))      x      = c_x
            if (present(y))      y      = c_y
            if (present(width))  width  = c_w
            if (present(height)) height = c_h
        end subroutine glfwGetMonitorWorkarea

        subroutine glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWmonitor_ptr),         intent(in)  :: monitor
            integer(kind=c_int), optional, intent(out) :: widthMM, heightMM

            integer(kind=c_int) :: c_w, c_h

            call c_glfwGetMonitorPhysicalSize(monitor%ptr, c_w, c_h)
            if (present(widthMM))  widthMM  = c_w
            if (present(heightMM)) heightMM = c_h
        end subroutine glfwGetMonitorPhysicalSize

        subroutine glfwGetMonitorContentScale(monitor, xscale, yscale)
            use, intrinsic :: iso_c_binding, only: c_float

            implicit none
            type(GLFWmonitor_ptr),        intent(in)  :: monitor
            real(kind=c_float), optional, intent(out) :: xscale, yscale

            real(kind=c_float) :: c_xscale, c_yscale

            call c_glfwGetMonitorContentScale(monitor%ptr, c_xscale, c_yscale)
            if (present(xscale)) xscale = c_xscale
            if (present(yscale)) yscale = c_yscale
        end subroutine glfwGetMonitorContentScale

        function glfwGetMonitorName(monitor) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            character(len=:), pointer         :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetMonitorName(monitor%ptr)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name)
            else
                name => null()
            end if
        end function glfwGetMonitorName

        subroutine glfwSetMonitorUserPointer(monitor, user_pointer)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(c_ptr),           intent(in) :: user_pointer

            call c_glfwSetMonitorUserPointer(monitor%ptr, user_pointer)
        end subroutine glfwSetMonitorUserPointer

        function glfwGetMonitorUserPointer(monitor) result(user_pointer)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(c_ptr)                       :: user_pointer

            user_pointer = c_glfwGetMonitorUserPointer(monitor%ptr)
        end function glfwGetMonitorUserPointer

        function glfwSetMonitorCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            procedure(GLFWmonitorfun), optional :: callback
            procedure(GLFWmonitorfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wMonitorCallback
            if (present(callback)) then
                res = c_glfwSetMonitorCallback(c_funloc(glf90wMonitorWrapper))
                glf90wMonitorCallback => callback
            else
                res = c_glfwSetMonitorCallback(c_null_funptr)
                glf90wMonitorCallback => null()
            end if
        end function glfwSetMonitorCallback

        function glfwGetVideoModes(monitor) result(vidmodes)
            use, intrinsic :: iso_c_binding, only: c_associated, c_f_pointer, c_ptr, c_int

            implicit none
            type(GLFWmonitor_ptr), intent(in)        :: monitor
            type(GLFWvidmode), dimension(:), pointer :: vidmodes

            type(c_ptr) :: c_vidmodes
            integer(kind=c_int) :: count

            c_vidmodes = c_glfwGetVideoModes(monitor%ptr, count)
            if (c_associated(c_vidmodes)) then
                call c_f_pointer(c_vidmodes, vidmodes, [count])
            else
                vidmodes => null()
            end if
        end function glfwGetVideoModes

        function glfwGetVideoMode(monitor) result(vidmode)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_int

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(GLFWvidmode), pointer        :: vidmode

            type(c_ptr) :: c_vidmode

            c_vidmode = c_glfwGetVideoMode(monitor%ptr)
            call c_f_pointer(c_vidmode, vidmode)
        end function glfwGetVideoMode

        subroutine glfwSetGamma(monitor, gamma_val)
            use, intrinsic :: iso_c_binding, only: c_float

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            real(kind=c_float),    intent(in) :: gamma_val

            call c_glfwSetGamma(monitor%ptr, gamma_val)
        end subroutine glfwSetGamma

        function glfwGetGammaRamp(monitor) result(gammaramp)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr

            implicit none
            type(GLFWmonitor_ptr), intent(in) :: monitor
            type(GLFWgammaramp), pointer      :: gammaramp

            type(c_ptr) :: c_gammaramp

            c_gammaramp = c_glfwGetGammaRamp(monitor%ptr)
            call c_f_pointer(c_gammaramp, gammaramp)
        end function glfwGetGammaRamp

        subroutine glfwSetGammaRamp(monitor, gammaramp)
            use, intrinsic :: iso_c_binding, only: c_loc

            implicit none
            type(GLFWmonitor_ptr),        intent(in) :: monitor
            type(GLFWgammaramp), pointer, intent(in) :: gammaramp

            call c_glfwSetGammaRamp(monitor%ptr, c_loc(gammaramp))
        end subroutine glfwSetGammaRamp

        subroutine glfwWindowHintString(hint, val)
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int),           intent(in) :: hint
            character(len=*, kind=c_char), intent(in) :: val

            call c_glfwWindowHintString(hint, f_c_string(val))
        end subroutine glfwWindowHintString

        function glfwCreateWindow(width, height, title, monitor, share) result(window)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_int, c_null_ptr

            implicit none
            integer(kind=c_int),             intent(in) :: width, height
            character(len=*, kind=c_char),   intent(in) :: title
            type(GLFWmonitor_ptr), optional, intent(in) :: monitor
            type(GLFWwindow_ptr),  optional, intent(in) :: share
            type(GLFWwindow_ptr)                        :: window

            type(c_ptr) :: c_monitor, c_share
            c_monitor = c_null_ptr
            c_share = c_null_ptr

            if (present(monitor)) c_monitor = monitor%ptr
            if (present(share)) c_share = share%ptr

            window = GLFWwindow_ptr(ptr = c_glfwCreateWindow(width, height, f_c_string(title), c_monitor, c_share))
        end function glfwCreateWindow

        subroutine glfwDestroyWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwDestroyWindow(window%ptr)
        end subroutine glfwDestroyWindow

        function glfwWindowShouldClose(window) result(closeflag)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical                          :: closeflag

            closeflag = merge(.false., .true., c_glfwWindowShouldClose(window%ptr) == GLFW_FALSE)
        end function glfwWindowShouldClose

        subroutine glfwSetWindowShouldClose(window, val)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            logical,              intent(in) :: val

            call c_glfwSetWindowShouldClose(window%ptr, merge(GLFW_TRUE, GLFW_FALSE, val))
        end subroutine glfwSetWindowShouldClose

        function glfwGetWindowTitle(window) result(title)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            character(len=:), pointer        :: title

            type(c_ptr) :: c_title

            c_title = c_glfwGetWindowTitle(window%ptr)
            if (c_associated(c_title)) then
                call c_f_strpointer(c_title, title)
            else
                title => null()
            end if
        end function glfwGetWindowTitle

        subroutine glfwSetWindowTitle(window, title)
            use, intrinsic :: iso_c_binding, only: c_char

            implicit none
            type(GLFWwindow_ptr),          intent(in) :: window
            character(len=*, kind=c_char), intent(in) :: title

            call c_glfwSetWindowTitle(window%ptr, f_c_string(title))
        end subroutine glfwSetWindowTitle

        subroutine glfwSetWindowIcon(window, images)
            use, intrinsic :: iso_c_binding, only: c_loc

            implicit none
            type(GLFWwindow_ptr),                  intent(in) :: window
            type(GLFWimage), dimension(:), target, intent(in) :: images

            ! Image data is copied by GLFW so okay to c_loc the dummy argument
            call c_glfwSetWindowIcon(window%ptr, size(images), c_loc(images))
        end subroutine glfwSetWindowIcon

        subroutine glfwGetWindowPos(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr),          intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: x, y

            integer(kind=c_int) :: c_x, c_y

            call c_glfwGetWindowPos(window%ptr, c_x, c_y)
            if (present(x)) x = c_x
            if (present(y)) y = c_y
        end subroutine glfwGetWindowPos

        subroutine glfwSetWindowPos(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: x, y

            call c_glfwSetWindowPos(window%ptr, x, y)
        end subroutine glfwSetWindowPos

        subroutine glfwGetWindowSize(window, width, height)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr),          intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height

            integer(kind=c_int) :: c_w, c_h

            call c_glfwGetWindowSize(window%ptr, c_w, c_h)
            if (present(width))  width  = c_w
            if (present(height)) height = c_h
        end subroutine glfwGetWindowSize

        subroutine glfwSetWindowSizeLimits(window, minwidth, minheight, maxwidth, maxheight)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: minwidth, minheight, maxwidth, maxheight

            call c_glfwSetWindowSizeLimits(window%ptr, minwidth, minheight, maxwidth, maxheight)
        end subroutine glfwSetWindowSizeLimits

        subroutine glfwSetWindowAspectRatio(window, numer, denom)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: numer, denom

            call c_glfwSetWindowAspectRatio(window%ptr, numer, denom)
        end subroutine glfwSetWindowAspectRatio

        subroutine glfwSetWindowSize(window, width, height)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: width, height

            call c_glfwSetWindowSize(window%ptr, width, height)
        end subroutine glfwSetWindowSize

        subroutine glfwGetFramebufferSize(window, width, height)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr),          intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: width, height

            integer(kind=c_int) :: c_w, c_h

            call c_glfwGetFramebufferSize(window%ptr, c_w, c_h)
            if (present(width))  width  = c_w
            if (present(height)) height = c_h
        end subroutine glfwGetFramebufferSize

        subroutine glfwGetWindowFrameSize(window, left, top, right, bottom)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr),          intent(in)  :: window
            integer(kind=c_int), optional, intent(out) :: left, top, right, bottom

            integer(kind=c_int) :: c_l, c_t, c_r, c_b

            call c_glfwGetWindowFrameSize(window%ptr, c_l, c_t, c_r, c_b)
            if (present(left))   left   = c_l
            if (present(top))    top    = c_t
            if (present(right))  right  = c_r
            if (present(bottom)) bottom = c_b
        end subroutine glfwGetWindowFrameSize

        subroutine glfwGetWindowContentScale(window, xscale, yscale)
            use, intrinsic :: iso_c_binding, only: c_float

            implicit none
            type(GLFWwindow_ptr),         intent(in)  :: window
            real(kind=c_float), optional, intent(out) :: xscale, yscale

            real(kind=c_float) :: c_x, c_y

            call c_glfwGetWindowContentScale(window%ptr, c_x, c_y)
            if (present(xscale)) xscale = c_x
            if (present(yscale)) yscale = c_y
        end subroutine glfwGetWindowContentScale

        function glfwGetWindowOpacity(window) result(opacity)
            use, intrinsic :: iso_c_binding, only: c_float

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_float)               :: opacity

            opacity = c_glfwGetWindowOpacity(window%ptr)
        end function glfwGetWindowOpacity

        subroutine glfwSetWindowOpacity(window, opacity)
            use, intrinsic :: iso_c_binding, only: c_float

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_float),   intent(in) :: opacity

            call c_glfwSetWindowOpacity(window%ptr, opacity)
        end subroutine glfwSetWindowOpacity

        subroutine glfwIconifyWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwIconifyWindow(window%ptr)
        end subroutine glfwIconifyWindow

        subroutine glfwRestoreWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwRestoreWindow(window%ptr)
        end subroutine glfwRestoreWindow

        subroutine glfwMaximizeWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwMaximizeWindow(window%ptr)
        end subroutine glfwMaximizeWindow

        subroutine glfwShowWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwShowWindow(window%ptr)
        end subroutine glfwShowWindow

        subroutine glfwHideWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwHideWindow(window%ptr)
        end subroutine glfwHideWindow

        subroutine glfwFocusWindow(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwFocusWindow(window%ptr)
        end subroutine glfwFocusWindow

        subroutine glfwRequestWindowAttention(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwRequestWindowAttention(window%ptr)
        end subroutine glfwRequestWindowAttention

        function glfwGetWindowMonitor(window) result(monitor)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            type(GLFWmonitor_ptr)            :: monitor

            monitor = GLFWmonitor_ptr(ptr = c_glfwGetWindowMonitor(window%ptr))
        end function glfwGetWindowMonitor

        subroutine glfwSetWindowMonitor(window, monitor, x, y, width, height, refresh_rate)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int, c_null_ptr

            implicit none
            type(GLFWwindow_ptr),            intent(in) :: window
            type(GLFWmonitor_ptr), optional, intent(in) :: monitor
            integer(kind=c_int),             intent(in) :: x, y, width, height, refresh_rate

            type(c_ptr) :: c_monitor

            c_monitor = c_null_ptr
            if (present(monitor)) c_monitor = monitor%ptr

            call c_glfwSetWindowMonitor(window%ptr, c_monitor, x, y, width, height, refresh_rate)
        end subroutine glfwSetWindowMonitor

        function glfwGetWindowAttrib(window, attrib) result(val)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: attrib
            integer(kind=c_int)              :: val

            val = c_glfwGetWindowAttrib(window%ptr, attrib)
        end function glfwGetWindowAttrib

        subroutine glfwSetWindowAttrib(window, attrib, val)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: attrib
            integer(kind=c_int),  intent(in) :: val

            call c_glfwSetWindowAttrib(window%ptr, attrib, val)
        end subroutine glfwSetWindowAttrib

        subroutine glfwSetWindowUserPointer(window, user_pointer)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            type(c_ptr),          intent(in) :: user_pointer

            call c_glfwSetWindowUserPointer(window%ptr, user_pointer)
        end subroutine glfwSetWindowUserPointer

        function glfwGetWindowUserPointer(window) result(user_pointer)
            use, intrinsic :: iso_c_binding, only: c_ptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            type(c_ptr)                      :: user_pointer

            user_pointer = c_glfwGetWindowUserPointer(window%ptr)
        end function glfwGetWindowUserPointer

        function glfwSetWindowPosCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowposfun), optional :: callback
            procedure(GLFWwindowposfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowPosCallback
            if (present(callback)) then
                res = c_glfwSetWindowPosCallback(window%ptr, c_funloc(glf90wWindowPosWrapper))
                glf90wWindowPosCallback => callback
            else
                res = c_glfwSetWindowPosCallback(window%ptr, c_null_funptr)
                glf90wWindowPosCallback => null()
            end if
        end function glfwSetWindowPosCallback

        function glfwSetWindowSizeCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowsizefun), optional :: callback
            procedure(GLFWwindowsizefun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowSizeCallback
            if (present(callback)) then
                res = c_glfwSetWindowSizeCallback(window%ptr, c_funloc(glf90wWindowSizeWrapper))
                glf90wWindowSizeCallback => callback
            else
                res = c_glfwSetWindowSizeCallback(window%ptr, c_null_funptr)
                glf90wWindowSizeCallback => null()
            end if
        end function glfwSetWindowSizeCallback

        function glfwSetWindowCloseCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowclosefun), optional :: callback
            procedure(GLFWwindowclosefun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowCloseCallback
            if (present(callback)) then
                res = c_glfwSetWindowCloseCallback(window%ptr, c_funloc(glf90wWindowCloseWrapper))
                glf90wWindowCloseCallback => callback
            else
                res = c_glfwSetWindowCloseCallback(window%ptr, c_null_funptr)
                glf90wWindowCloseCallback => null()
            end if
        end function glfwSetWindowCloseCallback

        function glfwSetWindowRefreshCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowrefreshfun), optional :: callback
            procedure(GLFWwindowrefreshfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowRefreshCallback
            if (present(callback)) then
                res = c_glfwSetWindowRefreshCallback(window%ptr, c_funloc(glf90wWindowRefreshWrapper))
                glf90wWindowRefreshCallback => callback
            else
                res = c_glfwSetWindowRefreshCallback(window%ptr, c_null_funptr)
                glf90wWindowRefreshCallback => null()
            end if
        end function glfwSetWindowRefreshCallback

        function glfwSetWindowFocusCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowfocusfun), optional :: callback
            procedure(GLFWwindowfocusfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowFocusCallback
            if (present(callback)) then
                res = c_glfwSetWindowFocusCallback(window%ptr, c_funloc(glf90wWindowFocusWrapper))
                glf90wWindowFocusCallback => callback
            else
                res = c_glfwSetWindowFocusCallback(window%ptr, c_null_funptr)
                glf90wWindowFocusCallback => null()
            end if
        end function glfwSetWindowFocusCallback

        function glfwSetWindowIconifyCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowiconifyfun), optional :: callback
            procedure(GLFWwindowiconifyfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowIconifyCallback
            if (present(callback)) then
                res = c_glfwSetWindowIconifyCallback(window%ptr, c_funloc(glf90wWindowIconifyWrapper))
                glf90wWindowIconifyCallback => callback
            else
                res = c_glfwSetWindowIconifyCallback(window%ptr, c_null_funptr)
                glf90wWindowIconifyCallback => null()
            end if
        end function glfwSetWindowIconifyCallback

        function glfwSetWindowMaximizeCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowmaximizefun), optional :: callback
            procedure(GLFWwindowmaximizefun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowMaximizeCallback
            if (present(callback)) then
                res = c_glfwSetWindowMaximizeCallback(window%ptr, c_funloc(glf90wWindowMaximizeWrapper))
                glf90wWindowMaximizeCallback => callback
            else
                res = c_glfwSetWindowMaximizeCallback(window%ptr, c_null_funptr)
                glf90wWindowMaximizeCallback => null()
            end if
        end function glfwSetWindowMaximizeCallback

        function glfwSetFramebufferSizeCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWframebuffersizefun), optional :: callback
            procedure(GLFWframebuffersizefun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wFramebufferSizeCallback
            if (present(callback)) then
                res = c_glfwSetFramebufferSizeCallback(window%ptr, c_funloc(glf90wFramebufferSizeWrapper))
                glf90wFramebufferSizeCallback => callback
            else
                res = c_glfwSetFramebufferSizeCallback(window%ptr, c_null_funptr)
                glf90wFramebufferSizeCallback => null()
            end if
        end function glfwSetFramebufferSizeCallback

        function glfwSetWindowContentScaleCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWwindowcontentscalefun), optional :: callback
            procedure(GLFWwindowcontentscalefun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wWindowContentScaleCallback
            if (present(callback)) then
                res = c_glfwSetWindowContentScaleCallback(window%ptr, c_funloc(glf90wWindowContentScaleWrapper))
                glf90wWindowContentScaleCallback => callback
            else
                res = c_glfwSetWindowContentScaleCallback(window%ptr, c_null_funptr)
                glf90wWindowContentScaleCallback => null()
            end if
        end function glfwSetWindowContentScaleCallback

        function glfwGetInputMode(window, mode) result(val)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: mode
            integer(kind=c_int)              :: val

            val = c_glfwGetInputMode(window%ptr, mode)
        end function glfwGetInputMode

        subroutine glfwSetInputMode(window, mode, val)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: mode
            integer(kind=c_int),  intent(in) :: val

            call c_glfwSetInputMode(window%ptr, mode, val)
        end subroutine glfwSetInputMode

        function glfwRawMouseMotionSupported() result(supported)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            logical :: supported

            supported = merge(.false., .true., c_glfwRawMouseMotionSupported() == GLFW_FALSE)
        end function glfwRawMouseMotionSupported

        function glfwGetKeyName(key, scancode) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in)        :: key
            integer(kind=c_int), intent(in)        :: scancode
            character(len=:, kind=c_char), pointer :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetKeyName(key, scancode)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name)
            else
                name => null()
            end if
        end function glfwGetKeyName

        function glfwGetKey(window, key) result(status)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: key
            integer(kind=c_int)              :: status

            status = c_glfwGetKey(window%ptr, key)
        end function glfwGetKey

        function glfwGetMouseButton(window, button) result(status)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            integer(kind=c_int),  intent(in) :: button
            integer(kind=c_int)              :: status

            status = c_glfwGetMouseButton(window%ptr, button)
        end function glfwGetMouseButton

        subroutine glfwGetCursorPos(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_double

            implicit none
            type(GLFWwindow_ptr),          intent(in)  :: window
            real(kind=c_double), optional, intent(out) :: x, y

            real(kind=c_double) :: c_x, c_y

            call c_glfwGetCursorPos(window%ptr, c_x, c_y)
            if (present(x)) x = c_x
            if (present(y)) y = c_y
        end subroutine glfwGetCursorPos

        subroutine glfwSetCursorPos(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_double

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            real(kind=c_double),  intent(in) :: x, y

            call c_glfwSetCursorPos(window%ptr, x, y)
        end subroutine glfwSetCursorPos

        function glfwCreateCursor(image, xhot, yhot) result(cursor)
            use, intrinsic :: iso_c_binding, only: c_loc, c_int

            implicit none
            type(GLFWimage), target, intent(in) :: image
            integer(kind=c_int),     intent(in) :: xhot, yhot
            type(GLFWcursor_ptr)                :: cursor

            ! Image data is copied by GLFW so okay to c_loc the dummy argument
            cursor = GLFWcursor_ptr(ptr = c_glfwCreateCursor(c_loc(image), xhot, yhot))
        end function glfwCreateCursor

        function glfwCreateStandardCursor(cursor_shape) result(cursor)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: cursor_shape
            type(GLFWcursor_ptr)            :: cursor

            cursor = GLFWcursor_ptr(ptr = c_glfwCreateStandardCursor(cursor_shape))
        end function glfwCreateStandardCursor

        subroutine glfwDestroyCursor(cursor)
            implicit none
            type(GLFWcursor_ptr), intent(in) :: cursor

            call c_glfwDestroyCursor(cursor%ptr)
        end subroutine glfwDestroyCursor

        subroutine glfwSetCursor(window, cursor)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            type(GLFWcursor_ptr), intent(in) :: cursor

            call c_glfwSetCursor(window%ptr, cursor%ptr)
        end subroutine glfwSetCursor

        function glfwSetKeyCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in) :: window
            procedure(GLFWkeyfun), optional  :: callback
            procedure(GLFWkeyfun), pointer   :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wKeyCallback
            if (present(callback)) then
                res = c_glfwSetKeyCallback(window%ptr, c_funloc(glf90wKeyWrapper))
                glf90wKeyCallback => callback
            else
                res = c_glfwSetKeyCallback(window%ptr, c_null_funptr)
                glf90wKeyCallback => null()
            end if
        end function glfwSetKeyCallback

        function glfwSetCharCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWcharfun), optional :: callback
            procedure(GLFWcharfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wCharCallback
            if (present(callback)) then
                res = c_glfwSetCharCallback(window%ptr, c_funloc(glf90wCharWrapper))
                glf90wCharCallback => callback
            else
                res = c_glfwSetCharCallback(window%ptr, c_null_funptr)
                glf90wCharCallback => null()
            end if
        end function glfwSetCharCallback

        function glfwSetCharModsCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWcharmodsfun), optional :: callback
            procedure(GLFWcharmodsfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wCharModsCallback
            if (present(callback)) then
                res = c_glfwSetCharModsCallback(window%ptr, c_funloc(glf90wCharModsWrapper))
                glf90wCharModsCallback => callback
            else
                res = c_glfwSetCharModsCallback(window%ptr, c_null_funptr)
                glf90wCharModsCallback => null()
            end if
        end function glfwSetCharModsCallback

        function glfwSetMouseButtonCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWmousebuttonfun), optional :: callback
            procedure(GLFWmousebuttonfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wMouseButtonCallback
            if (present(callback)) then
                res = c_glfwSetMouseButtonCallback(window%ptr, c_funloc(glf90wMouseButtonWrapper))
                glf90wMouseButtonCallback => callback
            else
                res = c_glfwSetMouseButtonCallback(window%ptr, c_null_funptr)
                glf90wMouseButtonCallback => null()
            end if
        end function glfwSetMouseButtonCallback

        function glfwSetCursorPosCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWcursorposfun), optional :: callback
            procedure(GLFWcursorposfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wCursorPosCallback
            if (present(callback)) then
                res = c_glfwSetCursorPosCallback(window%ptr, c_funloc(glf90wCursorPosWrapper))
                glf90wCursorPosCallback => callback
            else
                res = c_glfwSetCursorPosCallback(window%ptr, c_null_funptr)
                glf90wCursorPosCallback => null()
            end if
        end function glfwSetCursorPosCallback

        function glfwSetCursorEnterCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWcursorenterfun), optional :: callback
            procedure(GLFWcursorenterfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wCursorEnterCallback
            if (present(callback)) then
                res = c_glfwSetCursorEnterCallback(window%ptr, c_funloc(glf90wCursorEnterWrapper))
                glf90wCursorEnterCallback => callback
            else
                res = c_glfwSetCursorEnterCallback(window%ptr, c_null_funptr)
                glf90wCursorEnterCallback => null()
            end if
        end function glfwSetCursorEnterCallback

        function glfwSetScrollCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWscrollfun), optional :: callback
            procedure(GLFWscrollfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wScrollCallback
            if (present(callback)) then
                res = c_glfwSetScrollCallback(window%ptr, c_funloc(glf90wScrollWrapper))
                glf90wScrollCallback => callback
            else
                res = c_glfwSetScrollCallback(window%ptr, c_null_funptr)
                glf90wScrollCallback => null()
            end if
        end function glfwSetScrollCallback

        function glfwSetDropCallback(window, callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            type(GLFWwindow_ptr), intent(in)      :: window
            procedure(GLFWdropfun), optional :: callback
            procedure(GLFWdropfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wDropCallback
            if (present(callback)) then
                res = c_glfwSetDropCallback(window%ptr, c_funloc(glf90wDropWrapper))
                glf90wDropCallback => callback
            else
                res = c_glfwSetDropCallback(window%ptr, c_null_funptr)
                glf90wDropCallback => null()
            end if
        end function glfwSetDropCallback

        function glfwJoystickPresent(jid) result(is_present)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: is_present

            is_present = merge(.false., .true., c_glfwJoystickPresent(jid) == GLFW_FALSE)
        end function glfwJoystickPresent

        function glfwGetJoystickAxes(jid) result(axes)
            use, intrinsic :: iso_c_binding, only: c_associated, c_f_pointer, c_ptr, c_int, c_float

            implicit none
            integer(kind=c_int), intent(in)           :: jid
            real(kind=c_float), dimension(:), pointer :: axes

            type(c_ptr) :: c_axes
            integer(kind=c_int) :: count
            count = 0

            c_axes = c_glfwGetJoystickAxes(jid, count)
            if (c_associated(c_axes) .AND. count > 0) then
                call c_f_pointer(c_axes, axes, [count])
            else
                axes => null()
            end if
        end function glfwGetJoystickAxes

        function glfwGetJoystickButtons(jid) result(states)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in)               :: jid
            character(kind=c_char), dimension(:), pointer :: states

            integer(kind=c_int) :: count
            type(c_ptr) :: c_states

            c_states = c_glfwGetJoystickButtons(jid, count)
            if (c_associated(c_states) .AND. count > 0) then
                call c_f_pointer(c_states, states, [count])
            else
                states => null()
            end if
        end function glfwGetJoystickButtons

        function glfwGetJoystickHats(jid) result(states)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in)               :: jid
            character(kind=c_char), dimension(:), pointer :: states

            integer(kind=c_int) :: count
            type(c_ptr) :: c_states

            c_states = c_glfwGetJoystickHats(jid, count)
            if (c_associated(c_states) .AND. count > 0) then
                call c_f_pointer(c_states, states, [count])
            else
                states => null()
            end if
        end function glfwGetJoystickHats

        function glfwGetJoystickName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            character(len=:), pointer       :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetJoystickName(jid)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name)
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
                call c_f_strpointer(c_name, GUID)
            else
                GUID => null()
            end if
        end function glfwGetJoystickGUID

        function glfwJoystickIsGamepad(jid) result(is_gamepad)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            logical                         :: is_gamepad

            is_gamepad = merge(.false., .true., c_glfwJoystickIsGamepad(jid) == GLFW_FALSE)
        end function glfwJoystickIsGamepad

        function glfwSetJoystickCallback(callback) result(prev_callback)
            use, intrinsic :: iso_c_binding, only: c_funloc, c_funptr, c_null_funptr

            implicit none
            procedure(GLFWjoystickfun), optional :: callback
            procedure(GLFWjoystickfun), pointer  :: prev_callback

            type(c_funptr) :: res

            prev_callback => glf90wJoystickCallback
            if (present(callback)) then
                res = c_glfwSetJoystickCallback(c_funloc(glf90wJoystickWrapper))
                glf90wJoystickCallback => callback
            else
                res = c_glfwSetJoystickCallback(c_null_funptr)
                glf90wJoystickCallback => null()
            end if
        end function glfwSetJoystickCallback

        function glfwUpdateGamepadMappings(mappings) result(success)
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=*, kind=c_char), intent(in) :: mappings
            logical                                   :: success

            success = merge(.false., .true., c_glfwUpdateGamepadMappings(f_c_string(mappings)) == GLFW_FALSE)
        end function glfwUpdateGamepadMappings

        function glfwGetGamepadName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int

            implicit none
            integer(kind=c_int), intent(in)        :: jid
            character(len=:, kind=c_char), pointer :: name

            type(c_ptr) :: c_name

            c_name = c_glfwGetGamepadName(jid)
            if (c_associated(c_name)) then
                call c_f_strpointer(c_name, name)
            else
                name => null()
            end if
        end function glfwGetGamepadName

        function glfwGetGamepadState(jid, state) result(success)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), intent(in) :: jid
            type(GLFWgamepadstate)          :: state
            logical                         :: success

            success = merge(.false., .true., c_glfwGetGamepadState(jid, state) == GLFW_FALSE)
        end function glfwGetGamepadState

        subroutine glfwSetClipboardString(window, string)
            use, intrinsic :: iso_c_binding, only: c_char

            implicit none
            type(GLFWwindow_ptr),          intent(in) :: window
            character(len=*, kind=c_char), intent(in) :: string

            call c_glfwSetClipboardString(window%ptr, f_c_string(string))
        end subroutine glfwSetClipboardString

        function glfwGetClipboardString(window) result(string)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char

            implicit none
            type(GLFWwindow_ptr),          intent(in) :: window
            character(len=:, kind=c_char), pointer    :: string

            type(c_ptr) :: c_string

            c_string = c_glfwGetClipboardString(window%ptr)
            if (c_associated(c_string)) then
                call c_f_strpointer(c_string, string)
            else
                string => null()
            end if
        end function glfwGetClipboardString

        subroutine glfwMakeContextCurrent(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwMakeContextCurrent(window%ptr)
        end subroutine glfwMakeContextCurrent

        function glfwGetCurrentContext() result(window)
            implicit none
            type(GLFWwindow_ptr) :: window

            window = GLFWwindow_ptr(ptr = c_glfwGetCurrentContext())
        end function glfwGetCurrentContext

        subroutine glfwSwapBuffers(window)
            implicit none
            type(GLFWwindow_ptr), intent(in) :: window

            call c_glfwSwapBuffers(window%ptr)
        end subroutine glfwSwapBuffers

        function glfwExtensionSupported(extension) result(supported)
            use, intrinsic :: iso_c_binding, only: c_char

            implicit none
            character(len=*, kind=c_char), intent(in) :: extension
            logical                                   :: supported

            supported = merge(.false., .true., c_glfwExtensionSupported(f_c_string(extension)) == GLFW_FALSE)
        end function glfwExtensionSupported

        function glfwGetProcAddress(procname) result(procaddr)
            use, intrinsic :: iso_c_binding, only: c_f_procpointer, c_funptr, c_char

            implicit none
            character(len=*, kind=c_char), intent(in) :: procname
            procedure(GLFWglproc), pointer            :: procaddr

            type(c_funptr) :: c_procaddr

            c_procaddr = c_glfwGetProcAddress(f_c_string(procname))
            call c_f_procpointer(c_procaddr, procaddr)
        end function glfwGetProcAddress

        function glfwVulkanSupported() result(supported)
            implicit none
            logical :: supported

            supported = merge(.false., .true., c_glfwVulkanSupported() == GLFW_FALSE)
        end function glfwVulkanSupported

        function glfwGetRequiredInstanceExtensions() result(names)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_int32_t

            implicit none
            type(string_ptr), dimension(:), allocatable :: names

            integer(kind=c_int) :: i
            integer(kind=c_int) :: count
            type(c_ptr) :: c_names
            type(c_ptr), dimension(:), pointer :: c_array

            c_names = c_glfwGetRequiredInstanceExtensions(count)
            allocate(names(count))
            if (count > 0) then
                call c_f_pointer(c_names, c_array, [count])
                do i = 1, count
                    call c_f_strpointer(c_array(i), names(i)%str)
                end do
            end if
        end function glfwGetRequiredInstanceExtensions


        ! ----------------------------------------------------------------------
        ! GLF90W Callback wrapper procedures
        ! ----------------------------------------------------------------------


        ! NOTE In principle, the wrappers are not associated to GLFW if the callbacks are NULL()
        ! Therefore there shouldn't be a need to check "associated(glf90wSomeCallback)"
        ! But remember to check here if something goes wrong (?)

        subroutine glf90wErrorWrapper(error_code, desc_ptr) bind(C)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: error_code
            type(c_ptr),         value, intent(in) :: desc_ptr

            character(len=:), pointer :: f_desc

            f_desc => null()
            if (c_associated(desc_ptr)) call c_f_strpointer(desc_ptr, f_desc)

            call glf90wErrorCallback(error_code, f_desc)
        end subroutine glf90wErrorWrapper

        subroutine glf90wWindowPosWrapper(window, x, y) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: x, y

            call glf90wWindowPosCallback(GLFWwindow_ptr(ptr = window), x, y)
        end subroutine glf90wWindowPosWrapper

        subroutine glf90wWindowSizeWrapper(window, width, height) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height

            call glf90wWindowSizeCallback(GLFWwindow_ptr(ptr = window), width, height)
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
                                           merge(.false., .true., focused == GLFW_FALSE))
        end subroutine glf90wWindowFocusWrapper

        subroutine glf90wWindowIconifyWrapper(window, iconified) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: iconified

            call glf90wWindowIconifyCallback(GLFWwindow_ptr(ptr = window), &
                                             merge(.false., .true., iconified == GLFW_FALSE))
        end subroutine glf90wWindowIconifyWrapper

        subroutine glf90wWindowMaximizeWrapper(window, maximized) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: maximized

            call glf90wWindowMaximizeCallback(GLFWwindow_ptr(ptr = window), &
                                              merge(.false., .true., maximized == GLFW_FALSE))
        end subroutine glf90wWindowMaximizeWrapper

        subroutine glf90wFramebufferSizeWrapper(window, width, height) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: width, height

            call glf90wFramebufferSizeCallback(GLFWwindow_ptr(ptr = window), width, height)
        end subroutine glf90wFramebufferSizeWrapper

        subroutine glf90wWindowContentScaleWrapper(window, xscale, yscale) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_float

            implicit none
            type(c_ptr),        value, intent(in) :: window
            real(kind=c_float), value, intent(in) :: xscale, yscale

            call glf90wWindowContentScaleCallback(GLFWwindow_ptr(ptr = window), xscale, yscale)
        end subroutine glf90wWindowContentScaleWrapper

        subroutine glf90wMouseButtonWrapper(window, button, action, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: button, action, mods

            call glf90wMouseButtonCallback(GLFWwindow_ptr(ptr = window), button, action, mods)
        end subroutine glf90wMouseButtonWrapper

        subroutine glf90wCursorPosWrapper(window, x, y)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double

            implicit none
            type(c_ptr),         value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: x, y

            call glf90wCursorPosCallback(GLFWwindow_ptr(ptr = window), x, y)
        end subroutine glf90wCursorPosWrapper

        subroutine glf90wCursorEnterWrapper(window, entered) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: entered

            call glf90wCursorEnterCallback(GLFWwindow_ptr(ptr = window), &
                                           merge(.false., .true., entered == GLFW_FALSE))
        end subroutine glf90wCursorEnterWrapper 

        subroutine glf90wScrollWrapper(window, xoffset, yoffset)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_double

            implicit none
            type(c_ptr),         value, intent(in) :: window
            real(kind=c_double), value, intent(in) :: xoffset, yoffset

            call glf90wScrollCallback(GLFWwindow_ptr(ptr = window), xoffset, yoffset)
        end subroutine glf90wScrollWrapper

        subroutine glf90wKeyWrapper(window, key, scancode, action, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: key, scancode, action, mods

            call glf90wKeyCallback(GLFWwindow_ptr(ptr = window), key, scancode, action, mods)
        end subroutine glf90wKeyWrapper

        subroutine glf90wCharWrapper(window, codepoint) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: codepoint

            call glf90wCharCallback(GLFWwindow_ptr(ptr = window), codepoint)
        end subroutine glf90wCharWrapper

        subroutine glf90wCharModsWrapper(window, codepoint, mods) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: window
            integer(kind=c_int), value, intent(in) :: codepoint, mods

            call glf90wCharModsCallback(GLFWwindow_ptr(ptr = window), codepoint, mods)
        end subroutine glf90wCharModsWrapper

        subroutine glf90wDropWrapper(window, path_count, paths) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_int

            implicit none
            type(c_ptr),         value,         intent(in) :: window
            integer(kind=c_int), value,         intent(in) :: path_count
            type(c_ptr), dimension(path_count), intent(in) :: paths

            character(len=:, kind=c_char), dimension(:), target, allocatable :: path_array
            integer :: max_length
            integer :: i

            max_length = 0
            do i = 1, path_count
                max_length = max(max_length, c_strlen(paths(i)))
            end do

            allocate(character(len=max_length, kind=c_char) :: path_array(path_count)) ! This is supposed to work, right?

            do i = 1, path_count
                path_array(i) = c_f_string(paths(i))
            end do

            call glf90wDropCallback(GLFWwindow_ptr(ptr = window), path_array)
        end subroutine glf90wDropWrapper

        subroutine glf90wMonitorWrapper(monitor, event) bind(C)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_int

            implicit none
            type(c_ptr),         value, intent(in) :: monitor
            integer(kind=c_int), value, intent(in) :: event

            call glf90wMonitorCallback(GLFWmonitor_ptr(ptr = monitor), event)
        end subroutine glf90wMonitorWrapper


        subroutine glf90wJoystickWrapper(jid, event) bind(C)
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int), value, intent(in) :: jid
            integer(kind=c_int), value, intent(in) :: event

            call glf90wJoystickCallback(jid, event)
        end subroutine glf90wJoystickWrapper


        ! ----------------------------------------------------------------------
        ! GLF90W Pointer semantic for GLFW opaque pointer types
        ! ----------------------------------------------------------------------


        pure function associated_opaque(pointer, target) result(is_associated)
            use, intrinsic :: iso_c_binding, only: c_associated

            implicit none
            class(C_opaque_ptr),           intent(in) :: pointer
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
            character(len=*, kind=c_char), intent(in)                :: fstr
            logical, optional,             intent(in)                :: asis
            character(len=1, kind=c_char), dimension(:), allocatable :: cstr

            integer :: c_length
            integer :: i

            if (present(asis)) then
                if (asis) then
                    c_length = len(fstr) + 1
                else
                    c_length = len_trim(fstr) + 1
                end if
            else
                c_length = len_trim(fstr) + 1
            end if

            allocate(character(len=1, kind=c_char) :: cstr(c_length))
            do i = 1, c_length-1
                cstr(i) = fstr(i:i)
            end do
            cstr(c_length) = c_null_char
        end function f_c_string

        ! Converts a C interoperable string (character array) to a Fortran character string
        pure function c_str_f_string(cstr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_char

            implicit none
            character(len=1, kind=c_char), dimension(:), intent(in) :: cstr
            character(len=c_strlen(cstr), kind=c_char)              :: fstr

            integer :: i

            do i = 1,len(fstr)
                fstr(i:i) = cstr(i)
            end do
        end function c_str_f_string

        ! Convert a C string (char*) to a Fortran character string
        function c_ptr_f_string(cptr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_associated, c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr), intent(in)                    :: cptr
            character(len=:, kind=c_char), allocatable :: fstr

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
        subroutine c_f_strpointer(cptr, fptr)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr),               intent(in)  :: cptr
            character(len=:), pointer, intent(out) :: fptr

            character(len=c_strlen(cptr), kind=c_char), pointer :: temp

            call c_f_pointer(cptr, temp)
            fptr => temp
        end subroutine c_f_strpointer

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

