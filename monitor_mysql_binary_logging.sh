#!/bin/bash

export MYSQL_PWD=XXXXXXXXXX
FOLDER2MONITOR=/srv/log/mysql/
MAXPERCENTAGE2USE=79
MINIMUMBINLOG2KEEP=5
USEDPERCENTAGE=$(df --output=pcent $FOLDER2MONITOR | sed 's/[^0-9]*//g')

if [ "$USEDPERCENTAGE" -ge "$MAXPERCENTAGE2USE" ]; then
        AMOUNTOFBINLOG=$(ls -rt $FOLDER2MONITOR | grep -v index | wc -l)
        if [ "$AMOUNTOFBINLOG" -gt "$MINIMUMBINLOG2KEEP" ] ; then
                OLDEST_BIN_LOG_FILE2KEEP=$(ls -rt $FOLDER2MONITOR | grep -v index | sed -n ""$MINIMUMBINLOG2KEEP"p")
                #echo $OLDEST_BIN_LOG_FILE2KEEP
                #echo "PURGE BINARY LOGS TO '$OLDEST_BIN_LOG_FILE2KEEP';"
                mysql -e "PURGE BINARY LOGS TO '$OLDEST_BIN_LOG_FILE2KEEP';"
        fi
fi
