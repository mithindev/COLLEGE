import sqlite3

# Connect to the database
conn = sqlite3.connect('logs.db')
cursor = conn.cursor()

# Create a log table if it doesn't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        level TEXT,
        message TEXT
    )
''')

# Log messages
def log_message(level, message):
    cursor.execute('INSERT INTO logs (level, message) VALUES (?, ?)', (level, message))
    conn.commit()

log_message("DEBUG", "This is a debug message")
log_message("INFO", "This is an info message")
log_message("WARNING", "This is a warning message")
log_message("ERROR", "This is an error message")

# Close the database connection when done
conn.close()
