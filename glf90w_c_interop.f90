! -----------------
! glf90w_c_interop.f90
! 11 Mar 2024
! Gaétan J.A.M. Jalin
! See end of file for complete licence description
! -----------------
module glf90w_c_interop
    implicit none

    interface
        pure function c_strlen(cstr) result(length) bind(C, name="strlen")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
            implicit none
            type(c_ptr), value, intent(in) :: cstr
            integer(kind=c_size_t)         :: length
        end function c_strlen
    end interface

    contains

        subroutine c_f_str(cstr, fstr)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_char, c_size_t

            implicit none
            type(c_ptr), intent(in) :: cstr
            character(:, kind=c_char), allocatable, intent(out) :: fstr
            integer(c_size_t) :: n

            n = c_strlen(cstr)
            allocate(character(n, kind=c_char) :: fstr)

            block
                character(n, kind=c_char), pointer :: view
                call c_f_pointer(cstr, view)
                fstr = view
            end block
        end subroutine c_f_str

end module glf90w_c_interop
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

