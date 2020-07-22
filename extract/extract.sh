#! /bin/bash

#file script name is : extract
#description:
#creation date Mon 29 Jun 19:33:16 CET 2020
#Created by: omw

#check if you have entered an argument
if [[ $# -eq 0 ]]; then
   echo "no file entered"
   exit 1
fi


for compr in "$@"
do
#check if the file or directory exist
   if [[ -e $compr ]];then
      case $compr in
         *.tar) tar -xvf $compr ;;
         *.tar.gz)tar -zxvf $compr ;;
         *.tar.bz2)tar -jxvf $compr ;;
         *.tar.xz)tar -Jxvf $compr ;;
         *.xz) xz -d $compr ;;
         *.bz2) bunzip2 $compr ;;
         *.gz) gunzip $compr ;;
         *.zip) unzip $compr ;;
         *.rar) unrar e $compr ;;
         *) echo "$compr cannot be extracted by 'extract' " ;;
       esac
   else echo "the compressed file or directory does not exist"
   fi

done
