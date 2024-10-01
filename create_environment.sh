#!/bin/bash

base_dir="submission_reminder_app"

mkdir $base_dir

mkdir $base_dir/app
mkdir $base_dir/modules
mkdir $base_dir/assets
mkdir $base_dir/config

touch "$base_dir/app/reminder.sh"
touch "$base_dir/modules/functions.sh"
touch "$base_dir/assets/submissions.txt"
touch "$base_dir/config/config.env"
touch "$base_dir/startup.sh"

cp ./submissions.txt $base_dir/assets/submissions.txt

echo "Munezero, Shell Navigation, not submitted"
echo "Kelly, Shell Navigation, submitted"
echo "Prince, Shell Navigation, not submitted"
echo "Kevin, Shell Navigation, not submitted"
echo "Nickson, Shell Navigation, submitted"

echo "Woow, the files have been created"
