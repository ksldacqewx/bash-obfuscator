#!/bin/bash
mkdir obfuscations 2>/dev/null
if [ "$1" == "" ];then
exit
fi
FILE="$1"
if ! [ -e "$FILE" ];then
echo "File does not exist"
exit
fi
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r >"obfuscations/${FILE}.OBF"
echo -n "#!/bin/bash
cat \"${FILE}.OBF\" | xxd -l 10000000000000 -p | rev | xxd -p -r >\".deobf.sh\"
chmod +x *
read -t 0.075
. .deobf.sh
read -t 0.075
rm -rf .deobf.sh
" >"obfuscations/${FILE}.Deobf.sh"
chmod +x obfuscations/*
echo ""
ls obfuscations/
echo ""
