// -----------------
// glf90w.h
// 17 Mar 2024
// Gaétan J.A.M. Jalin
// See end of file for complete licence description
// -----------------
#ifndef GLF90W_H
#define GLF90W_H

extern "C" int const glf90w_version_major;
extern "C" int const glf90w_version_minor;
extern "C" int const glf90w_version_revision;
extern "C" int const glf90w_true;
extern "C" int const glf90w_false;

extern "C" int const glf90w_release;
extern "C" int const glf90w_press;
extern "C" int const glf90w_repeat;
extern "C" int const glf90w_hat_centered;
extern "C" int const glf90w_hat_up;
extern "C" int const glf90w_hat_right;
extern "C" int const glf90w_hat_down;
extern "C" int const glf90w_hat_left;
extern "C" int const glf90w_hat_right_up;
extern "C" int const glf90w_hat_right_down;
extern "C" int const glf90w_hat_left_up;
extern "C" int const glf90w_hat_left_down;

extern "C" int const glf90w_key_unknown;

extern "C" int const glf90w_key_space;
extern "C" int const glf90w_key_apostrophe;
extern "C" int const glf90w_key_comma;
extern "C" int const glf90w_key_minus;
extern "C" int const glf90w_key_period;
extern "C" int const glf90w_key_slash;
extern "C" int const glf90w_key_0;
extern "C" int const glf90w_key_1;
extern "C" int const glf90w_key_2;
extern "C" int const glf90w_key_3;
extern "C" int const glf90w_key_4;
extern "C" int const glf90w_key_5;
extern "C" int const glf90w_key_6;
extern "C" int const glf90w_key_7;
extern "C" int const glf90w_key_8;
extern "C" int const glf90w_key_9;
extern "C" int const glf90w_key_semicolon;
extern "C" int const glf90w_key_equal;
extern "C" int const glf90w_key_a;
extern "C" int const glf90w_key_b;
extern "C" int const glf90w_key_c;
extern "C" int const glf90w_key_d;
extern "C" int const glf90w_key_e;
extern "C" int const glf90w_key_f;
extern "C" int const glf90w_key_g;
extern "C" int const glf90w_key_h;
extern "C" int const glf90w_key_i;
extern "C" int const glf90w_key_j;
extern "C" int const glf90w_key_k;
extern "C" int const glf90w_key_l;
extern "C" int const glf90w_key_m;
extern "C" int const glf90w_key_n;
extern "C" int const glf90w_key_o;
extern "C" int const glf90w_key_p;
extern "C" int const glf90w_key_q;
extern "C" int const glf90w_key_r;
extern "C" int const glf90w_key_s;
extern "C" int const glf90w_key_t;
extern "C" int const glf90w_key_u;
extern "C" int const glf90w_key_v;
extern "C" int const glf90w_key_w;
extern "C" int const glf90w_key_x;
extern "C" int const glf90w_key_y;
extern "C" int const glf90w_key_z;
extern "C" int const glf90w_key_left_bracket;
extern "C" int const glf90w_key_backslash;
extern "C" int const glf90w_key_right_bracket;
extern "C" int const glf90w_key_grave_accent;
extern "C" int const glf90w_key_world_1;
extern "C" int const glf90w_key_world_2;

extern "C" int const glf90w_key_escape;
extern "C" int const glf90w_key_enter;
extern "C" int const glf90w_key_tab;
extern "C" int const glf90w_key_backspace;
extern "C" int const glf90w_key_insert;
extern "C" int const glf90w_key_delete;
extern "C" int const glf90w_key_right;
extern "C" int const glf90w_key_left;
extern "C" int const glf90w_key_down;
extern "C" int const glf90w_key_up;
extern "C" int const glf90w_key_page_up;
extern "C" int const glf90w_key_page_down;
extern "C" int const glf90w_key_home;
extern "C" int const glf90w_key_end;
extern "C" int const glf90w_key_caps_lock;
extern "C" int const glf90w_key_scroll_lock;
extern "C" int const glf90w_key_num_lock;
extern "C" int const glf90w_key_print_screen;
extern "C" int const glf90w_key_pause;
extern "C" int const glf90w_key_f1;
extern "C" int const glf90w_key_f2;
extern "C" int const glf90w_key_f3;
extern "C" int const glf90w_key_f4;
extern "C" int const glf90w_key_f5;
extern "C" int const glf90w_key_f6;
extern "C" int const glf90w_key_f7;
extern "C" int const glf90w_key_f8;
extern "C" int const glf90w_key_f9;
extern "C" int const glf90w_key_f10;
extern "C" int const glf90w_key_f11;
extern "C" int const glf90w_key_f12;
extern "C" int const glf90w_key_f13;
extern "C" int const glf90w_key_f14;
extern "C" int const glf90w_key_f15;
extern "C" int const glf90w_key_f16;
extern "C" int const glf90w_key_f17;
extern "C" int const glf90w_key_f18;
extern "C" int const glf90w_key_f19;
extern "C" int const glf90w_key_f20;
extern "C" int const glf90w_key_f21;
extern "C" int const glf90w_key_f22;
extern "C" int const glf90w_key_f23;
extern "C" int const glf90w_key_f24;
extern "C" int const glf90w_key_f25;
extern "C" int const glf90w_key_kp_0;
extern "C" int const glf90w_key_kp_1;
extern "C" int const glf90w_key_kp_2;
extern "C" int const glf90w_key_kp_3;
extern "C" int const glf90w_key_kp_4;
extern "C" int const glf90w_key_kp_5;
extern "C" int const glf90w_key_kp_6;
extern "C" int const glf90w_key_kp_7;
extern "C" int const glf90w_key_kp_8;
extern "C" int const glf90w_key_kp_9;
extern "C" int const glf90w_key_kp_decimal;
extern "C" int const glf90w_key_kp_divide;
extern "C" int const glf90w_key_kp_multiply;
extern "C" int const glf90w_key_kp_subtract;
extern "C" int const glf90w_key_kp_add;
extern "C" int const glf90w_key_kp_enter;
extern "C" int const glf90w_key_kp_equal;
extern "C" int const glf90w_key_left_shift;
extern "C" int const glf90w_key_left_control;
extern "C" int const glf90w_key_left_alt;
extern "C" int const glf90w_key_left_super;
extern "C" int const glf90w_key_right_shift;
extern "C" int const glf90w_key_right_control;
extern "C" int const glf90w_key_right_alt;
extern "C" int const glf90w_key_right_super;
extern "C" int const glf90w_key_menu;

extern "C" int const glf90w_key_last;

extern "C" int const glf90w_mod_shift;
extern "C" int const glf90w_mod_control;
extern "C" int const glf90w_mod_alt;
extern "C" int const glf90w_mod_super;
extern "C" int const glf90w_mod_caps_lock;
extern "C" int const glf90w_mod_num_lock;

extern "C" int const glf90w_mouse_button_1;
extern "C" int const glf90w_mouse_button_2;
extern "C" int const glf90w_mouse_button_3;
extern "C" int const glf90w_mouse_button_4;
extern "C" int const glf90w_mouse_button_5;
extern "C" int const glf90w_mouse_button_6;
extern "C" int const glf90w_mouse_button_7;
extern "C" int const glf90w_mouse_button_8;
extern "C" int const glf90w_mouse_button_last;
extern "C" int const glf90w_mouse_button_left;
extern "C" int const glf90w_mouse_button_right;
extern "C" int const glf90w_mouse_button_middle;
extern "C" int const glf90w_joystick_1;
extern "C" int const glf90w_joystick_2;
extern "C" int const glf90w_joystick_3;
extern "C" int const glf90w_joystick_4;
extern "C" int const glf90w_joystick_5;
extern "C" int const glf90w_joystick_6;
extern "C" int const glf90w_joystick_7;
extern "C" int const glf90w_joystick_8;
extern "C" int const glf90w_joystick_9;
extern "C" int const glf90w_joystick_10;
extern "C" int const glf90w_joystick_11;
extern "C" int const glf90w_joystick_12;
extern "C" int const glf90w_joystick_13;
extern "C" int const glf90w_joystick_14;
extern "C" int const glf90w_joystick_15;
extern "C" int const glf90w_joystick_16;
extern "C" int const glf90w_joystick_last;
extern "C" int const glf90w_gamepad_button_a;
extern "C" int const glf90w_gamepad_button_b;
extern "C" int const glf90w_gamepad_button_x;
extern "C" int const glf90w_gamepad_button_y;
extern "C" int const glf90w_gamepad_button_left_bumper;
extern "C" int const glf90w_gamepad_button_right_bumper;
extern "C" int const glf90w_gamepad_button_back;
extern "C" int const glf90w_gamepad_button_start;
extern "C" int const glf90w_gamepad_button_guide;
extern "C" int const glf90w_gamepad_button_left_thumb;
extern "C" int const glf90w_gamepad_button_right_thumb;
extern "C" int const glf90w_gamepad_button_dpad_up;
extern "C" int const glf90w_gamepad_button_dpad_right;
extern "C" int const glf90w_gamepad_button_dpad_down;
extern "C" int const glf90w_gamepad_button_dpad_left;
extern "C" int const glf90w_gamepad_button_last;

extern "C" int const glf90w_gamepad_button_cross;
extern "C" int const glf90w_gamepad_button_circle;
extern "C" int const glf90w_gamepad_button_square;
extern "C" int const glf90w_gamepad_button_triangle;
extern "C" int const glf90w_gamepad_axis_left_x;
extern "C" int const glf90w_gamepad_axis_left_y;
extern "C" int const glf90w_gamepad_axis_right_x;
extern "C" int const glf90w_gamepad_axis_right_y;
extern "C" int const glf90w_gamepad_axis_left_trigger;
extern "C" int const glf90w_gamepad_axis_right_trigger;
extern "C" int const glf90w_gamepad_axis_last;
extern "C" int const glf90w_no_error;
extern "C" int const glf90w_not_initialized;
extern "C" int const glf90w_no_current_context;
extern "C" int const glf90w_invalid_enum;
extern "C" int const glf90w_invalid_value;
extern "C" int const glf90w_out_of_memory;
extern "C" int const glf90w_api_unavailable;
extern "C" int const glf90w_version_unavailable;
extern "C" int const glf90w_platform_error;
extern "C" int const glf90w_format_unavailable;
extern "C" int const glf90w_no_window_context;
extern "C" int const glf90w_cursor_unavailable;
extern "C" int const glf90w_feature_unavailable;
extern "C" int const glf90w_feature_unimplemented;
extern "C" int const glf90w_platform_unavailable;
extern "C" int const glf90w_focused;
extern "C" int const glf90w_iconified;
extern "C" int const glf90w_resizable;
extern "C" int const glf90w_visible;
extern "C" int const glf90w_decorated;
extern "C" int const glf90w_auto_iconify;
extern "C" int const glf90w_floating;
extern "C" int const glf90w_maximized;
extern "C" int const glf90w_center_cursor;
extern "C" int const glf90w_transparent_framebuffer;
extern "C" int const glf90w_hovered;
extern "C" int const glf90w_focus_on_show;

extern "C" int const glf90w_mouse_passthrough;

extern "C" int const glf90w_position_x;

extern "C" int const glf90w_position_y;

extern "C" int const glf90w_red_bits;
extern "C" int const glf90w_green_bits;
extern "C" int const glf90w_blue_bits;
extern "C" int const glf90w_alpha_bits;
extern "C" int const glf90w_depth_bits;
extern "C" int const glf90w_stencil_bits;
extern "C" int const glf90w_accum_red_bits;
extern "C" int const glf90w_accum_green_bits;
extern "C" int const glf90w_accum_blue_bits;
extern "C" int const glf90w_accum_alpha_bits;
extern "C" int const glf90w_aux_buffers;
extern "C" int const glf90w_stereo;
extern "C" int const glf90w_samples;
extern "C" int const glf90w_srgb_capable;
extern "C" int const glf90w_refresh_rate;
extern "C" int const glf90w_doublebuffer;

extern "C" int const glf90w_client_api;
extern "C" int const glf90w_context_version_major;
extern "C" int const glf90w_context_version_minor;
extern "C" int const glf90w_context_revision;
extern "C" int const glf90w_context_robustness;
extern "C" int const glf90w_opengl_forward_compat;
extern "C" int const glf90w_context_debug;
extern "C" int const glf90w_opengl_debug_context;
extern "C" int const glf90w_opengl_profile;
extern "C" int const glf90w_context_release_behavior;
extern "C" int const glf90w_context_no_error;
extern "C" int const glf90w_context_creation_api;
extern "C" int const glf90w_scale_to_monitor;
extern "C" int const glf90w_scale_framebuffer;
extern "C" int const glf90w_cocoa_retina_framebuffer;
extern "C" int const glf90w_cocoa_frame_name;
extern "C" int const glf90w_cocoa_graphics_switching;
extern "C" int const glf90w_x11_class_name;
extern "C" int const glf90w_x11_instance_name;
extern "C" int const glf90w_win32_keyboard_menu;
extern "C" int const glf90w_win32_showdefault;
extern "C" int const glf90w_wayland_app_id;
extern "C" int const glf90w_no_api;
extern "C" int const glf90w_opengl_api;
extern "C" int const glf90w_opengl_es_api;

extern "C" int const glf90w_no_robustness;
extern "C" int const glf90w_no_reset_notification;
extern "C" int const glf90w_lose_context_on_reset;

extern "C" int const glf90w_opengl_any_profile;
extern "C" int const glf90w_opengl_core_profile;
extern "C" int const glf90w_opengl_compat_profile;

extern "C" int const glf90w_cursor;
extern "C" int const glf90w_sticky_keys;
extern "C" int const glf90w_sticky_mouse_buttons;
extern "C" int const glf90w_lock_key_mods;
extern "C" int const glf90w_raw_mouse_motion;

extern "C" int const glf90w_cursor_normal;
extern "C" int const glf90w_cursor_hidden;
extern "C" int const glf90w_cursor_disabled;
extern "C" int const glf90w_cursor_captured;

extern "C" int const glf90w_any_release_behavior;
extern "C" int const glf90w_release_behavior_flush;
extern "C" int const glf90w_release_behavior_none;

extern "C" int const glf90w_native_context_api;
extern "C" int const glf90w_egl_context_api;
extern "C" int const glf90w_osmesa_context_api;

extern "C" int const glf90w_angle_platform_type_none;
extern "C" int const glf90w_angle_platform_type_opengl;
extern "C" int const glf90w_angle_platform_type_opengles;
extern "C" int const glf90w_angle_platform_type_d3d9;
extern "C" int const glf90w_angle_platform_type_d3d11;
extern "C" int const glf90w_angle_platform_type_vulkan;
extern "C" int const glf90w_angle_platform_type_metal;

extern "C" int const glf90w_wayland_prefer_libdecor;
extern "C" int const glf90w_wayland_disable_libdecor;

extern "C" int const glf90w_any_position;

extern "C" int const glf90w_arrow_cursor;
extern "C" int const glf90w_ibeam_cursor;
extern "C" int const glf90w_crosshair_cursor;
extern "C" int const glf90w_pointing_hand_cursor;
extern "C" int const glf90w_resize_ew_cursor;
extern "C" int const glf90w_resize_ns_cursor;
extern "C" int const glf90w_resize_nwse_cursor;
extern "C" int const glf90w_resize_nesw_cursor;
extern "C" int const glf90w_resize_all_cursor;
extern "C" int const glf90w_not_allowed_cursor;
extern "C" int const glf90w_hresize_cursor;
extern "C" int const glf90w_vresize_cursor;
extern "C" int const glf90w_hand_cursor;
extern "C" int const glf90w_connected;
extern "C" int const glf90w_disconnected;

extern "C" int const glf90w_joystick_hat_buttons;
extern "C" int const glf90w_angle_platform_type;
extern "C" int const glf90w_platform;
extern "C" int const glf90w_cocoa_chdir_resources;
extern "C" int const glf90w_cocoa_menubar;
extern "C" int const glf90w_x11_xcb_vulkan_surface;
extern "C" int const glf90w_wayland_libdecor;
extern "C" int const glf90w_any_platform;
extern "C" int const glf90w_platform_win32;
extern "C" int const glf90w_platform_cocoa;
extern "C" int const glf90w_platform_wayland;
extern "C" int const glf90w_platform_x11;
extern "C" int const glf90w_platform_null;
extern "C" int const glf90w_dont_care;

#endif // GLF90W_H
// -----------------
// Copyright (C) 2024 Gaétan Jalin
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
//    1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would be
//    appreciated but is not required.
//
//    2. Altered source versions must be plainly marked as such, and must not be
//    misrepresented as being the original software.
//
//    3. This notice may not be removed or altered from any source distribution.
// -----------------

