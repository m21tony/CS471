#!/bin/sh

a=1

# Rather than using a function as the second condition,
# I will be using a simple 'echo' statement to test whether
# it gets evaluated after the first condition is False

# First test with variable as first condition
# True && True
echo ""
echo "First testing with the variable as first condition"
echo "Conditions: T and T"
if [[ $a == 1 ]] && echo "Visited"
then
  echo "True"
else
  echo "False"
fi

# False && True
# This test should show us whether there is a short circuit
# If the echo statement doesn't get printed, then
# there is a short circuit in shell.
echo ""
echo "Conditions: F and T"
if [[ $a == 0 ]] && echo "Visited"
then
  echo "True"
else
  echo "False"
fi

# Then test with echo first
# True && True
echo ""
echo "Now testing with the echo as first condition"
echo "Conditions: T and T"
if echo "Visited" && [[ $a == 1 ]]
then
  echo "True"
else
  echo "False"
fi

# False && True 
echo ""
echo "Conditions: F and T"
if echo "Visited" && [[ $a == 0 ]]
then
  echo "True"
else
  echo "False"
fi
