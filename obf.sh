#!/bin/bash
mkdir obfuscations 2>/dev/null
read -e -r -p "Filename: " FILE
if ! [ -e "$FILE" ];then
echo "File does not exist"
exit
fi
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r >"obfuscations/${FILE}.OBF"
echo -n "#!/bin/bash
cat \"${FILE}.OBF\" | xxd -l 10000000000000 -p | rev | xxd -p -r >\".${FILE}.deobf.sh\"
chmod +x *
read -t 0.075
. .${FILE}.deobf.sh
read -t 0.075
rm -rf .${FILE}.deobf.sh
" >"obfuscations/${FILE}.deobf.sh"
chmod +x obfuscations/*
echo ""
ls obfuscations/
echo ""
