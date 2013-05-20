has running examples of DRb ie. distributed ruby - an RPC mechanism in Ruby standard library  

used DrBrain's https://github.com/drbrain/drbdump to visualize the DRb network activity  
got started on DRb by reading his blogs - http://segment7.net/projects/ruby/drb/introduction.html

examples:  
1. SimpleServer: a time-server. returns the time on the server  
2. simple_logger: a client which logs a message on the server along with the time returned by the SimpleServer on (1)  
   demonstrates that clients need a url to communicate to the server and that can be more than one  
3. failure_custom_class: all along we have been passing in-built ruby objects (stdlib and core ruby objects).  
   It fails if we want to pass an instance of a class what only exists on the server. See how it fails  
4. custom_class: solve the problem in (3) by including `DRb::DRbUndumped` It marshalls the class defination to the client  
5. id_conv_gets_gc_under_you: work in progress. IdConv is supposed to be GC unsafe. can pull objects under you if/when  
   it gets GC'ed. tried recreating that. failed miserably :-)  

## metadata  
- talk given at the local Bangalore Ruby user group on May 18th, 2013  
  https://groups.google.com/d/topic/bangalorerug/8wrbzFQroxY/discussion  
  https://speakerdeck.com/deepk/drb-distributed-ruby  
