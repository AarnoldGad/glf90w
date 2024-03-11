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
