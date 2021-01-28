/* 
* Name: Tony Maldonado
* Date: November 01, 2020
* Input: A txt file which has corrupt data in it
* Output: A new txt file with the corrupt data removed.
* Preconditions: The text file should exist and be named 'control-char.txt'.
* Postconditions: The file is wanted with everything in between CTRL C and
* 				  CTRL B removed. All other characters stay in place.
*/

/* Sources:
*	https://stackoverflow.com/questions/811851/how-do-i-read-input-character-by-character-in-java
*	https://www.baeldung.com/java-write-to-file
* 	https://stackoverflow.com/questions/5868369/how-can-i-read-a-large-text-file-line-by-line-using-java
*/ 

import java.io.*;
import java.util.*;
import java.nio.file.*;

public class controlRemoval {
	public static void main (String [] args) throws IOException {
		
		// First read the input file stream 
		FileInputStream fstream = new FileInputStream("control-char.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));

		// Then create the new output file
		BufferedWriter writer = new BufferedWriter(new FileWriter("newJavaFile.txt"));

		// Use an integer flag to determine what gets printed to the new file.
		// Initially flag is true, so it starts off printing fine. Once it 
		// encounters a CTRL C it will set the flag to False and not print until 
		// we encounter a CTRL B and set the flag to true afterwords
		int flag = 1;
		int r;
		
		while ((r = br.read()) != -1) {
			char ch = (char) r;
			if (ch == 0x3)
				flag = 0;
			if (ch == 0x2){
				flag = 1;
				continue;
			}
			if (flag == 1)
				writer.write(ch);
		}

		System.out.println("New file successfully created: newJavaFile.txt");

		/// Close both files
		fstream.close();
		writer.close();
	}	
}