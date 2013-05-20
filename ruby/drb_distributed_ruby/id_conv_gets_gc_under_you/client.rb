require 'drb/drb'

SERVER_URI = "druby://127.0.0.1:8003"

# TODO: what is Job class is duplicated here
server = DRbObject.new_with_uri(SERVER_URI)

job = server.new_job "send mail to foo@emaple.com"
puts job.id
puts job.run
