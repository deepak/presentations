require 'drb/drb'

$SAFE = 1 # disable eval and friends
SERVER_URI = "druby://127.0.0.1:8002"

# custom class
class Job
  # Make dRuby send Logger instances as dRuby references,
  # not copies.
  include DRb::DRbUndumped

  attr_accessor :payload

  def run; puts "running #{payload}"; end
end

class RpcServer
  def new_job
    Job.new
  end
end

# bind to a port
DRb.start_service(SERVER_URI, RpcServer.new)
puts "listening on #{SERVER_URI}"

DRb.thread.join
