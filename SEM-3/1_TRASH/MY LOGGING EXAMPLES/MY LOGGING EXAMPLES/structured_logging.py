import logging
import json

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(levelname)s %(message)s', datefmt='%Y-%m-%d %H:%M:%S')

log_data = {
    'user_id': 123,
    'action': 'login',
    'status': 'success'
}
logging.info(json.dumps(log_data))
