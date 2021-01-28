#!/usr/bin/perl

# Name: Tony Maldonado
# Date: September 09, 2020
#
# Input: None
# Output: Whether the second condition is evaluated or not after
#         the first condition in an AND conditional statement
#         evaluates as False
#
# Preconditions: None
# Postconditions: None

# Function that will be used for testing. If visited, then
# it will print the message, if not visited, then it won't
# print the message and we will know there was a short circuit
sub evaluate {
  printf "Function visited\n";
  return 1;
}

$a = 1;

printf "\n";
printf "First testing with the variable as first condition\n";

# Testing with variable as first condition
# Test for both conditions as True
printf "\n";
printf "Conditions: T and T\n";
if ($a == 1 && evaluate() ) {
  printf "True\n";
} else {
    printf "False\n";
}

# Now with False && True
# The following test shows that Perl DOES short circuit
# because $a is NOT 0 therefore the first of the if
# statement is FALSE and since in the output we don't see
# the print statement from evaluate(), we know it doesn't
# check after evaluating the first as a false.
printf "\n";
printf "Conditions: F and T\n";
if ($a == 0 && evaluate() ) {
  printf "True\n";
} else {
    printf "False\n";
}

printf "\n";

printf "Now testing with the function as first condition\n";
# First True && True
printf "\n";
printf "Conditions: T and T\n";
if (evaluate() && $a == 1) {
  printf "True\n";
} else {
    printf "False\n";
}

# Then False && True
printf "\n";
printf "Conditions: F and T\n";
if (!evaluate() && $a == 1) {
  printf "True\n";
} else {
    printf "False\n";
}

printf "\n";
