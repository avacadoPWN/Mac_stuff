#!/bin/sh

echo 'Unlocking and mounting Macintosh HD - Data'
diskutil apfs unlockVolume $(diskutil info 'Macintosh HD - Data' | grep 'Identifier' | awk '{print $NF}')

echo 'Restoring mdm demons!'
mv ./Users/Shared/mdm_daemons_backup/* ./Library/LaunchDaemons/

echo 'Restoring mdm agents!'
mv ./Users/Shared/mdm_agents_backup/* ./Library/LaunchAgents/

echo "Done! Please Reboot"
