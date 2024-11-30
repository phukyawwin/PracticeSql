#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

SECRET_NUMBER=$((1+ RANDOM % 1000 ))
#SECRET_NUMBER=9
NUMBER_OF_GUESSES=0

USER_COUNT=$($PSQL "SELECT count(name) FROM games WHERE name='$USERNAME';")

if [[ $USER_COUNT -eq 0 ]]
then
	echo -e "Welcome, $USERNAME! It looks like this is your first time here."
 #	INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
else
  STATS=$($PSQL "SELECT COUNT(*),MIN(number_of_guesses) from games WHERE name='$USERNAME';")
  
   IFS="|"
   read -a STATS_ARRAY <<< $STATS
	 echo "Welcome back, $USERNAME! You have played ${STATS_ARRAY[0]} games, and your best game took ${STATS_ARRAY[1]} guesses."
fi

function MAKE_A_GUESS() {
NUMBER_FOUND=0
echo "Guess the secret number between 1 and 1000:"
while [ $NUMBER_FOUND -eq 0 ]
do	
	read USER_GUESS
	NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))

	if [[ ! $USER_GUESS  =~ ^[0-9]+$ ]]
	  then
		echo "That is not an integer, guess again:"
	else
		if [[ $USER_GUESS  -eq $SECRET_NUMBER ]]
		then
		  INSERT_RESULT=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "INSERT INTO games(name, number_of_guesses) VALUES('$USERNAME', $NUMBER_OF_GUESSES);")
		  echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
		  NUMBER_FOUND=1
		elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]  
		then
		  echo "It's lower than that, guess again:"
		elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]  
		then
		  echo "It's higher than that, guess again:"
	  fi
	fi
done
}

MAKE_A_GUESS