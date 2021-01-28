! Name: Tony Maldonado
! Date: September 27, 2020
!
! Description: This program is an implementation of 
!       the Gaussian Elimination algorithm in Fortran.
! 
! Input: A number n for the size of the matrix
!
! Output: The time t for which it took to compute
!       the matrix elimination
! 
! Preconditions: The input (for matrix size) must be a 
!       positive integer
!
! Postconditions: None.
! 
! Source code: https://labmathdu.wordpress.com/gaussian-elimination-without-pivoting/

program gauss
    IMPLICIT NONE

    REAL:: start, finish !time vars

    INTEGER::i,j,n !loop vars

    REAL::s
    REAL,allocatable,DIMENSION(:,:)::a !Allocating space
    REAL,allocatable,DIMENSION(:)::x !Allocating space

    PRINT  '("Enter a positive integer n for matrix size: ")'

    READ *, n !Reading in matrix size

    allocate(a(n,n+1)) !Allocating space
    allocate(x(n)) !Allocating space


    CALL RANDOM_NUMBER(a) !Filling matrix
    CALL RANDOM_NUMBER(x) !Filling matrix

    CALL cpu_time(start) !Starting timer

    do j=1,n !Calculations
        do i=j+1,n
            a(i,:)=a(i,:)-a(j,:)*a(i,j)/a(j,j)
        end do
    end do

    do i=n,1,-1 !Calculation part 2
        s=a(i,n+1)
        do j=i+1,n
            s=s-a(i,j)*x(j)
        end do
        x(i)=s/a(i,i)
    end do

    CALL cpu_time(finish) !stopping timer

    print '("Time to run is ",f6.3," seconds.")',finish-start !printing formatted time

end program gauss

