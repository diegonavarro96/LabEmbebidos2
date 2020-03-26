#!/bin/bash
records=(1 0 0)
r=("01/01/01 Mon 12:00:00" "01/01/01 Mon 12:00:00" "01/01/01 Mon 12:00:00")

./i2c -s77 -dw -ib 1 0x00
temp=`./i2c -s77 -dr -ib 1`
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

    for i in $records    
    do
        if [${records[$i]} -eq 1]
        then
            r[$i]="$year/$month/$date $day $hr:$min:$sec"
            index=$i
        fi
    done

    ${records[$index]} = 0
    if [$index -eq 2]
    then
        records[0]=1
    else
        records[${index+1}]=1
    fi
fi