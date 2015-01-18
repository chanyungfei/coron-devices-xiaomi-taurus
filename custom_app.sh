#!/bin/bash

apkBaseName=$1
tempSmaliDir=$2

if [ "$apkBaseName" = "Settings" ];then
    echo ">>> in custom_app $apkBaseName"
	
	# Remove the Official Verify Preference.
	sed -i -e "/^\.method.*setOfficialVerifyPreference()V/,/^\.end method/d" $tempSmaliDir/smali/com/android/settings/DeviceInfoSettings.smali
	sed -i -e "/setOfficialVerifyPreference/d" $tempSmaliDir/smali/com/android/settings/DeviceInfoSettings.smali	

elif [ "$apkBaseName" = "TelephonyProvider" ];then
    echo ">>> in custom_app $apkBaseName"
	sed -i 's/CREATE TABLE sms (_id INTEGER PRIMARY KEY,thread_id INTEGER,address TEXT,person INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,protocol INTEGER,read INTEGER DEFAULT 0,status INTEGER DEFAULT -1,type INTEGER,reply_path_present INTEGER,subject TEXT,body TEXT,service_center TEXT,locked INTEGER DEFAULT 0,error_code INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,ref_number INTEGER ,date_to_send INTEGER DEFAULT 0)/CREATE TABLE sms (_id INTEGER PRIMARY KEY,thread_id INTEGER,address TEXT,person INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,protocol INTEGER,read INTEGER DEFAULT 0,status INTEGER DEFAULT -1,type INTEGER,reply_path_present INTEGER,subject TEXT,body TEXT,service_center TEXT,locked INTEGER DEFAULT 0,error_code INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,ref_number INTEGER ,date_to_send INTEGER DEFAULT 0,sub_id INTEGER DEFAULT 0)/g' $tempSmaliDir/smali/com/android/providers/telephony/MmsSmsDatabaseHelper.smali

elif [ "$apkBaseName" = "TeleService" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the interface "registerForNetworkLocked" with "registerForPersoLocked""
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#registerForNetworkLocked#registerForPersoLocked#g'  

elif [ "$apkBaseName" = "Keyguard" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the field IccCardConstants$State;->NETWORK_LOCKED with IccCardConstants$State;->PERSO_LOCKED"
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#IccCardConstants$State;->NETWORK_LOCKED#IccCardConstants$State;->PERSO_LOCKED#g'

elif [ "$apkBaseName" = "SystemUI" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the field IccCardConstants$State;->NETWORK_LOCKED with IccCardConstants$State;->PERSO_LOCKED"
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#IccCardConstants$State;->NETWORK_LOCKED#IccCardConstants$State;->PERSO_LOCKED#g'

fi

