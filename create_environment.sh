#!/bin/bash

# Ask for the iuser's name
read -p "Enter your name: " USER_NAME

# Sanitize the name (remove spaces and special characters)
USER_NAME=$(echo "$USER_NAME" | tr -d '[:space:]' | tr -cd '[:alnum:]')

# Define the main directory with user's name
MAIN_DIR="submission_reminder_$USER_NAME"
mkdir -p "$MAIN_DIR"
cd "submission_reminder_$USER_NAME"
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

#insert into remider.sh
cat << 'EOF' >app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
#insert into functions.sh
cat << 'EOF' >modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

        # Skip the header and iterate through the lines
	    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
	        student=$(echo "$student" | xargs)
		        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF
#insert into submissions.txt
cat << 'EOF' >assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Navigation, submitted
Jonathan, Shell Navigation, not submitted
Robert, Python, Submitted
Mugisha, Shell Scripting, submitted
Innocent, Python Navigation, not submitted
Gegimu ,Database(SQL), Submitted
EOF
#insert into config.env
cat << 'EOF' >config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
#insert into startup.sh
cat << 'EOF' > startup.sh
#!bin/bash
./app/reminder.sh
EOF
