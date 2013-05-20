require 'drb/drb'
require 'pp'

SERVER_URI = "druby://127.0.0.1:8000"

timeserver = DRbObject.new_with_uri(SERVER_URI)
pp timeserver #<DRb::DRbObject:0x007fc7a40dbab0 @ref=nil, @uri="druby://127.0.0.1:8000">
puts timeserver.get_current_time
