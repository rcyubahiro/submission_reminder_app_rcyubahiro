#Submission Reminder System

#Project Overview
This project is a submission reminder system that helps users keep track of pending submissions and sends automated reminders. It ensures that all required submissions are completed on time.

Directory Structure

submission reminder_<username>/
app/reminder.sh
modules/functions.sh
assets/submissions.txt
config/ config.env
startup.sh

#Setup Instructions

1. Clone the Repository
After then create the shell scripts called create_environment.sh  that must create the above directory structure 
fist of all use read to give access to any every users permission to enter any certain number after i created all necessary directories,subdirectories anf files then give the files it's consective contents as provided 
in the assignment packages,then close....the scripts 

2. Give Execution Permissions
Ensure all shell scripts are executable:
chmod +x app/reminder.sh modules/functions.sh startup.sh

3. Configure Environment Variables
Edit the config/config.env file with necessary environment variables.

4. Run the Startup Script
./startup.sh

Script Explanations
startup.sh
Loads environment variables.
Checks for pending submissions in assets/submissions.txt.
Calls app/reminder.sh to send reminders.
app/reminder.sh
Reads pending submissions.
Sends reminders to users.
modules/functions.sh
Contains helper functions used across scripts.
Example Usage
Add a pending submission entry in assets/submissions.txt:
John Doe - Assignment 1 - Due: 2024-02-20
Run ./startup.sh to process reminders.
The system will check submissions and notify users....
