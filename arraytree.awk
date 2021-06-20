#!/usr/bin/gawk -f
function arraytree(inputarray,arrname,i,member,arrnum){
 if(!isarray(inputarray)){
  print indent arrname member "[\033[1;31m" i "\033[0m]=\"\033[1;32m" inputarray"\033[0m\""
 }else{
  arrnum=i
  member=i?member "[" i "]":""
  print indent (i? arrname member:arrname)"(\033[1;34m" length(inputarray) " member"(length(inputarray)>1?"s":"")"\033[0m)"
  indent=indent " "
  for(i in inputarray){
   arraytree(inputarray[i],arrname,i,member,arrnum)}
   indent=substr(indent,1,length(indent)-1)
  }
}

BEGIN{
arraytree(ENVIRON,"ENVIRON")
}
