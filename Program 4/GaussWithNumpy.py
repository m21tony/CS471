# Name: Tony Maldonado
# Date: September 27, 2020
#
# Description: This program is an implementation of 
#       the Gaussian Elimination algorithm in Python
#       using the Numpy module.
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

import numpy as np
import random
import time

def main():

    n = input("Enter a positive integer n for matrix size: ")
    n = int(n)

    # Fill matrix with random numbers
    A = np.random.rand(n,n)
    b = np.random.rand(n)

    print('')
    print("Starting Gaussian Elimination on matrix..")
    print("Starting timer...")
    # Start timer; BEFORE Gaussian Elimination
    start = time.time()

    # Run Gaussian Elimination on matrix
    x = np.linalg.solve(A,b)

    print("Stopping timer...")
    print('')

    # Stop the timer
    end = time.time()

    # Output the time solution took
    print('Time it took to run was: ', end - start, 'seconds.')
    print('')

if __name__ == '__main__':
    main()


