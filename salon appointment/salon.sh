#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAKE_APPOINTMENT(){
  SERVICE_ID=$1
  SERVICE_ID=$(echo $SERVICE_ID | sed -r 's/ //g')
  echo -e "\nEnter phone number"
  read CUSTOMER_PHONE

  IS_CUSTOMER_EXIST=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $IS_CUSTOMER_EXIST ]]
  then
    echo -e "\nEnter name"
    read CUSTOMER_NAME
    NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  echo -e "\nEnter Service Time"
  read SERVICE_TIME
    
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$(echo $CUSTOMER_ID | sed -r 's/ //g')
  
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID', '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID'")
  CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  SERVICE_NAME=$($PSQL "SELECT * FROM services")
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nNo services available"
  else
    echo "$SERVICE_NAME" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    echo -e "\nEnter Service Number from above"
    read SERVICE_ID_SELECTED

    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid service number."
    else
      VALID_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
      if [[ -z $VALID_SERVICE_ID ]]
      then
        MAIN_MENU "Enter valid service number"
      else
        MAKE_APPOINTMENT "$VALID_SERVICE_ID"
      fi
    fi
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?"
