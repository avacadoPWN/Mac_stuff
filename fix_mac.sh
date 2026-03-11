#!/bin/bash
echo 'Unlocking and mounting Macintosh HD - Data'
#diskutil apfs unlockVolume $(diskutil info 'Macintosh HD - Data' | grep 'Identifier' | awk '{print $NF}')
sleep 3s
DISK_ID=$(diskutil info -plist "Macintosh HD - Data" | plutil -extract DeviceIdentifier raw -)
echo "Disk ID = $DISK_ID"
diskutil apfs unlockVolume "$DISK_ID"
echo 'Removing profiles!'
cd "/Volumes/Macintosh HD/"
rm -rf "./var/db/ConfigurationProfiles/*"
mkdir "./var/db/ConfigurationProfiles/Settings"
touch "./var/db/ConfigurationProfiles/Settings/.profilesAreInstalled"
echo 'Disabling mdm demons!'
mkdir "./Users/Shared/mdm_daemons_backup"
mv "./Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist" "./Users/Shared/mdm_daemons_backup/"
mv "./Library/LaunchDaemons/com.microsoft.intuneMDMAgent.daemon.plist" "./Users/Shared/mdm_daemons_backup/"
echo 'Disabling mdm agents!'
mkdir "./Users/Shared/mdm_agents_backup"
mv "./Library/LaunchAgents/com.microsoft.intuneMDMAgent.plist" "./Users/Shared/mdm_agents_backup/"
mv "./Library/LaunchAgents/com.microsoft.update.agent.plist" "./Users/Shared/mdm_agents_backup/"
mv "./Library/LaunchAgents/com.paloaltonetworks.gp.pangp" "./Users/Shared/mdm_agents_backup/"
echo "Done! Please Reboot"
