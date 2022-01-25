#!/usr/bin/gawk -f

#######################################
#
# script for converting list of image
# files to a MarkDown table
#
# the first argument is how many images
# will be in each row
#
# Syntax:
# ls | list2mdtable.awk [count]
#
#######################################

# как выполнять:
# ls | list2mdtable.awk 48
# 48 -- сколько картинок в ширину

BEGIN{
for(i in ARGV){
#print ARGV[i]
switch(ARGV[i]){
case /^[0-9]+$/:
width=$0
argv[i]=ARGV[i]
delete ARGV[i]
break
}
}
}

/\.(sv|pn)g$/{f++;files[f]=$1}

END{
for(i in argv){

for(f in files){

if(f==argv[i]+1){for(j=1;j<=argv[i];j++){printf "%s"(j<argv[i]?"":"|\n"), "|-"}}
printf "|%s"(f%argv[i]==0?"|\n":""), "![]("files[f]")" #gensub(/\.[^.]*$/,"",1,gensub(/^.*\//,"",1))""


}
print i==length(argv)?"":"\n\n"
}
#print NR
}
