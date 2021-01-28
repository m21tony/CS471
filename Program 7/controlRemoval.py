# Name: Tony Maldonado
# Date: October 31, 2020
# Input: A txt file which has corrupt data in it.
# Output: A new txt file with the corrupt data removed. 
# Precondition: The txt file should exist and be named 'control-char.txt'.
# Postcondition: The file is wanted with everything in between CTRL C and
# 				 CTRL B removed. All other characters stay in place.

import string

# Open the txt file and assign it to a string
file1 = open("control-char.txt")

# New file for writing the modified contents to 
file2 = open("newPythonFile.txt", "w")

# Use a boolean flag to determine what gets printed to the new file.
# Initially flag is true, so it starts off printing fine. Once it 
# encounters a CTRL C it will set the flag to False and not print until 
# we encounter a CTRL B and set the flag to true afterwords
flag = True

for lines in file1:
	for char in lines:
		if char == chr(3):
			flag = False
		if char == chr(2):
			flag = True
			continue
		if flag == True:
			file2.write(char)

# New modified file created successfully 
print("New file created successfully: ")
print(file2.name)

# Close both files
file1.close()
file2.close()