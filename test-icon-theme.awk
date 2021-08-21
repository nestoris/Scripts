#!/usr/bin/gawk -f
@load "gd"
@load "time"
@load "readdir"
@load "filefuncs"
@include "arraytree.awk"

function getres(	fil,ret){
img=gdImageCreateFromFile(fil,"GDFILE_PNG")
err=ERRNO
ERRNO=""
ret=gdImageSX(img) " " gdImageSY(img)
ERRNO=""
gdImageDestroy(img)
return ret
}

function _getres(	fil){
cmd="identify -format '%w' " fil
while((cmd|getline)>0){return $0}
#return gdImageSY(img)
}

function readsizes1(	rdir){
FS="/"
while((getline < rdir)>0){szs=getres(rdir $2) ": "($3=="l"?"\033[2m":"\033[1m") $2 "\033[0m";if(szs!~/^-/){print szs}}

}

function checksizes(	root,fldr,size,sza){
fstmp=FS
FS="/"
rdir=root fldr "/"
while((getline < rdir)>0){
ext=$2;gsub(/(.*)\./,"",ext)
if(ext=="png"){
szs=getres(rdir $2)
split(szs,sza," ")
#sza[1]=sza[1]/1
#sza[2]=sza[2]/1
#size=size/1
#print sza[1] " " sza[2]" "size
if(sza[2]!=size || sza[1]!=size){
print bold root green fldr normal bold "/" ($2?$2:"") normal " : " (sza[1]<0?"- "red"Unreadable!"normal: (sza[1]!=size?red:"")sza[1] normal "x" (sza[2]!=size?red:"")sza[2]) normal
}
}
}
FS=fstmp
}

function getdirs(	theme){
 fstmp=FS
 rstmp=RS
 ofstmp=OFS
 FS="\n|\r"; RS="[\n.*][[]"; OFS=":"
 if(theme){
  while((getline < theme)>0){
   sub(/.$/,"",$1)
   #printf "%s ", $1
   for(i=2;i<=NF;i++){
    if(tolower($i)~/^size/){sub(/.*=/,"",$i);esize=$i}
    if(tolower($i)~/type=/){sub(/.*=/,"",$i);etype=$i}
   }
   if(tolower(etype)!~"scalable"){sizes[$1]=esize}
  }
 }
 FS=fstmp
 RS=rstmp
 OFS=ofstmp
}

function chkszsthm(	thm,i,thmpath){
 stat(thm,statdata)
 thmpath=statdata["name"]
 getdirs(thmpath)
 gsub(/[^\/\/]*$/,"",thmpath)
 for(i in sizes){
#  print thmpath i "/"
  checksizes(thmpath, i, sizes[i])
  #checksizes(i, sizes[i])
 }
}

BEGIN{

start=gettimeofday()*1000
dark="\033[2m"
bold="\033[1m"
normal="\033[0m"
red="\033[31;1m"
green="\033[32m"

for(thf=1;thf<=ARGC;thf++){chkszsthm(ARGV[thf])}

#stat("/home/joker/Документы/icons/SE98/apps/32/sqlitebrowser.png",statdata)
#stat("/home/joker/Документы/icons/SE98/actions/24/stock_select-all.png",statdata)
#stat("/home/joker/Документы/icons/SE98/mimetypes/32/text-x-sql.png",statdata)
#arraytree(statdata,"statdata")

#getdirs("/home/joker/Документы/icons/SE98/index.theme")
#arraytree(folders,"folders")
#print getres("/home/joker/Документы/icons/SE98/places/64/folder.png")

#readsizes1("/home/joker/Документы/icons/SE98/places/64/")
#checksizes("/home/joker/Документы/icons/SE98/places/64/",64)

end=gettimeofday()*1000
printf "%.3f%s\n", (end-start), " мс."
exit;
}
