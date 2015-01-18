#/bin/bash

echo "in $0"

OUT_DIR=~/coron/4.4/devices/mi2a/out/merged_target_files

cd $OUT_DIR
mkdir -vp DATA/app
mv -f $OUT_DIR/SYSTEM/app/BaiduMap.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/BaiYiSearch.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/Email.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/Exchange2.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/iReader.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/priv-app/GameCenter.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/BaiduUserFeedback.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/SearchBox.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/BaiduNotepad.apk $OUT_DIR/DATA/app
mv -f $OUT_DIR/SYSTEM/app/YiYueDu.apk $OUT_DIR/DATA/app
