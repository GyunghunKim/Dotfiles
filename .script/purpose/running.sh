#!/bin/sh

# [XXmin / XXmin] The Purpose (98%)

sec=`expr match "\`cat /proc/uptime\`" "\([0-9]*\)\."`
min=`expr $sec / 60`
percentage=`expr \`expr $min \* 100\` / $MINUTES`

echo [$min/$MINUTES] $PURPOSE \($percentage\%\)

if [ $min -gt $MINUTES ]
then
    shutdown now
fi 
