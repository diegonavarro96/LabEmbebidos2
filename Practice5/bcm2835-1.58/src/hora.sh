#!/bin/bash
hora=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`
year=`date "+%y"`
month=`date "+%m"`
day=`date "+%d"`
dayWeek=`date "+%u"`
echo $year $month $day $dayWeek
./i2c -s104 -dw -ib 1 0x00

./i2c -s104 -dw -ib 8 0x00 0x$sec 0x$min 0x$hora 0x$dayWeek 0x$day 0x$month 0x$year 

./i2c -s104 -dw -ib 1 0x00

./i2c -s104 -dr -ib 7
