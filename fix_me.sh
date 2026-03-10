#!/bin/sh

echo 'Removing profiles!'
cd /Volumes/"Macintosh HD"/
rm -rf ./var/db/ConfigurationProfiles/*
mkdir ./var/db/ConfigurationProfiles/Settings
touch ./var/db/ConfigurationProfiles/Settings/.profilesAreInstalled

echo 'Disabling mdm demons!'
mkdir ./Users/Shared/mdm_daemons_backup
mv ./Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist ./Users/Shared/mdm_daemons_backup/
mv ./Library/LaunchDaemons/com.microsoft.intuneMDMAgent.daemon.plist ./Users/Shared/mdm_daemons_backup/

echo 'Disabling mdm agents!'
mkdir ./Users/Shared/mdm_agents_backup
mv ./Library/LaunchAgents/com.microsoft.intuneMDMAgent.plist ./Users/Shared/mdm_agents_backup/
mv ./Library/LaunchAgents/com.microsoft.update.agent.plist ./Users/Shared/mdm_agents_backup/
mv ./Library/LaunchAgents/com.paloaltonetworks.gp.pangp ./Users/Shared/mdm_agents_backup/

echo "Done! Please Reboot"
