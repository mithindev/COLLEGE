import os

# Use environment variable to determine if it's production or development
IS_PRODUCTION = os.environ.get('IS_PRODUCTION')

# Common settings shared between production and development
INSTALLED_APPS = [
    # ...
    'bootstrap4',
    'main',
    'accounts',
    # ...
]

# Load production or development settings based on IS_PRODUCTION
if IS_PRODUCTION:
    from .conf.production.settings import *
else:
    from .conf.development.settings import *
