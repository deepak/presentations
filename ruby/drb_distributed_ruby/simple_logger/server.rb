require 'drb/drb'
require 'logger'

$SAFE = 1 # disable eval and friends
SERVER_URI = "druby://127.0.0.1:8001"

# bind to a port
DRb.start_service(SERVER_URI, Logger.new(STDOUT))
puts "listening on #{SERVER_URI}"
DRb.thread.join
