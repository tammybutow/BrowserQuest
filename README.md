ChaosQuest
============

ChaosQuest is a HTML5/JavaScript team building game. It can be used to showcase and teach the practice of Chaos Engineering in a fun multiplayer Game Development environment. 

See an example on twitch here: https://www.twitch.tv/videos/597214999

It has four major parts:

* the chaos engineering side, which runs using Gremlin
* the server side, which runs using Node.js
* the client side, which runs using javascript in your browser
* the database side, which runs using Redis


Recommended Chaos Engineering Scenarios To Run With Your Team
-------------------------------------------------------------
* "Limbo" - all players unable to revive if they die - process killer attack on redis-server (+kill children)
* "Slow Down" - slow down the movements of all players - latency attack 1000 ms for 120 seconds
* "You're Stuck" - all players can’t move - latency attack 3000 ms for 120 seconds
* "Peace Mode" - all players are unable to fight - packet loss 70% for 240 seconds
* "Booted Out" - all players will be disconnected - process killer attack on memcached (+kill children)
* "Crash" - the game will crash for all players -  memory consumption attack 4 min 8gb



Browser Support
---------------

* Firefox - Works well.
* Chrome - Works well.


How to get it going yourself
----------------------------

Getting the server up and running is pretty easy. You need to have the following installed:

* Node.js ← Versions 0.8.x-0.10.x work.  
* gcc-c++ ← optional.  Not needed on windows.
* GNU make ← optional.  Not needed on windows.
* Memcached ← optional. This is needed to enable metrics.
* zlib-devel ← this is the Fedora/RHEL package name, others may be sightly different.  Not needed on windows.
* Redis server ← this is needed for the game to connect to the backend database.


Ubuntu
------

    $ sudo apt-get update
    $ sudo apt-get upgrade
    $ sudo apt-get install g++ make memcached libncurses5 redis-server git -y
    $ curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    $ sudo apt-get install nodejs -y
    $ echo "deb https://deb.gremlin.com/ release non-free" | sudo tee /etc/apt/sources.list.d/gremlin.list
    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CDB294B29A5B1E2E00C24C022E8EF3461A50EF6
    $ sudo apt-get update && sudo apt-get install -y gremlin gremlind
    $ gremlin init
    
Enter your Gremlin Team ID and Secret: 

1. Navigate to [https://gremlin.com/buttons](https://gremlin.com/buttons) and sign up for a Gremlin account
2. You will find your Gremlin Team ID and Secret in [Settings](https://app.gremlin.com/settings/teams).
3. Paste these two credentials into your terminal. 
    

Clone the git repo:

     git clone git://github.com/tammybutow/ChaosQuest.git
     cd ChaosQuest

Then install the Node.js dependencies by running:

    $ npm config set registry http://registry.npmjs.org/
    $ npm install -d
    
Before starting the ChaosQuest server, you must start Redis: 

    $ sudo systemctl start redis-server

Then start the game server by running:

    $ node server/js/main.js

The ChaosQuest server should start, showing output like this:

    $ node server/js/main.js
    This server can be customized by creating a configuration file named: ./server/config_local.json
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO Starting ChaosQuest game server...
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world1 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world2 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world3 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world4 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world5 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO Server (everything) is listening on port 8000

That means its working.  There should not be any warnings or errors.

Using a browser, connect to port 8000 of the server entered above.  The
ChaosQuest start page should appear, and the game should work.


Node.js, Memcached, and Redis for Fedora 16+ and RHEL/CentOS/SL 6.x
-------------------------------------------------------------------

On Fedora 16+ and RHEL/CentOS/SL 6.x, you can install Redis (required) and Memcached (optional) using
yum.

For just RHEL/CentOS/SL 6.x, you need to add the EPEL repo first.  Not needed for Fedora:

    $ sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

Then install Node.js and everything else needed:

    $ sudo yum install zlib-devel gcc gcc-c++ autoconf automake make redis nodejs npm memcached
    $ sudo chkconfig redis on
    $ sudo chkconfig memcached on

Start Redis and Memcached by running:

    $ sudo service redis start
    $ sudo service memcached start

Now continue on with the normal steps to clone the ChaosQuest git repo, and start up ChaosQuest:

    $ git clone git://github.com/tammybutow/ChaosQuest.git
    $ cd ChaosQuest
    $ npm install -d
    $ node server/js/main.js


License
-------

Code is licensed under MPL 2.0. Content is licensed under CC-BY-SA 3.0.
See the LICENSE file for details.

Credits
-------
ChaosQuest 

* Tammy Butow - [@tammybutow](http://www.twitter.com/tammybutow)



This is a fork of an open-source game called ChaosQuest by littleworkshop/mozilla. 

ChaosQuest originally created by [Little Workshop](http://www.littleworkshop.fr)
