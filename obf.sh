#!/bin/bash
read -e -r -p "Filename: " FILE
if ! [ -e "$FILE" ];then
echo "File does not exist"
exit
fi
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r
echo -n "$(cat "$FILE")" | xxd -l 1000000000 -p | rev | xxd -p -r >".${FILE}.OBF"
echo -n "#!/bin/bash
cat \".${FILE}.OBF\" | xxd -l 10000000000000 -p | rev | xxd -p -r > .deobf.sh
chmod +x *
read -t 0.075
. .deobf.sh
read -t 0.075
rm -rf .deobf.sh
" >"${FILE}.Deobf.sh"
chmod +x "${FILE}.Deobf.sh"
