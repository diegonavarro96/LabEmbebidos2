#!/bin/bash
index=0
days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
r=("01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00")

./i2c -s77 -dw -ib 1 0x00
temp=`./i2c -s77 -dr -ib 1`
echo '1' $temp

temp=${temp:43:2}
echo '2' $temp
temp=$(( 16#$temp ))
echo '3' $temp
echo "RECEIVER> Temperature $temp C\n" >> data.txt

if [ $temp -gt 25 ]
then
    ./i2c -s104 -dw -ib 1 0x00
    sec=`./i2c -s104 -dr -ib 1`
    sec=${sec:108:2}
    min=`./i2c -s104 -dr -ib 1`
    min=${min:108:2}
    hr=`./i2c -s104 -dr -ib 1`
    hr=${hr:43:2}
    day=`./i2c -s104 -dr -ib 1`
    day=${day:108:2}
    date=`./i2c -s104 -dr -ib 1`
    date=${date:108:2}
    month=`./i2c -s104 -dr -ib 1`
    month=${month:108:2}
    year=`./i2c -s104 -dr -ib 1`
    year=${year:108:2}   
    r[$index]="$year/$month/$date ${days[$day]} $hr:$min:$sec"
    for i in $r 
    do 
    echo $i >> data.txt
    done
    index=${index+1}
    index=$((index%3))
fi

