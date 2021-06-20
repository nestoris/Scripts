# Useful Scripts  
Some useful scripts written for myself. Maybe will be useful for you too.

## test_colors.awk
AWK script. Makes test of different color output of awk print.<br>
Syntax:<br>
`echo "text"|awk -f ./test_colors.awk`<br>
or:<br>
`echo "text"|./test_colors.awk`<br>
or:<br>
`./test_colors.awk <<< "text"`<br>
or:<br>
`awk -f ./test_colors.awk <<< "text"`<br>

## undivide.bc
Script written on arithmetical **BC** language for finding a closest dividing operation, that can make a floating point number.