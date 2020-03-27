#!/bin/bash
rm data.txt
index=0
days=("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday")
r=("01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00" "01/01/01 Monday 12:00:00")

while sleep 5; do
./i2c -s77 -dw -ib 1 0x00
temp=`./i2c -s77 -dr -ib 1`
echo '1' $temp

temp=${temp:43:2}
#echo '2' $temp
temp=$(( 16#$temp ))
#echo '3' $temp
echo "RECEIVER> Temperature $temp C\n" >> data.txt

if [ $temp -gt 35 ]
then
    ./i2c -s104 -dw -ib 1 0x00
    sec=`./i2c -s104 -dr -ib 1`
    sec=${sec:43:2}
#    echo 'sec =' $sec
    ./i2c -s104 -dw -ib 1 0x01
    min=`./i2c -s104 -dr -ib 1`
    min=${min:43:2}
 #   echo 'min =' $min
    ./i2c -s104 -dw -ib 1 0x02
    hr=`./i2c -s104 -dr -ib 1`
    hr=${hr:43:2}
    ./i2c -s104 -dw -ib 1 0x03
    day=`./i2c -s104 -dr -ib 1`
    day=${day:43:2}
    ./i2c -s104 -dw -ib 1 0x04
    date=`./i2c -s104 -dr -ib 1`
    date=${date:43:2}
    ./i2c -s104 -dw -ib 1 0x05
    month=`./i2c -s104 -dr -ib 1`
    month=${month:43:2}
    ./i2c -s104 -dw -ib 1 0x06
    year=`./i2c -s104 -dr -ib 1`
    year=${year:43:2}
  #  echo 'year = ' $year    
    r[$index]="$year/$month/$date ${days[$day]} $hr:$min:$sec"
    echo ${r[0]} >> data.txt
    echo ${r[1]} >> data.txt
    echo ${r[2]} >> data.txt
    index=${index+1}
    index=$((index%3))
fi

done
