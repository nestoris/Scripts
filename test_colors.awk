#!/usr/bin/gawk -f
ARGV[1]="/dev/null"
ARGC=1
function starttime(){ #Выполнить в начале, для использования finishtime() - показать время выполнения скрипта.
cmd = "date +%s%N";
while ((cmd|getline startdate)>0);
close(cmd)}

function finishtime(){
 cmd = "date +%s%N";
 while ((cmd|getline finishdate)>0);
 close(cmd)
 diff=(finishdate-startdate)/1000000;
 print "Время выполнения: " diff " мс"
}

BEGIN{
 starttime()
}
{
 for(i=29;i<=108;i++){
 if(i<100){spac="  "}else{spac=" "}
 for(j=1;j<=9;j++)
 {printf "%s"spac"%s", "\033["j";"i"m" $0, "\\033["j";"i"m" "\033[0m"}
 print "\n"
}
}

END{
 print ARGC
 finishtime()
}
