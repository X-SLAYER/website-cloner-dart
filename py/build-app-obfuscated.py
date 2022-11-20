#!/usr/bin/python
import os
cmd = "flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbol"
os.system(cmd)