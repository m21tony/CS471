with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure program2 is
  A : Integer;

  -- Function that will be used for testing. If visited, then
  -- it will print the message, if not visited, then it won't
  -- print the message and we will know there was a short circuit

  function Evaluation return Integer is
  begin
    Put_Line("Function visited");
    return 1;
  end Evaluation;

begin
  A := 1;

  -- We begin by testing the AND operator
  Put_Line("First we test the AND operator:");

  Put_Line("");
  Put_Line("First testing with the variable as first condition");
  Put_Line("Conditions: T and T");
  if A = 1 and Evaluation = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  -- This test should show us whether there is a short circuit
  -- If the message in the function doesn't get printed, then
  -- there is a short circuit in ada.

  Put_Line("");
  Put_Line("Conditions: F and T");
  if A = 0 and Evaluation = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  Put_Line("");

  Put_Line("");
  Put_Line("Now testing with the function as first condition");
  Put_Line("Conditions: T and T");
  if Evaluation = 1 and A = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  Put_Line("");
  Put_Line("Conditions: F and T");
  if Evaluation = 0 and A = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  Put_Line("");

  -- We now test the AND THEN operator
  Put_Line("Now we test the AND THEN operator:");

  Put_Line("");
  Put_Line("First testing with the variable as first condition");
  Put_Line("Conditions: T and then T");
  if A = 1 and then Evaluation = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  -- The following test should show us whether there is a short
  -- circuit. If the message in the function doesn't get printed,
  -- then there is a short circuit in ada.

  Put_Line("");
  Put_Line("Conditions: F and then T");
  if A = 0 and then Evaluation = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  Put_Line("");

  Put_Line("");
  Put_Line("Now testing with the function as first condition");
  Put_Line("Conditions: T and then T");
  if Evaluation = 1 and then A = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

  Put_Line("");
  Put_Line("Conditions: F and then T");
  if Evaluation = 0 and A = 1 then
    Put_Line("True");
  else
    Put_Line("False");
  end if;

end program2;
