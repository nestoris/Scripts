#!/usr/bin/gawk -f

BEGIN{
 colnum=0
 IGNORECASE=1
 colorline="31 32 33 34 35 36 41 42 43 45 46"
 split(colorline,ca)
 for(i=1;i<ARGC;i++){
  marker[i]=ARGV[i]
  colnum=colnum<length(ca)?colnum+1:colnum-length(ca)
  color[i]="\033[1;"ca[colnum]"m"
 delete ARGV[i]
}
 black="\033[0m"
 color[0]=black
}

{
 for(i in marker){
  u=gsub(marker[i],color[i]"&"black,$0)
#  $0 = $0 " " color[i] u black
  colorprev=color[i]
 }
 print
}
