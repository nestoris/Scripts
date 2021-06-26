#!/usr/bin/awk -f
function rne(rusnum,raz,dva,mnogo){ # Russian Number Endings (rusnum=number; raz -- ending for 1, 21, 101, etc; dva -- 2-4, 22-24, 102-104...; mnogo -- 0, 5-20, 25-30, 95-100...)
 rusnum_tmp[1]=substr(rusnum,length(rusnum),1) #getting units
 rusnum_tmp[2]=substr(rusnum,length(rusnum)-1,1) #getting tens
 rusnum_tmp[1]=rusnum_tmp[1]/1 #converting string to number
 rusnum_tmp[2]=rusnum_tmp[2]/1
 if(rusnum_tmp[1]==1&&(rusnum_tmp[2]!=1||length(rusnum)==1)){
  outrusend=raz
 }else{
  if(rusnum_tmp[1]<=4&&rusnum_tmp[1]>=2&&rusnum_tmp[2]!=1){outrusend=dva}else{outrusend=mnogo}
 }
 return outrusend;
}
