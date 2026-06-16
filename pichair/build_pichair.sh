#!/bin/bash

flutterpi_tool build --arch=arm64 --cpu=pi4 --release

(cd build/flutter-pi && zip -r ../../release/pichair.zip pi4-64)
