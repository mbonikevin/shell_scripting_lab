#!/bin/bash

base_dir="submission_reminder_app"

mkdir -p "$base_dir/app"
mkdir -p "$base_dir/modules"
mkdir -p "$base_dir/assets"
mkdir -p "$base_dir/config"

touch "$base_dir/app/reminder.sh"
touch "$base_dir/modules/functions.sh"
touch "$base_dir/assets/submissions.txt"
touch "$base_dir/config/config.env"
touch "$base_dir/startup.sh"

echo "Directory files created successfully."
