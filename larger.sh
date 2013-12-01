#/bin/bash
if [ -z "$1" -o -z "$2" ]; then echo "Enter two parameters at least please ! >_< "; exit 1; else [ ! ]; fi
if [ ! -f $1 ]; then echo -e "File $1 doesn't exists\nBe careful please :( "; exit 1; else [ ! ]; fi
if [ ! -f $2 ]; then echo -e "File $2 doesn't exists\nBe ceraful please :( "; exit 1; else [ ! ]; fi
firstz=`du -b $1 |cut -f1`; secondz=`du -b $2|cut -f1`
if   [ "$firstz" -gt "$secondz" ]; then echo "\"$1\" > \"$2\", \"$1\" Is Larger Than \"$2\" ."
elif [ "$firstz" -lt "$secondz" ]; then echo "\"$2\" > \"$1\", \"$2\" Is Larger Than \"$1\" ."
elif [ "$firstz" -eq "$secondz" ]; then echo "\"$1\" = \"$2\" : Are exactly equal by byte"; 
fi; exit 0

