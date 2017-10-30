# removeActivationLock
Series of scripts to let you look up the activation lock bypass code in JSS and use it to remove the activation lock on an iPad

## Setup to use these scripts

1. Install [Apple Configurator 2](https://itunes.apple.com/us/app/apple-configurator-2/id1037126344?mt=12)
2. Launch Apple Configurator 2, and under the Apple Configurator 2 menu, choose Install Automation Tools...
3. Grab a copy of [jq](https://stedolan.github.io/jq/) and put it in the same directory as these scripts (you can get away with not using jq if you modify the scripts to use xml instead of python and use a combo of xpath and some string manipulation to get the data you want)
4. Edit getbypasscode.py and enter a username and password for a JSS user with appropriate rights (must be able to download config profiles and get activation lock bypass code) as well as the JSS url. Note the url must be placed in 3 places. Also, pick a random config profile number that exists in your JSS (used to generate the session token, you can use a different action to generate it if you'd like)
5. Edit unlockiPad.sh and enter the username, password, and url for your JSS

## Using these scripts
1. Plug in an activation locked iPad
2. Run ./unlockiPad.sh

## How it works
- Using the automation tools from Apple Configurator 2, the serial number of the plugged in iPad is grabbed
- This serial number is looked up in the JSS to get the JSS ID of the iPad
- This ID is passed off to the python script getbypasscode.py
- This script creates a session with the JSS, then gets a session token to authenticate with so it can perform the action of grabbing the activation lock bypass code. This code is then passed to stdout
- Tags are stripped from the code
- The bypass code is passed to an apple script which closes configurator if it is open, launches itunes, waits (hopefully long enough) for the iPad to be seen by itunes, tabs to the correct field, enters the bypass code, and quits iTunes
