MODULE  MODULE_INITIALCONDITION
    
    use MODULE_PRECISION
    use MODULE_NODECOORD
    use MODULE_CONSTANTS
    use MODULE_QUADTREE
    use MODULE_GENERICMETHOD
    
    contains
!==================================================================================================
    subroutine initial_2D_simle_check_grid(nelm, tree)
    implicit none
    integer(ip),                    intent(in)              :: nelm
    type(quadtree), dimension(:),   intent(inout), target   :: tree
    
    integer(ip) :: i
    
    !call loop_on_quadtree_array(1, nelm, tree, initial_2d_dambreak_single_level)
    call loop_on_quadtree_array(1, nelm, tree, initial_2d_01_simple)
    
    return
    end subroutine  initial_2D_simle_check_grid
!================================================================================================== 
    subroutine initial_2d_dambreak_single_level(tree)
    implicit none
    type(quadtree), pointer, intent(inout) :: tree
    
    if (tree%pts(5)%coord(1) >= half .and. tree%pts(5)%coord(2) <= half) then 
        tree%u(:) = one
        tree%w(:) = one
    else
        tree%u(:) = zero
        tree%w(:) = zero
    endif

    return
    end subroutine  initial_2d_dambreak_single_level
!================================================================================================== 
    subroutine initial_2d_01_simple(tree)
    implicit none
    type(quadtree), pointer, intent(inout) :: tree
    
    if (tree%pts(5)%coord(1) >= 0.3 .and. tree%pts(5)%coord(1) <= 0.7 .and. &
        tree%pts(5)%coord(2) >= 0.3 .and. tree%pts(5)%coord(2) <= 0.7           ) then 
        tree%u(:) = one
        tree%w(:) = one
    else
        tree%u(:) = zero
        tree%w(:) = zero
    endif

    return
    end subroutine initial_2d_01_simple
!================================================================================================== 
    subroutine initial_2d_02_simple(tree)
    implicit none
    type(quadtree), pointer, intent(inout) :: tree
    
    if (tree%pts(5)%coord(1) >= 0.35 .and. tree%pts(5)%coord(1) <= 0.75 .and. &
        tree%pts(5)%coord(2) >= 0.35 .and. tree%pts(5)%coord(2) <= 0.75           ) then 
        tree%u(:) = one
        tree%w(:) = one
    else
        tree%u(:) = zero
        tree%w(:) = zero
    endif

    return
    end subroutine initial_2d_02_simple    
!==================================================================================================    
!==================================================================================================    
    
END MODULE  MODULE_INITIALCONDITION    