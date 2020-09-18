#!/bin/bash
cat "example.sh.OBF" | xxd -l 10000000000000 -p | rev | xxd -p -r >".deobf.sh"
chmod +x *
read -t 0.075
. .deobf.sh
read -t 0.075
rm -rf .deobf.sh
