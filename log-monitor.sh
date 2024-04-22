#!/bin/bash

# Define the log file to monitor
LOG_FILE="example.log"

# Define keywords or patterns to search for in the log file
KEYWORDS=("error" "HTTP status")

# Function to monitor the log file
monitor_log_file() {
    # Set up a trap to catch the interrupt signal (Ctrl+C) and exit gracefully
    trap 'echo "Stopping log monitoring."; exit' INT
    
    # Use tail to continuously monitor the log file and read new lines
    tail -n0 -f "$LOG_FILE" | while read -r line; do
        # Extract the timestamp (assumed to be the first two fields) from each log entry - additional feature away from requirement
        timestamp=$(echo "$line" | awk '{print $1 " " $2}')
        # Extract the log entry itself (excluding the timestamp)
        log_entry=$(echo "$line" | cut -d' ' -f3-)
        # Iterate over each keyword
        for keyword in "${KEYWORDS[@]}"; do
            # Check if the log entry contains the current keyword
            if echo "$log_entry" | grep -q "$keyword"; then
                # If the keyword is found, print the log entry with a timestamp
                echo "$(date +"%Y-%m-%d %H:%M:%S") $log_entry"
            fi
        done
    done
}

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    # Print an error message and exit if the log file doesn't exist
    echo "Log file '$LOG_FILE' not found."
    exit 1
fi

# Call the function to start monitoring the log file
monitor_log_file
