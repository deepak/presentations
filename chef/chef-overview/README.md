used http://lab.hakim.se/reveal-js for creating the presentations  

## original talk summary

tl:dr the objective of the talk is to give an overview of Chef and its ecosystem. And basics on how to create and use the community contributed cookbooks.

For the Chef presentation, the contents i have planned is:
1. why chef
2. how to write a cookbook
3. how to deploy and install a chef cookbook
4. use veewee and vagrant to create a virtual machine
5. i will share cookbooks for setting up a rails server with postgres, nginx and unicorn

The shortcomings of the talk are:
1. I will be using chef-solo and not chef-server. 
    So it geared towards small installs where the number of servers does not dynamically change much
2. I am not a sysadmin by trade. A talk by a sysadmin + a programmer using Chef for a long time would be better for this talk. I am not both of them.
    I am a Ruby programmer working in a small startup who started playing with Chef a few months back to automate my infra as much as possible
    and to learn from the community cookbooks more importantly
3. I may touch upon testing Chef cookbooks but it is not part of my flow for creating Chef cookbooks

## notes from the talk at BRUG - May 18, 2013

Notes for the day in roughly serial order are:

I had the first presentation
We  talked about:

* why chef is useful
* compared and contrasted with Puppet. Vamsee pitched it with comparisons to Puppet
* Cleared up some terminology about Chef. nodes, cookbooks, roles, recipes, run_list and attributes
  All this was only for chef solo
  @Emil gave a nice presentation afterwards, which cleared up the components of Chef Server quite nicely
* then we discussed Vagrant and Veewee (to create a Virtualmachine box)
  had a discussion on the uses of vagrant. ie. isolate local environment, get started quickly with development as 
  as dependencies are like an executable, CLI interface to Virtualmachine - no need to muck around with a GUI
  and for testing chef locally without any dependency on ec2 etc

  @Vamsee pointed out that github had a project to setup all your dependencies using Puppet
  i think it was https://speakerdeck.com/wfarr/the-setup-managing-an-army-of-laptops-with-puppet ?
  please correct me if wrong
  he also pointed out https://github.com/rails/rails-dev-box

  @Emil pointed out http://www.vagrantbox.es/
  which lists community contributed vagrant boxes
  
  @Vamsee pointed out that Veewee is merged into Vagrant now

  we spoke a little about deployment and Chef Omnibus came up
  http://www.opscode.com/blog/2012/06/29/omnibus-chef-packaging
  It is a build server created by Opscode, I use it to install Chef on production
  check: https://github.com/deepak/chef_cookbooks/blob/master/Capfile#L131
   
  we also discussed push and pull deployments
  where @Emil made a good point that an advantage of Chef server is that you can implement push deployment
  another advantage is that it has allows you to search your infrastructure via a single API
  all covered by @Emil in his slick presentation 
  I think @Nikhil was also for push deployments 
  I was against it being a big advantage as Capistrano is push based
  But i saw the light after @Emil's presentation :-)

* after that we started looking at some code at  https://github.com/deepak/chef_cookbooks
  we discussed how a cookbook is organized, attributes and types of attributes
  why a cookbook should be idempotent
  How to create an idempotent recipe
  Java cookbooks also exist
  We discussed the way to make an exe install idempotent is to identify what files are created by the exe
  and to check that on subsequent runs

  @Nikhil asked me how does chef know to make packages idempotent
  I did not have an answer :-) 
  My best guess is that it knows via Ohai
  discussed ways it could be working. fun sidetrack :-)

  Ohai is a tool that Chef uses to get system information - in JSON
  even Puppet uses it

  @Emil explained how chef executes the cookbooks, two-pass

* we discussed roles, recipes and run-list in detail. how dependencies resolved
  difference with Puppet

* we ran the chef recipe. dissussed some more and them broke from Pizza
   btw thanks to @Swanand for putting the meme for Chef and pizza out :-)
   and to @ Asif from C42 for sponsoring the pizza and the location :-)

Then @Emil have his presentation on Chef Sever

* he is building a PaaS using EC2 and chef-server. He is calling it VisualCloud
* his company had a problem where client's infrastructure was being managed via excel sheets
  and for multiple environments. staging, production 
  It was a big problem
* Emil came up with a tool that allows you to think of your infrastructure as a whole
  you can drag & drop components like webservers, load balancer and connect them up visually
  The whole infra. so created can be created or destroyed at a click of a button
  The tool also handles permissions

  @Hemant answered how Amazon's AMI are organized and how they are different from a stock virtualization image
  It was pretty cool, knowing about it. 
  He and @Emil were talking about an component which bootstraps the server
  some "cf-init" - forgot the name. anyone ?
  
* Emil has opensourced his tool which talks to AWS at https://github.com/emilsoman/cloudster
  @Hemant pointed out that Fog is also a good tool for talking to AWS
  It was opensourced by Engineyard. 
  btw Hemant is a core-contributor to Fog

* @Emil explained the moving parts of Chef sever - indexer, message queue and others
* he also explained the advantages to Chef server
  That it allows you to do pull based deploys
   It gives you one single source of truth about your infrastructure. Can get information like 
   list of all webservers in one API call
   eg. setup a server dynamically and then ask nagios to configure itself to add the additional server
* He is using knife (an interface to chef) to talk to chef server
* @Emil has also promised to opensource his PaaS platform and GUI tool VisualCloud
* The presentation was pretty slick. kudos
* The GUI interface for VisualCloud is also pretty polished. Everyone commented on it 
  It was pretty slick and impressive. 

Sorry @Emil if i missed anything in your presentation
I also do not have the link to your presentation
Looking forward to VisualCloud being opensourced
and thanks for an informative and well designed presentation
  
My presentation is at https://github.com/deepak/presentations/blob/master/chef-overview-brug-feb-16-2013/
It is an html presentation written in http://lab.hakim.se/reveal-js

The chef cookbooks i wrote are at https://github.com/deepak/chef_cookbooks
I wrote them specially for this presentation, I need to opensource our production cookbooks
but first i need to sanitize them.

Couple of devops folks from http://www.relevancelab.com/Relevant_Labs.html
had come in. Their director was also there. They are trying out Chef and Puppet for building 
their infrastructure

some screencasts are at
http://railscasts.com/episodes/339-chef-solo-basics
https://peepcode.com/products/chef-i
https://peepcode.com/products/chef-ii
https://github.com/railscasts/339-chef-solo-basics

The peepcode screencasts are by Joshua Sierles.
I think he along with Mark Imbriaco wrote the chef cookbooks for 37signals

He has open-sourced his recipes at 
https://github.com/jsierles/chef_cookbooks

@Emil pointed out that the Engineyard cookbooks are quite good too
they were an early adopter of chef solo (not chef server)
now they use both Chef (chef server i think) and Puppet

The chef irc channel is also quite active and people are helpful - http://wiki.opscode.com/display/chef/IRC

some more links to check

http://community.opscode.com/cookbooks (like rubygems for Chef)
http://docs.opscode.com/chef/resources.html (documentation). Definitely read it
http://foodfightshow.org (podcast - to track what is happening in the Chef community) 
Chef has a conference as well at http://chefconf.opscode.com/

btw Facebook is using Chef Server 11
and Google is using Puppet

Chef server is being moved from Merb and Couchdb 
to Erlang and Postgres. This is Chef server 11

The client is totally ruby
Puppet uses a ruby like DSL but it is not ruby
We discussed the pro & cons as well

FYI first there was a tool called CFEngine, then Puppet and then Chef
Rightscale, rackspace and engineyard all use Chef 
and Facebook as well. 
you can see a list at www.opscode.com/customers/

AWS just released Opsworks 
http://aws.typepad.com/aws/2013/02/aws-opsworks-flexible-application-management-in-the-cloud.html 
http://aws.amazon.com/opsworks/ 

AWS is using Chef. 
AWS acquired scalarium.com, which is now being released as Opsworks 

also @vamsee clarified that:
I think there is a small misunderstanding here - Puppet is written in Ruby, 
but the default DSL it exposes is not Ruby, unlike Chef. The Ruby DSL was a 
recent addition. Like I mentioned in the meetup, it could be a good or a bad thing. 

Personally, I like that Puppet enforces a declarative syntax, I think it goes well 
for this particular domain - viz., configuration management. Though initially I 
missed the flexibility of being able to use Ruby, I've come to realize that it's 
me who didn't understand how config management tools actually work. You can read 
this for context: https://puppetlabs.com/blog/why-puppet-has-its-own-configuration-language/. 

So I would say if you're trying Puppet, just go with the default DSL, and I rarely 
miss Ruby these days when it comes to writing Puppet manifests. To clarify what I 
additionally said in the meet - rails-dev-box uses puppet, as does this project 
called 'boxen' recently released by Github: https://github.com/blog/1345-introducing-boxen. 

@arnab also plugged boxen
Github open-sourced their "laptop management tool" last week: https://github.com/boxen/boxen.
Just saw a demo from @wfarr in RubyConf AU - looks quite flexible. Only handles macs now - but linux/debian support is planned.

later @dexterous clarified that - veewee is not merged into vagrant

The ability to package a box into a base box was always in Vagrant (vagrant package).
In fact, that's precisely what Veewee uses to export a basebox once it's built the VM (veewee export OR vagrant basebox export).
The sweet spot that Veewee services is automating the construction of baseboxes (installing OS, ruby, chef/puppet, vbox guest additions).
AFAICT, that's still in veewee and isn't showing signs of moving into Vagrant any time soon.
That said, @jedi4ever is soldiering on with veewee development and it has gone far beyond Vagrant and VBox with support for KVM, VMWare, et al.

## metadata
- talk given at the local Bangalore Ruby user group (BRUG) on May 18th, 2013
  https://groups.google.com/d/topic/bangalorerug/pGF5m3soNC8/discussion
  https://groups.google.com/d/topic/bangalorerug/ytOvxby9m90/discussion
