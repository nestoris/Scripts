#!/usr/bin/gawk -f
BEGIN{
delete ARGV
if(ENVIRON["NAUTILUS_SCRIPT_NEXT_PANE_CURRENT_URI"]){
args=ENVIRON["NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"]
cmd="gio info '"ENVIRON["NAUTILUS_SCRIPT_NEXT_PANE_CURRENT_URI"]"'|awk '/^uri:/{x=NR+1;next};NR==x{gsub(/.*: /,\"\",$0);print}'"
cmd | getline aw
split(args,a,"\n")
for(i in a){
if(length(a[i])>0){system("ln '"a[i]"' '" aw "'")}
}
close(cmd);
}
}
