# Read word list from file
# Dictionary-List will read the words in Doc3.txt
dictionary_list <- readLines("Doc3.txt")

# Choose a random word from the list
correct_word <- sample(dictionary_list, 1)

#providing the user with the number of letters in the word
#using the nchar function to provide the number of letters
#Using the cat function to concatenate and print a text message that includes the number of charactersword_length <- nchar(correct_word)
cat("The correct word has", word_length, "letters.\n")

#Defined the number of wrong guesses allowed, and concatenated it with text to be printed to the user in the consolemax_wrong_guesses <- 10
cat("You are allowed", max_wrong_guesses, "wrong guesses.\n")

# Initialize variables

#created dashes that are equivalent to the number of letters in the word that need to be guessed by the user
guesses <- rep("_", word_length)

#created a function that displays the word with blanks equivalent to the length of the word
#cat is used to concatenate the correct letters guessed into a single string 
#collapse="" will add spaces between characters 
display_word <- function(guesses) {
  cat(paste(guesses, collapse = " "), "\n")
}

#created a main loop for the game 
wrong_guesses <- 0
# this loop will run until the number of wrong guesses (wrong_guesses) is less than the maximum allowed wrong guesses (max_wrong_guesses)
# while loop allows user to continue playing until number of guesses is greater than maximum wrong guesses allowed, or if they have guessedthe word correctly
while (wrong_guesses < max_wrong_guesses) {
  
  # Display the current state of the word
  display_word(guesses)
  
  # Ask for user input
  user_input <- readline("Enter a letter or type 'guess' to guess the whole word: ")
  
  # Check if user wants to guess the whole word
  # "tolower" condition checks if the user input, after converting it to lowercase 
  if (tolower(user_input) == "guess") {
    guessed_word <- readline("Enter your guess: ")
    #if statement is used to compare the lowercase version of the user's guess (tolower(guessed_word)) with the lowercase version of the correct word.hecks if the user's guess matches the correct word.
    if (tolower(guessed_word) == tolower(correct_word)) {
      # if the user's guess matches the correct word:
      cat("Congratulations! You guessed the word correctly.\n")
      #break statement is used to exit the loop 
      break
    } else {
      # if the user's guess does not match the correct word:
      cat("Sorry, your guess is incorrect.\n")
      break
    }
    
    
    # Check if user input is a single letter
    if (nchar(user_input) != 1) {
      cat("Please enter only one letter.\n")
      next
    }
    
  }
  # Update guessed letters and check if the letter is found in the correct word
  found <- FALSE
  for (i in 1:word_length) {
    # substr extracts a substring from the correct_word starting at position i and ending at position i
    # tolower function converts the extracted substring to lowercase
    if (tolower(user_input) == tolower(substr(correct_word, i, i))) {
      # guesses[i] updates the "guesses" vector by assigining the character at position i in the correct_word to the corresponding position i in the guesses
      guesses[i] <- substr(correct_word, i, i)
      #set found to TRUE to indicate when a match is found.
      found <- TRUE
    }
  } #this condition checks if the variable found is TRUE
  if (found) {
    #if true
    cat("Congratulations! The letter is in the word.\n")
  } else { #if not true (the inpit doesnt match a correct letter in the word)
    cat("Sorry, the letter is not in the word.\n")
    wrong_guesses <- wrong_guesses + 1
  }
  # Check if all letters have been guessed correctly
  if (all(guesses != "_")) {
    cat("Congratulations! You guessed the word correctly.\n")
    break
  }
  
  # Notify user about the number of tries left
  cat("Remaining wrong guesses:", max_wrong_guesses - wrong_guesses, "\n")
}
# If all tries are finihsed, reveal the correct word
if (wrong_guesses >= max_wrong_guesses) {
  cat("Sorry, better luck next time! The correct was:", correct_word, "\n")
}

#*Code Review by Soumya Shastri 

#*Line 3: The text file attached to your submission was titled "Doc3-1.txt" whereas 
#*the readline function read "Doc3-text"; this results in an error message when you 
#*source since no such file or directory exists. For the purposes of reviewing the 
#*remainder of the code and to test its functionality, I changed the name of the
#*file path to the correct title. 
#*
#*Line 6: Choosing a random element from the list works well using the sample() function. Good job!  
#*
#*Line 11: The next error message that appears once the text file name is corrected is that 
#*the object "word_length" was not found since it was never defined in the code. This prevents
#*further code that references "word_length" from working as it should. I'd recommend that 
#*as you are providing information to the user about the letters in the word and the number 
#*of wrong guesses they are allowed, also to provide the instructions or perhaps create a welcome
#*message to the user to let them know they can start the game 
#*
#*Line 14: The object, "max_wrong_guesses" was not defined and hence was also not found in the code 
#*
#*Line 19-25: In order to display the progress of the user, I also used the dash method as a visual cue, 
#*it may work, but since it references 'word_length', I cannot run to test and see. 
#*
#*Line 42: The code appears to correctly handle the acceptance of both lowercase and uppercase letters. Unfortunately, I am 
#*unable to directly test this functionality due to the previously mentioned undefined objects. 
#*
#*Line 52: Regarding the game flow, it is unclear whether the user can continue making guesses after an incorrect word 
#*guess. Typically, in Hangman, once the entire word is guessed, the game is over. If the guess is incorrect, the answer 
#*is revealed at that point.
#*
#*Line 57: Although this code verifies that the user has entered a single character, it would be advantageous to add an 
#*additional check to ensure that the user input is specifically a letter. This can be done using the 'grep' function, for
#*example, which was learned last week. 
#*
#*Line 65-86: As the user guesses character by character, it would be beneficial to replace the dashes in the visual 
#*representation with the correct letters. This would allow the user to observe their progress throughout the game.
#*
#*Final comments: Overall, most of the requirements of the assignment were attempted. The code is accompanied 
#*by detailed comments at each step, which greatly aids in understanding its functionality. However, I highly 
#*recommend thoroughly testing the code by running and sourcing it multiple times to ensure its full functionality. 
#*Although I wasn't able to play your game this time, once the major concerns have been resolved, I'd be delighted 
#*to try it once again. 
