#!/bin/bash
index=0
days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
r=("01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00")

./i2c -s77 -dw -ib 1 0x00
temp=`./i2c -s77 -dr -ib 1`
temp=$(( 16#$temp ))
echo "RECEIVER> Temperature $temp C\n" >>data.txt

if [$temp -gt 35]
then
    ./i2c -s104 -dw -ib 1 0x00
    sec=`./i2c -s104 -dr -ib 1`
    min=`./i2c -s104 -dr -ib 1`
    hr=`./i2c -s104 -dr -ib 1`
    day=`./i2c -s104 -dr -ib 1`
    date=`./i2c -s104 -dr -ib 1`
    month=`./i2c -s104 -dr -ib 1`
    year=`./i2c -s104 -dr -ib 1`
   
    r[$index]="$year/$month/$date ${days[$day]} $hr:$min:$sec"
    
    index=${index+1}
    index=$((index%3))
fi

