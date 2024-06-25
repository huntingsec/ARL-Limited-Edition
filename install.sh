#!/bin/bash

wget --tries=3 -c -nc https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.2/ARL-Limited-Edition.zip
unzip ARL-Limited-Edition.zip


unzip ARL-Limited-Edition.zip

cd ARL-Limited-Edition
chmod +x build.sh
./build.sh
