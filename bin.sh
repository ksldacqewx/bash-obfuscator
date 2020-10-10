#!/bin/bash
mkdir obfuscations 2>/dev/null
read -e -r -p "Filename: " FILE
if ! [ -e "$FILE" ];then
echo "File does not exist"
exit
fi
DATA="$(cat $FILE | base64 -w 0)"
echo "#!/bin/bash
echo \"$DATA\" | base64 -d > $FILE.deobf
chmod +x $FILE.deobf
./$FILE.deobf
rm $FILE.deobf
rm $FILE.tmp" > obfuscations/$FILE.sh
chmod +x ./obfuscations/*
