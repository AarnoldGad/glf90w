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
        ! -- void glfwGetVersionString(char OUT str)
        glfwGetVersionString, &
        !glfwGetError, &
        !glfwSetErrorCallback, &
        ! -- int glfwGetPlatform() result(platform)
        glfwGetPlatform, &
        ! -- logical glfwPlatformSupported(int IN platform) result(supported)
        glfwPlatformSupported

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

        subroutine glfwGetVersionString(str)
            use, intrinsic :: iso_c_binding, only: c_ptr, c_char
            use glf90w_c_interop, only: c_f_str

            implicit none
            character(:,kind=c_char), allocatable, intent(out) :: str
            type(c_ptr) :: cstr

            cstr = c_glfwGetVersionString()
            call c_f_str(cstr, str)
        end subroutine glfwGetVersionString

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

