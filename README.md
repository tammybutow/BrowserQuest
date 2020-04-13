ChaosQuest
============

ChaosQuest is a HTML5/JavaScript game to be used to showcase the practice of Chaos Engineering in a multiplayer Game Development environment. 

It has four major parts:

* the chaos engineering side, which runs using Gremlin
* the server side, which runs using Node.js
* the client side, which runs using javascript in your browser
* the database side, which runs using Redis


Browser Support
---------------

* Firefox - Works well.
* Chrome - Works well.


How to get it going
-------------------

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
    $ curl -sL https://deb.nodesource.com/setup | sudo bash -
    $ sudo apt-get install nodejs
    $ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CDB294B29A5B1E2E00C24C022E8EF3461A50EF6
    $ sudo apt-get update && sudo apt-get install -y gremlin gremlind
    $ gremlin init
    
Enter your Gremlin Team ID and Secret: 

1. Navigate to [https://gremlin.com/buttons](gremlin.com/buttons) and sign up for a Gremlin account
2. You will find your Gremlin Team ID and Secret in [Settings](https://app.gremlin.com/settings/teams).
3. Paste these two credentials into your terminal. 
    

Clone the git repo:

    $ git clone git://github.com/tammybutow/ChaosQuest.git
    $ cd ChaosQuest

Then install the Node.js dependencies by running:

    $ npm config set registry http://registry.npmjs.org/
    $ npm install -d
    
Before starting the ChaosQuest server, you must start Redis. 
    $ sudo systemctl start redis-server

Then start the server by running:

    $ node server/js/main.js

The BrowserQuest server should start, showing output like this:

    $ node server/js/main.js
    This server can be customized by creating a configuration file named: ./server/config_local.json
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO Starting BrowserQuest game server...
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world1 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world2 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world3 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world4 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO world5 created (capacity: 200 players).
    [Thu Sep 13 2012 17:16:27 GMT-0400 (EDT)] INFO Server (everything) is listening on port 8000

That means its working.  There should not be any warnings or errors.

Using a browser, connect to port 8000 of the server entered above.  The
BrowserQuest start page should appear, and the game should work.

Mac OS X
--------

Node.js, Memcached, and Redis installed through Homebrew are known to work:

    $ brew install node redis memcached
    $ ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    $ git clone git://github.com/tammybutow/ChaosQuest.git
    $ cd ChaosQuest
    $ npm install -d

Gremlin installed through Docker for Mac is known to work:
 
    
1. You will need to set your Gremlin Team ID and Secret as environment variables
2. Navigate to [https://gremlin.com/buttons](gremlin.com/buttons) and sign up for a Gremlin account
3. You will find your Gremlin Team ID and Secret in [Settings](https://app.gremlin.com/settings/teams).

Set your environment variables for Gremlin:

    $ export GREMLIN_TEAM_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    $ export GREMLIN_TEAM_SECRET=XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXX

Run Gremlin in a Docker container after installing Docker for Mac:

    $ docker run -d --net=host \
    --cap-add=NET_ADMIN --cap-add=SYS_BOOT --cap-add=SYS_TIME \
    --cap-add=KILL \
    -v $PWD/var/lib/gremlin:/var/lib/gremlin \
    -v $PWD/var/log/gremlin:/var/log/gremlin \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e GREMLIN_TEAM_ID="$GREMLIN_TEAM_ID" \
    -e GREMLIN_TEAM_SECRET="$GREMLIN_TEAM_SECRET" \
    gremlin/gremlin daemon
 

To check Redis is now running, you can simply run:

    $ redis-cli ping
    
If Redis is running you should see the result *PONG*

Now, run the following to start ChaosQuest: 

    $ node server/js/main.js
    
You can now view ChaosQuest in your browser @ http://localhost:8000  


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

Windows
-------

Windows 8 is known to work ok with just the base Node v0.8.18
installed, without Visual Studio, nor Python, nor the native
extensions for npm modules installed.

You can download an experimental Win32/64 version of Redis
from here: http://redis.io/download

To start Redis on Windows, you can simply run `redis-server.exe` in your `redis\bin\release` directory.

You can download the latest version of Memcached for Win32/64 from here:
http://blog.elijaa.org/index.php?post/2010/10/15/Memcached-for-Windows&similar

Deploying ChaosQuest
----------------------

Currently, ChaosQuest can run on the following providers:
* [OpenShift](https://www.openshift.com)
* [Heroku](https://www.heroku.com)
* [DigitalOcean](https://www.digitalocean.com)
* [AWS](https://www.aws.com)
* [Azure](https://www.azure.com)

### Instructions for OpenShift ###
1. Follow the instructions to get started with the OpenShift client tools [here](https://www.openshift.com/get-started).

2. Create a new application by running this command:

        $ rhc app create <app-name> nodejs-0.6
        $ cd <app-name>

   where \<app-name\> is the name of your app, e.g. browserquest.

3. Add the Redis cartridge (necessary for BrowserQuest to be able to store data) with the following command:

        $ rhc add-cartridge \
          http://cartreflect-claytondev.rhcloud.com/reflect?github=smarterclayton/openshift-redis-cart \
          --app <app-name>

4. Add the ChaosQuest repository, and pull its contents with the following commands:

        $ git remote add github https://github.com/tammybutow/ChaosQuest.git
        $ git fetch github
        $ git reset --hard github/master
        
5. Copy the ChaosQuest config file with the following command:

        $ cp server/config.json server/config_local.json
    
6. Open `server/config_local.json` in a text editor such as Gedit (Linux), TextEdit (OS X), or Vim.
On the line that reads `"production": "heroku",`, change `"heroku"` to `"openshift"`.

7. Add this file to your repository by running the following commands:

        $ git add server/config_local.json
        $ git commit -m "Added config_local.json"

8. Now, deploy to OpenShift with one final command (this will take several minutes):

        $ git push -f

Congratulations! You have now deployed ChaosQuest to Openshift! You can see the url of your instance by running


    $ rhc app show <app-name>

Visit the url shown by the above command to see ChaosQuest running. You will need to add ":8000" to the end. Use the url below as a guide:

    http://your_openshift_browserquest_url.rhcloud.com:8000/
    
### Instructions for Heroku ###

1. Install the Heroku toolbelt from [here](https://toolbelt.herokuapp.com/).

2. Create a new application by running the following command:

        $ heroku create [NAME]
    
Where [NAME] is an optional name for your application (Heroku will automatically create one otherwise).

3. Sign up for a Redis provider, such as [Redis To Go](https://redistogo.com), or host a Redis instance yourself.

4. Run the following commands to allow ChaosQuest to run on Heroku:

        $ heroku config:add HEROKU=true
        $ heroku config:add HEROKU_REDIS_HOST=[REDIS_HOST]
        $ heroku config:add HEROKU_REDIS_PORT=[REDIS_PORT]
        $ heroku config:add HEROKU_REDIS_PASSWORD=[REDIS_PASSWORD]
    
Where [REDIS_HOST], [REDIS_PORT], and [REDIS_PASSOWRD] are your Redis hostname, port, and password, respectively.
If you Redis instance is configued without a password, omit the last command.

Note: If you use RedisToGo, you will be provided with a URL that looks something like this:

    redis://redistogo:12345678901234567890@something.redistogo.com:9023/
    
In this case, your REDIS_HOST is `something.redistogo.com`, your REDIS_PORT is `9023`, and your REDIS_PASSWORD is `12345678901234567890`.

5. Deploy to Heroku by running the following command:

        $ git push heroku master
    
6. Enable the Heroku WebSockets lab (needed for communication between the browser and the BrowserQuest server) with the following command:

        $ heroku labs:enable websockets
    

Congratulations! You have now deployed BrowserQuest to Heroku! To open BrowserQuest in your browser, run `heroku open`.



License
-------

Code is licensed under MPL 2.0. Content is licensed under CC-BY-SA 3.0.
See the LICENSE file for details.

Credits
-------
ChaosQuest 

* Tammy Butow - [@tammybutow](http://www.twitter.com/tammybutow)



This is a fork of an open-source game called BrowserQuest by littleworkshop/mozilla. 

BrowserQuest originally created by [Little Workshop](http://www.littleworkshop.fr):

* Franck Lecollinet - [@whatthefranck](http://twitter.com/whatthefranck)
* Guillaume Lecollinet - [@glecollinet](http://twitter.com/glecollinet)

All of the music in BrowserQuest comes from Creative Commons [Attribution 3.0 Unported (CC BY 3.0)](http://creativecommons.org/licenses/by/3.0/) sources.

* [Aaron Krogh](http://soundcloud.com/aaron-anderson-11) - [beach](http://soundcloud.com/aaron-anderson-11/310-world-map-loop)
* [Terrel O'Brien](http://soundcloud.com/gyrowolf) - [boss](http://soundcloud.com/gyrowolf/gyro-scene001-ogg), [cave](http://soundcloud.com/gyrowolf/gyro-dungeon004-ogg), [desert](http://soundcloud.com/gyrowolf/gyro-dungeon003-ogg), [lavaland](http://soundcloud.com/gyrowolf/gyro-scene002-ogg)
* [Dan Tilden](http://www.dantilden.com) - [forest](http://soundcloud.com/freakified/what-dangers-await-campus-map)
* [Joel Day](http://blog.dayjo.org) - [village](http://blog.dayjo.org/?p=335)

Many other people are contributing through GitHub:

* Myles Recny [@mkrecny](https://github.com/mkrecny)
* Ben Noordhuis [@bnoordhuis](https://github.com/bnoordhuis)
* Taylor Fausak [@tfausak](https://github.com/tfausak)
* William Bowers [@willurd](https://github.com/willurd)
* Steve Gricci [@sgricci](https://github.com/sgricci)
* Dave Eddy [@bahamas10](https://github.com/bahamas10)
* Mathias Bynens [@mathiasbynens](https://github.com/mathiasbynens)
* Rob McCann [@unforeseen](https://github.com/unforeseen)
* Scott Noel-Hemming [@frogstarr78](https://github.com/frogstarr78)
* Kornel Lesiński [@pornel](https://github.com/pornel)
* Korvin Szanto [@KorvinSzanto](https://github.com/KorvinSzanto)
* Jeff Lang [@jeffplang](https://github.com/jeffplang)
* Tom McKay [@thomasmckay](https://github.com/thomasmckay)
* Justin Clift [@justinclift](https://github.com/justinclift)
* Brynn Bateman [@brynnb](https://github.com/brynnb)
* Dylen Rivera [@dylenbrivera](https://github.com/dylenbrivera)
* Mathieu Loiseau [@lzbk](https://github.com/lzbk)
* Jason Culwell [@Mawgamoth](https://github.com/Mawgamoth)
* Bryan Biedenkapp [@gatekeep](https://github.com/gatekeep)
* Aaron Hill [@Aaron1011](https://github.com/Aaron1011)
* Fredrik Svantes [@speedis](https://github.com/speedis)
* Sergey Krilov [@sergkr](https://github.com/sergkr)
