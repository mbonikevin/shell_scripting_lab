#!/bin/bash

base_dir="submission_reminder_app"

mkdir $base_dir

mkdir $base_dir/app
mkdir $base_dir/modules
mkdir $base_dir/assets
mkdir $base_dir/config

touch "$base_dir/app/reminder.sh"
chmod +x $base_dir/app/reminder.sh
touch "$base_dir/modules/functions.sh"
chmod +x $base_dir/modules/functions.sh
touch "$base_dir/assets/submissions.txt"
touch "$base_dir/config/config.env"
touch "$base_dir/startup.sh"
chmod +x $base_dir/startup.sh


# inserting function.sh contents
echo '#!/bin/bash

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
' > $base_dir/modules/functions.sh

# inserting reminder.sh contents
echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > $base_dir/app/reminder.sh

# inserting config.env contents
echo '# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > $base_dir/config/config.env

cp ./submissions.txt $base_dir/assets/submissions.txt

cd $base_dir

# adding 5 more sudents
echo "Munezero, Shell Navigation, not submitted
Kelly, Shell Navigation, submitted
Prince, Shell Navigation, not submitted
Kevin, Shell Navigation, not submitted
Nickson, Shell Navigation, submitted" > assets/submissions.txt

# create the startub logic
echo '#!/bin/bash

./app/reminder.sh' > ./startup.sh

echo "Woow, Reminder Your Project is ready 🥳."
