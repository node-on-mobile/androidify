#! /bin/bash

set -e

SRC_DIR=$(dirname $(readlink -e $BASH_SOURCE))

echo $SRC_DIR

APP_DIR=$PWD

TMP_DIR=/tmp/`date +%s`/app

#echo $SRC_DIR $APP_DIR $TMP_DIR

mkdir -p $TMP_DIR

cd $TMP_DIR

echo $TMP_DIR

unzip $SRC_DIR/resources/base.apk

# clear old app html data
rm -rf assets/www/*
# clear old certs
rm META-INF/*.RSA
rm META-INF/*.SF

echo cp -R $APP_DIR/ ./assets/www/

cp -R $APP_DIR/* ./assets/www/
zip -r app.apk .
echo $TMP_DIR/app.apk

ls $TMP_DIR

#ls $SRC_DIR

#cd $SRC_DIR
jarsigner -verbose -keystore $SRC_DIR/whatever.keystore app.apk -storepass whatever whatever

cp app.apk $APP_DIR

echo created app.apk
echo run: adb install app.apk
