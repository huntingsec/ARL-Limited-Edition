#!/bin/bash

wget -t -c -nc https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.2/ARL-limited-edition.zip
unzip ARL-Limited-Edition.zip

cd ARL-Limited-Edition
chmod +x build.sh
./build.sh
