#!/bin/bash

# what is a function ?
# Function is to capture the repititive block abd can be used on need basics.

 # when to use fundtcions ?
 # whenever you want to use some block of code n number of times, rather writing n number of times, you can declare it as a function and can call it on need basis

# Declaring a function

sample() {
    echo "I am a sample function with name sample"
    echo "I am executing the sample function"
    echo "sample function is completed"

    echo "calling Status Function"
    status
}

status() {
    echo -e "Good Morning and todays date is \e[32m $(date +%F)  \e[0m"
    echo -e "Number of opened sessions : \e[32m $(who | wc -l) \e[0m"
    echo -e "Load Average on the system from last 1 minute is $(uptime | awk -F , '{print  $3}' | awk -F : '{print $2}')"  
}

# This is now you can call a function

sample

# calling status function
