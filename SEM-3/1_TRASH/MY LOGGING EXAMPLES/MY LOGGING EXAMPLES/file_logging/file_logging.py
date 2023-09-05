import logging

# Configure logging
logging.basicConfig(filename='app.log', level=logging.DEBUG)  # Log messages to a file

# Log messages
logging.debug("This is a debug message")
logging.info("This is an info message")
logging.warning("This is a warning message")
logging.error("This is an error message")
