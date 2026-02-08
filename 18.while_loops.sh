#!/bin/bash
# count=1
# while [ count -le 5 ]
# do
#     echo "count is $count"
#     sleep 1 
#     ((count++)) #Increment counter
# done

#!/bin/bash

FILENAME="./13.Loops.sh"

# Read the file line by line
while IFS= read -r line; do # seperate line by line and store in line variable then print the line
  # Process the line here
  echo "Line content: $line" # print the line
done < "$FILENAME" #input file to read 
