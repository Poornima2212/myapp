# README

String Calculator TDD Kata


Steps:
Create a simple String calculator with a method signature:

int Add(string numbers)

The method can take up to two numbers, separated by commas, and will return their sum. (for an empty string it will return 0) 


Hints:
 - Start with the simplest test case of an empty string and move to one and two numbers.
 - Allow the Add method to handle an unknown amount of numbers
 - Allow the Add method to handle new lines between numbers (instead of commas).
 - the following input is ok: “1\n2,3” (will equal 6). the following input is NOT ok: “1,\n”.
 - Support different delimiters. to change a delimiter, the beginning of the string will contain a separate line that looks like this: “//[delimiter]\n[numbers…]” - for example 
   “//;\n1;2” should return three where the default delimiter is ‘;’ .
 - Calling Add with a negative number will throw an exception “negatives not allowed” - and the negative that was passed. if there are multiple negatives, show all of them in the 
   exception message.
 - Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6
 - Allow multiple delimiters like this: “//[delim1][delim2]\n” for example “//[*][%]\n1*2%3” should return 6.
 - Make sure you can also handle multiple delimiters with length longer than one char
