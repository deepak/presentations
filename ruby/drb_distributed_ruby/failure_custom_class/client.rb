require 'drb/drb'

SERVER_URI = "druby://127.0.0.1:8002"

rpc_server = DRbObject.new_with_uri(SERVER_URI)

job = rpc_server.new_job

# ~> in `<main>': undefined method `payload=' for #<DRb::DRbUnknown:0x007fdb0c03d948> (NoMethodError)
job.payload = "send signup_mail to foo@example.com"
job.run
