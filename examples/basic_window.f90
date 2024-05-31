program basic_window
    use glf90w

    implicit none
    type(GLFWwindow_ptr) :: window
    integer :: major, minor, rev

    call glfwSetErrorCallback(handle_error)

    if (.not. glfwInit()) stop 'glfwInit()'

    print '(''Linked: '',A)', glfwGetVersionString()
    call glfwGetVersion(major, minor, rev)
    print '(''Compiled: '',3(I1,''.''))', major, minor, rev

    window = glfwCreateWindow(800, 600, 'GLF90W Basic App')
    if (.not. associated(window)) stop 'glfwCreateWindow()'

    do
        call glfwPollEvents()

        if (glfwWindowShouldClose(window)) exit
    end do

    call glfwDestroyWindow(window)
    call glfwTerminate()

    contains

        subroutine handle_error(code, desc)
            implicit none
            integer, intent(in) :: code
            character(*), intent(in) :: desc

            print '(''Error '', I8,'' : '',A)', code, desc
        end subroutine handle_error

end program basic_window
