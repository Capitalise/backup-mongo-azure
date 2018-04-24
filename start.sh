#!/bin/bash

DATETIME=`date +"%Y-%m-%d_%H"`

USER_OPT=

if [ -n $MONGO_USER ]; then
    PASS_OPT="--username=${MONGO_PASSWORD}"
fi


PASS_OPT=

if [ -n $MONGO_PASSWORD ]; then
    PASS_OPT="--password=${MONGO_PASSWORD}"
fi

mongodump --gzip --archive=/tmp/$MONGO_DB-$DATETIME $USER_OPT $PASS_OPT --host=$MONGO_HOST --port=$MONGO_PORT --db $MONGO_DB

az storage blob upload --connection-string "DefaultEndpointsProtocol=https;AccountName=$AZURE_STORAGE_ACCOUNT;AccountKey=$AZURE_STORAGE_ACCESS_KEY;EndpointSuffix=core.windows.net" --container-name $AZURE_STORAGE_CONTAINER --name $MONGO_DB-$DATETIME.agz --file /tmp/$MONGO_DB-$DATETIME

rm /tmp/$MONGO_DB-$DATETIME
