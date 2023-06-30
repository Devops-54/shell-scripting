#!/bin/bash

# TODAYS_DATE="20JUNE2023"                            # HardCoding a value makes it consistent
TODAYS_DATE=$(date +%F)                               # Always enclose expresssions in paranthesis
echo -e "Good Morning and todays date is \e[32m $TODAYS_DATE \e[0m"