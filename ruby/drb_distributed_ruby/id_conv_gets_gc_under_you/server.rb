require 'drb/drb'

SERVER_URI = "druby://127.0.0.1:8003"

JOBS = {}

class Job
  attr_accessor :payload
  include DRb::DRbUndumped
  alias :id :object_id

  def initialize payload
    @payload = payload
  end

  def run
   puts "running #{object_id}"
   "done"
  end
end 

class Server
  def new_job payload
    job = Job.new(payload)
    JOBS[job.object_id] = job
    job
  end

  def find job_id
    JOBS[job_id]
  end

  def start_gc
    GC.start
  end

end

# bind to a port
DRb.start_service(SERVER_URI, Server.new)
puts "listening on #{SERVER_URI}"
DRb.thread.join
