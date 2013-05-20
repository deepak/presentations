# use a job-d created on client.rb. eg. 70134672779280

require 'drb/drb'

SERVER_URI = "druby://127.0.0.1:8003"

# TODO: what is Job class is duplicated here
server = DRbObject.new_with_uri(SERVER_URI)

server.start_gc
sleep 3

job = server.find 70139513005640
puts job.id
puts job.run
