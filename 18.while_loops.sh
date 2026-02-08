#!/bin/bash
# count=1
# while [ count -le 5 ]
# do
#     echo "count is $count"
#     sleep 1 
#     ((count++)) #Increment counter
# done

#!/bin/bash

FILENAME="13.loops.sh"

# Read the file line by line
while IFS= read -r line; do
  # Process the line here
  echo "Line content: $line"
done < "$FILENAME"
