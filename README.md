# Log Monitoring Script

This script monitors a log file in real-time for specific keywords.

## Usage

1. **Setup**: Save the script (`log-monitor.sh`) and ensure Bash is installed.
2. **Configuration**: Modify `LOG_FILE` and `KEYWORDS` in the script.
3. **Execution**: Run `./log-monitor.sh` in the terminal.
4. **Stopping**: Press `Ctrl+C` to stop the script.

## Features

- Real-time log monitoring.
- Keyword-based filtering.
- Timestamp formatting.
- Error handling for log file existence and interruptions.

## Example

```bash
LOG_FILE="example.log"
KEYWORDS=("error" "HTTP status")
./log-monitor.sh
