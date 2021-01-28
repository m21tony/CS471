# Name: Tony Maldonado
# Date: September 27, 2020
#
# Description: This program is a modification of the 
#       implementation of the Gaussian Elimination 
#       algorithm in Python, /without/ using the Numpy module.
#
# Note: This program uses a no pivoting method.
# 
# Input: A number n for the size of the matrix
#
# Output: The time t for which it took to compute
#       the matrix elimination
# 
# Preconditions: The input (for matrix size) must be a 
#       positive integer
#
# Postconditions: None.
# 
# Source code: https://learnche.org/3E4/Assignment_2_-_2010_-_Solution/Bonus_question


import random
import time

# Calculates the forward part of Gaussian Elimination
def forward_elimination (A, b, n):

    for row in range(0, n-1):
        for i in range(row + 1, n):

            factor = A[i][row]/A[row][row]
            for j in range(row, n):
                A[i][j] = A[i][j] - factor * A[row][j]

            b[i] = b[i] - factor * b[row]

    return A, b

# Calculates the back substitution part of Gaussian Elimination
def back_substitution(a, b, n):

    x = [[0. for i in range(n)] for k in range(n)]
    x[n-1] = b[n-1] / a[n-1][n-1]

    for row in range (n-2, -1, -1):
        sums = b[row]
        for j in range(row + 1, n):
            sums = sums - a[row][j] * x[j]

        x[row] = sums / a[row][row]

    return x

# Calculates the Gaussian Elimination without pivoting
def gauss(A,b,n):

    A, b = forward_elimination(A,b,n)
    return back_substitution(A,b,n)

def main():

    n = input("Enter a positive integer n for matrix size: ")
    n = int(n)
    A = []

    # Fill matrix with random numbers
    for i in range(n):
        b = []
        for j in range(n):
            b.append(random.random())

        A.append(b)

    print('')
    print("Starting Gaussian Elimination on matrix..")
    print("Starting timer...")

    # Start timer
    start = time.time()

    gauss(A,b,n) #solving

    print("Stopping timer...")
    print('')

    # Stop the timer
    end = time.time()

    # Output the time solution took
    print('Time it took to run was: ', end - start, 'seconds.')
    print('')

if __name__ == '__main__':
    main()



