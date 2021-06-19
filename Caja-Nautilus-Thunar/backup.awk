#!/usr/bin/gawk -f
## Script for NAUTILUS/CAJA for making dated backups of your files in ~/bak dir with named subdirs by containing folder's name.
BEGIN{
 split(ENVIRON["NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"],fils,"\n") #make array of input files
 for(i in fils){
  dirname=fils[i];gsub(/[^\/]*$/,"",dirname);gsub(/\/$/,"",dirname);gsub(/^.*\//,"",dirname) #get name of containing folder
  basename=fils[i];gsub(/^.*\//,"",basename) #get base name of file
#  if(basename~"."){split(basename,namext,".")}else{namext[1]=basename;namext[2]=""}
  split(basename,namext,".") #split basename to name and ext
  if(length(fils[i])>0){ #if not empty string
   namext[2]=(namext[2]?"."namext[2]:"") #if basename contains ".", then add dot to ext
   system("mkdir -p \""ENVIRON["HOME"]"/bak/"dirname"\"") #make named directory even if it exists
   system("cp \""fils[i]"\" \""ENVIRON["HOME"]"/bak/"dirname"/"namext[1]"_$(date +%Y.%m.%d_%H-%M-%S)"namext[2]"\"") #copy a file there
  }
 }
}

