require 'drb/drb'
$SAFE = 1 # disable eval and friends
SERVER_URI = "druby://127.0.0.1:8000"

# simple class
class TimeServer
  def get_current_time; Time.now; end
end

# bind to a port
DRb.start_service(SERVER_URI, TimeServer.new)
puts "listening on #{SERVER_URI}"
DRb.thread.join
