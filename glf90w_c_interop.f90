! -----------------
! glf90w_c_interop.f90
! 11 Mar 2024
! Gaétan J.A.M. Jalin
! See end of file for complete licence description
! -----------------
module glf90w_c_interop
    implicit none
    private

    public :: f_to_c_str, c_to_f_str, c_ptr_to_f_str, c_ptr_to_f_strptr

    interface
        pure function c_strlen(cstr) result(length) bind(C, name="strlen")
            use, intrinsic :: iso_c_binding, only: c_ptr, c_size_t
            implicit none
            type(c_ptr), value, intent(in) :: cstr
            integer(kind=c_size_t)         :: length
        end function c_strlen
    end interface

    contains

        pure function f_to_c_str(fstr) result(cstr)
            use, intrinsic :: iso_c_binding, only: c_char, c_null_char

            implicit none
            character(len=*), intent(in)                          :: fstr
            character(len=1, kind=c_char), dimension(len(fstr)+1) :: cstr

            integer :: i

            do i = 1,len(fstr)
                cstr(i) = fstr(i:i)
            end do
            cstr(len(fstr) + 1) = c_null_char
        end function f_to_c_str

        pure function c_to_f_str(cstr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_char

            implicit none
            character(len=1, kind=c_char), dimension(:), intent(in) :: cstr
            character(len=size(cstr), kind=c_char)                  :: fstr

            integer :: i

            do i = 1,size(cstr)
                fstr(i:i) = cstr(i)
            end do
        end function c_to_f_str

        function c_ptr_to_f_str(cptr) result(fstr)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr), intent(in)                    :: cptr
            character(len=:, kind=c_char), allocatable :: fstr

            character(len=1, kind=c_char), dimension(:), pointer :: cstr

            call c_f_pointer(cptr, cstr, (/c_strlen(cptr)/))
            fstr = c_to_f_str(cstr)
        end function c_ptr_to_f_str

        subroutine c_ptr_to_f_strptr(cptr, fptr)
            use, intrinsic :: iso_c_binding, only: c_f_pointer, c_ptr, c_char

            implicit none
            type(c_ptr), intent(in)                        :: cptr
            character(:,kind=c_char), pointer, intent(out) :: fptr

            character(len=c_strlen(cptr),kind=c_char), pointer :: temp

            call c_f_pointer(cptr, temp)
            fptr => temp
            temp => null()
        end subroutine c_ptr_to_f_strptr

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

