<?php

// Function that will be used to evaluate second condition being looked at
function evaluate() {
  echo 'Function visited.'.PHP_EOL;
  return true;
}

echo ''.PHP_EOL;
echo 'First testing with the variable as first condition'.PHP_EOL;

$A = 1;

// Testing with variable as first condition: T && T
echo 'Conditions: T and T'.PHP_EOL;
if ( $A == 1 && evaluate() ) {
  echo 'True'.PHP_EOL;
} else {
    echo 'False'.PHP_EOL;
}

// F && T
// This test should show us whether there is a short circuit
// If the message in the function doesn't get printed, then
// there is a short circuit in php.
echo ''.PHP_EOL;
echo 'Conditions: F and T'.PHP_EOL;
if ( $A == 0 && evaluate() ) {
  echo 'True'.PHP_EOL;
} else {
    echo 'False'.PHP_EOL;
}

echo ''.PHP_EOL;
echo 'Now testing with the function as first condition'.PHP_EOL;
echo 'Conditions: T and T'.PHP_EOL;
if ( evaluate() && $A == 1 ) {
  echo 'True'.PHP_EOL;
} else {
    echo 'False'.PHP_EOL;
}

echo ''.PHP_EOL;
echo 'Conditions: F and T'.PHP_EOL;
if ( !evaluate() && $A == 1 ) {
  echo 'True'.PHP_EOL;
} else {
    echo 'False'.PHP_EOL;
}

?>
