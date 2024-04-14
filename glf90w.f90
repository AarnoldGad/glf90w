! -----------------
! glf90w.f90
! 25 Feb 2024
! Gaétan J.A.M. Jalin
! See end of file for complete licence description
! -----------------
module glf90w
    use, intrinsic :: iso_fortran_env, only: int32
    use glf90w_constants

    implicit none
    private

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
        ! -- void glfwGetError(int OUT error_code, char POINTER OPTIONAL OUT description)
        glfwGetError, &
        !glfwSetErrorCallback, &
        ! -- int glfwGetPlatform() result(platform)
        glfwGetPlatform, &
        ! -- logical glfwPlatformSupported(int IN platform) result(supported)
        glfwPlatformSupported, &
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
        ! -- char glfwGetKeyName(int IN key, int IN scancode) result(name)
        glfwGetKeyName, &
        ! -- int glfwGetKeyScancode(int IN key) result(scancode)
        glfwGetKeyScancode, &
        ! -- logical glfwJoystickPresent(int IN jid) result(jpresent)
        glfwJoystickPresent, &
        ! -- real(:) glfwGetJoystickAxes(int IN jid) result(axes)
        ! Note: The "count" parameter from the original function can be obtained from size(axes) instead
        !       size(axes) = 0 if joystick is not present (axes == NULL from C side)
        glfwGetJoystickAxes, &
        ! -- char glfwGetJoystickName(int IN jid) result(name)
        ! Note: len(name) == 0 if joystick is not present
        glfwGetJoystickName, &
        ! -- char glfwGetJoystickGUID(int IN jid) result(GUID)
        ! Note: len(name) == 0 if joystick is not present
        glfwGetJoystickGUID, &
        ! -- logical glfwJoystickIsGamepad(int IN jid) result(is_gamepad)
        glfwJoystickIsGamepad, &
        ! -- logical glfwJoystickIsGamepad(char IN mappings) result(success)
        glfwUpdateGamepadMappings, &
        ! -- char glfwGetGamepadName(int IN jid) result(name)
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

    interface
        function c_glfwInit() result(success) bind(C, name="glfwInit")
            use, intrinsic :: iso_c_binding, only: c_int

            implicit none
            integer(kind=c_int) :: success
        end function c_glfwInit
    end interface

    interface
        subroutine glfwTerminate() bind(C, name="glfwTerminate")
        end subroutine glfwTerminate
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
            integer(kind=c_int), value, intent(in)                 :: hint
            character(len=1,kind=c_char), dimension(*), intent(in) :: value
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
        function c_glfwUpdateGamepadMappings(mappings) result(success) bind(C, name="glfwUpdateGamepadMappings")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            character(len=1,kind=c_char), dimension(*), intent(in) :: mappings
            integer(kind=c_int)                                    :: success
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
            character(len=1,kind=c_char), dimension(*), intent(in) :: extension
            integer(kind=c_int)                                    :: supported
        end function c_glfwExtensionSupported
    end interface

    interface
        function c_glfwVulkanSupported() result(supported) bind(C, name="glfwVulkanSupported")
            use, intrinsic :: iso_c_binding, only: c_char, c_int

            implicit none
            integer(kind=c_int) :: supported
        end function c_glfwVulkanSupported
    end interface

    contains

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

        function glfwGetVersionString() result(str)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char
            use glf90w_c_interop, only: c_ptr_to_f_str

            implicit none
            character(:,kind=c_char), allocatable :: str

            type(c_ptr) :: cptr

            cptr = c_glfwGetVersionString()
            str = c_ptr_to_f_str(cptr)
        end function glfwGetVersionString

        subroutine glfwGetError(error_code, description)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_int, c_char
            use glf90w_c_interop, only: c_ptr_to_f_strptr

            implicit none
            integer(kind=c_int), intent(out)                         :: error_code
            character(:,kind=c_char), pointer, optional, intent(out) :: description

            type(c_ptr) :: desc_cptr

            error_code = c_glfwGetError(desc_cptr)
            if (present(description)) then
                if (c_associated(desc_cptr)) then
                    call c_ptr_to_f_strptr(desc_cptr, description)
                else
                    description => null()
                end if
            end if
        end subroutine glfwGetError

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

        subroutine glfwWindowHintString(hint, value)
            use, intrinsic :: iso_c_binding, only: c_char, c_int
            use glf90w_c_interop, only: f_to_c_str

            implicit none
            integer(kind=c_int), intent(in)          :: hint
            character(len=*,kind=c_char), intent(in) :: value

            call c_glfwWindowHintString(hint, f_to_c_str(value))
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
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_int
            use glf90w_c_interop, only: c_ptr_to_f_str

            implicit none
            integer(kind=c_int), intent(in)       :: key
            integer(kind=c_int), intent(in)       :: scancode
            character(:,kind=c_char), allocatable :: name

            type(c_ptr) :: cptr

            cptr = c_glfwGetKeyName(key, scancode)
            name = c_ptr_to_f_str(cptr)
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

            real(kind=c_float), dimension(:), pointer :: ptr
            integer(kind=c_int) :: count
            type(c_ptr) :: cptr

            cptr = c_glfwGetJoystickAxes(jid, count)
            if (c_associated(cptr)) then
                call c_f_pointer(cptr, ptr, (/count/))
                axes = ptr
            else
                ! Allocate 0-size array if nullptr
                allocate(axes(0))
            end if
        end function glfwGetJoystickAxes

        function glfwGetJoystickName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int
            use glf90w_c_interop, only: c_ptr_to_f_str

            implicit none
            integer(kind=c_int), intent(in)       :: jid
            character(:,kind=c_char), allocatable :: name

            type(c_ptr) :: cptr

            cptr = c_glfwGetJoystickName(jid)
            if (c_associated(cptr)) then
                name = c_ptr_to_f_str(cptr)
            else
                ! Allocate 0-len char if nullptr
                allocate(character(0) :: name)
            end if
        end function glfwGetJoystickName

        function glfwGetJoystickGUID(jid) result(GUID)
            use, intrinsic :: iso_c_binding, only: c_associated, c_ptr, c_char, c_int
            use glf90w_c_interop, only: c_ptr_to_f_str

            implicit none
            integer(kind=c_int), intent(in)       :: jid
            character(:,kind=c_char), allocatable :: GUID

            type(c_ptr) :: cptr

            cptr = c_glfwGetJoystickGUID(jid)
            if (c_associated(cptr)) then
                GUID = c_ptr_to_f_str(cptr)
            else
                ! Allocate 0-len char if nullptr
                allocate(character(0) :: GUID)
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

        function glfwUpdateGamepadMappings(mappings) result(success)
            use, intrinsic :: iso_c_binding, only: c_char, c_int
            use glf90w_c_interop, only: f_to_c_str

            implicit none
            character(len=*,kind=c_char), intent(in) :: mappings
            logical                                  :: success

            integer(kind=c_int) :: res

            res = c_glfwUpdateGamepadMappings(f_to_c_str(mappings))
            if (res == GLFW_TRUE) then
                success = .true.
            else
                success = .false.
            end if
        end function glfwUpdateGamepadMappings

        function glfwGetGamepadName(jid) result(name)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char, c_int
            use glf90w_c_interop, only: c_ptr_to_f_str

            implicit none
            integer(kind=c_int), intent(in)       :: jid
            character(:,kind=c_char), allocatable :: name

            type(c_ptr) :: cptr

            cptr = c_glfwGetGamepadName(jid)
            name = c_ptr_to_f_str(cptr)
        end function glfwGetGamepadName

        function glfwExtensionSupported(extension) result(supported)
            use, intrinsic :: iso_c_binding, only: c_char, c_int
            use glf90w_c_interop, only: f_to_c_str

            implicit none
            character(len=*,kind=c_char), intent(in) :: extension
            logical                                  :: supported

            integer(kind=c_int) :: res

            res = c_glfwExtensionSupported(f_to_c_str(extension))
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

end module glf90w
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

