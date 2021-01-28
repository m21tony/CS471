/*
* Name: Tony Maldonado
* Date: October 26, 2020
* Input: None
* Output: The output of alert() which is the value of x
* Precondition: None
* Postcondition: None
*/

// Run function sub1()
sub1();

function sub1() {
    var x;
    function sub2() {
        // Creates a dialog box with the value of x
        console.log("The value of x is: " + x);
    }
    function sub3() {
        var x;
        x = 3;
        sub4(sub2);
    }
    function sub4(subx) {
        var x;
        x = 4;
        subx();
    }
    x = 1;
    sub3();
}