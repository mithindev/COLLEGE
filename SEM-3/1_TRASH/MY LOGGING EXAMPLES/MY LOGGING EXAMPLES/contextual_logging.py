import logging

logging.basicConfig(level=logging.DEBUG)

def log_with_context(user_id, message):
    logger = logging.getLogger(__name__)
    logger.info(f"User {user_id}: {message}")

log_with_context(123, "Logged in successfully")
log_with_context(456, "Access denied!")
