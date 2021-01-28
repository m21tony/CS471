/*
 * CS 471 - Program 5: Exception Handling in Java
 * Name: Tony Maldonado
 *
 * Date: October 05, 2020
 * 
 * Input: A grade or list of grades, between 0-89, entered by pressing enter
 *      after each
 * 
 * Output: A distribution of the grades within the limits
 * 
 * Preconditions: The user must enter a grade(s) within the range 0-89. To stop 
 *      the input and print the distribution, the user should enter '-1'.
 * 
 * Postcondition: none
*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Collections;

public class grade_distribution {
    
    // Creating the arrays for the grade limits and frequency counters
    private ArrayList<Integer> limits = new ArrayList<>();
    private ArrayList<Integer> frequencies = new ArrayList<>();

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Create an array to store the grades
        ArrayList<Integer> grades = new ArrayList<Integer>();

        // Create an object for the distribution
        grade_distribution Distribution = new grade_distribution();

        // Input the grades until -1 is entered
        int input = 0;
        System.out.println("Please enter the grade, type -1 when done. ");
        do{
            try {

                input = Integer.parseInt(scan.nextLine());
            
                if(input != -1){

                    // Throw ArithmeticException if input is out of bounds
                    if(input < 0 || input > 100) {
                        throw new ArithmeticException();
                    }

                    // Throw IOException to add to frequency array
                    else {
                        throw new IOException();
                    }
                }

            } catch (ArithmeticException e) {
                System.out.println("Error -- enter new grade; " + input + " is out of range.");
            } catch (IOException i) {
                Distribution.updateFrequency(grades, input);
            } catch (NumberFormatException n) {
                System.out.println("Invalid, integers only please!");
            }
        } while(input != -1);

        // Print the final output
        Distribution.printFrequency();
    }

    // This constructor creates the arraylists for the limits and sets all frequency counters to 0
    public grade_distribution(){
        Collections.addAll(limits, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 101);
        Collections.addAll(frequencies, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }

    public void updateFrequency(ArrayList<Integer> gradeList, int userInput){

        // Add the user input to the arraylist
        gradeList.add(userInput);

        // Match the grades in the list to the ranges
        for(int i = 0; i < limits.size() -1 ; i++){
            if(userInput >= limits.get(i) && userInput < limits.get(i + 1)){

                // Add to the frequency counter
                frequencies.set(i, frequencies.get(i) + 1);
            }
        }
    }

    // Now print out the frequency table
    public void printFrequency(){
        System.out.println(String.format("%-2s %-20s %-20s", "", "Limits", "Frequency"));
        
        for(int i = 0; i < frequencies.size(); i++){
            System.out.print(String.format("%-10d %-15d", limits.get(i), limits.get(i+1) - 1));
            System.out.println(frequencies.get(i));
        }
    }
}
