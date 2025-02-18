#!/bin/bash

# Ask for the user's name
read -p "Enter your name: " USER_NAME

# Sanitize the name (remove spaces and special characters)
USER_NAME=$(echo "$USER_NAME" | tr -d '[:space:]' | tr -cd '[:alnum:]')

# Define the main directory with user's name
MAIN_DIR="submission_reminder_${USER_NAME}"

# Define subdirectories
SUBDIRS=(
	    "app"
	        "modules"
		    "assets"
		        "config"
		)

		# Define files
		FILES=(
			    "app/reminder.sh"
			        "modules/functions.sh"
				    "assets/submissions.txt"
				        "config/config.env"
					    "startup.sh"
				    )

				    # Create the main directory
				    mkdir -p "$MAIN_DIR"

				    # Change to the main directory
				    cd "$MAIN_DIR" || exit

				    # Create subdirectories
				    for dir in "${SUBDIRS[@]}"; do
					        mkdir -p "$dir"
					done

					# Create files
					for file in "${FILES[@]}"; do
						    touch "$file"
					    done

					    # Add execute permissions to shell scripts
					    chmod +x app/reminder.sh modules/functions.sh startup.sh 

					    echo "Directory structure and files created successfully in: $MAIN_DIR"

