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
Script written on arithmetical **BC** language for finding a closest dividing operation, that can make a floating point number.<br>For running directly -- just make script executable by: "`$chmod +x undivide.bc`", and edit variables: 'count', 'number' and 'afterdot'.<br>Usage in bash scripts:
```
#!/bin/bash
count=2000 #how many multipliers to test with number
number=3.14159265358979323846264338327950288419716939937508 #our number
afterdot=8 #limit of digits after dot
bc -q <<< $(sed 's/^count=.*$/count='$count'/g;s/^number=.*$/number='$number'/g;s/^afterdot=.*$/afterdot='$afterdot'/g;' ./undivide.bc)
```