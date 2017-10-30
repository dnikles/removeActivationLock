#!/bin/bash
serial=$(cfgutil get serialNumber)
jssAPIUsername="JSSUSERNAME"
jssAPIPassword="JSSPASSWORD"
jssAddress="https://JSSURL:8443"
myID=$(curl -H "Accept: application/json" -su ${jssAPIUsername}:${jssAPIPassword} -X GET ${jssAddress}/JSSResource/mobiledevices/serialnumber/"$serial"|./jq --raw-output '.mobile_device.general.id')
echo "my ID is " $myID
code=$(echo $(./getbypasscode.py $myID)| /usr/bin/awk -F'<code>|</code>' '{print $2}')
echo "bypass code is " $code
echo "launching iTunes to unlock iPad"
osascript ./itunesUnlock.scpt $code