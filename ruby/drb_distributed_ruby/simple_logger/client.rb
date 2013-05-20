require 'drb/drb'

TIMESERVER_URI = "druby://127.0.0.1:8000"
LOGGER_SERVER_URI = "druby://127.0.0.1:8001"

timeserver = DRbObject.new_with_uri(TIMESERVER_URI)
logger = DRbObject.new_with_uri(LOGGER_SERVER_URI)

logger.info "hello the time here is #{timeserver.get_current_time}"
