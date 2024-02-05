#!/bin/bash

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER(){
  echo "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM USERS WHERE user_name='$USERNAME'")
  if [[ $USER_ID ]]
  then
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id='$USER_ID'")
    echo "here"

    BEST_GUESS=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = '$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
  else
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    INSERTED_INTO_USERS=$($PSQL "INSERT INTO users(user_name) VALUES('$USERNAME')")
  
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME'")
  fi
  
  PLAY_GAME
}

PLAY_GAME(){
  SECRET=$((1 + $RANDOM % 1000))

  COUNT_GUESS=0

  GUESSED=0

  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]; do
    read GUESS

    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $SECRET = $GUESS ]]; then
      COUNT_GUESS=$(($COUNT_GUESS + 1))
      echo -e "\nYou guessed it in $COUNT_GUESS tries. The secret number was $SECRET. Nice job!"
      
      INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(user_id, guesses) values($USER_ID, $COUNT_GUESS)")
      GUESSED=1
    elif [[ $SECRET -gt $GUESS ]]; then
      COUNT_GUESS=$(($COUNT_GUESS + 1))
      echo -e "\nIt's higher than that, guess again:"
    else
      COUNT_GUESS=$(($COUNT_GUESS + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
}

USER
