# Name: Tony Maldonado
# Date: October 31, 2020
# Input: A txt file which has corrupt data in it.
# Output: A new txt file with the corrupt data removed.
# Preconditions: The txt file should exist and be named 'control-char.txt'.
# Postconditions: The file is wanted with only printable characters.
# 				e.g., no control blocking chars and no carriage return

#!/usr/bin/perl
use strict;
use warnings;

# Variable declarations:
# These are the input and output files
my $inputFile = "control-char.txt";
my $outputFile = "newPerlFile.txt";
# String will store the final string
my $fileString = "";
# Flag to determine whether we should print
my $flag = 1;
# Read and char are for the file reader
my $read;
my $char;

# Open the file in read mode
open FH, '<', $inputFile or die "No such file, can't open! $!";

# Use an integer flag to determine what gets printed to the new file.
# Initially flag is true, so it starts off printing fine. Once it 
# encounters a CTRL C it will set the flag to False and not print until 
# we encounter a CTRL B and set the flag to true afterwords
while ($read = read FH, $char, 1) {
	# CTRL C sets flag to 0 and doesn't print
	if (ord($char) == 3) {
		$flag = 0;
	}
	# CTRL B sets flag to 1
	if (ord($char) == 2) {
		$flag = 1;
	}
	# Skip to next iteration
	next if (ord($char) == 2);
	if ($flag ==1){
		$fileString .= $char;
	}
}

# Create the file for the output and print to it
open FH, '>', $outputFile or die "No such file, can't open! $!";
print FH $fileString;
print "New file created successfully: $outputFile\n";