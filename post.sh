#!/bin/sh

## Drone Parameter
owner=$DRONE_REPO_OWNER
repo_name=$DRONE_REPO_NAME
commit_sha=$DRONE_COMMIT_SHA
branch=$DRONE_COMMIT_BRANCH
author=$DRONE_COMMIT_AUTHOR
author_email=$DRONE_COMMIT_AUTHOR_EMAIL
commit_message=$DRONE_COMMIT_MESSAGE
build_number=$DRONE_BUILD_NUMBER
status=$DRONE_BUILD_STATUS
build_link=$DRONE_BUILD_LINK
job_started=$DRONE_JOB_STARTED
job_finished=$DRONE_JOB_FINISHED
# End of drone parameter

## Parameter sent from docker
url=$PLUGIN_URL
token=$PLUGIN_TOKEN
channel_id=$PLUGIN_CHANNEL_ID
bot_id=$PLUGIN_BOT_ID
to=$PLUGIN_TO
only_match_email=$PLUGIN_ONLY_MATCH_EMAIL
send_to_channel=$PLUGIN_SEND_TO_CHANNEL
message=$PLUGIN_MESSAGE

## API Type
## If the send_to_channel is direct, we must provide the PLUGIN_TO parameter, or it will throw the error.
if $send_to_channel ; then
  apiURL="$url/api/v4/posts";
  ## Establish Sending Message send to channel.
  full_message='{"channel_id": "'${channel_id}'", "message":"'${DRONE_BUILD_STATUS}'"}';
  ## 傳送資料
  curl -i \
    -X "POST" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${token}" \
    -d "${full_message}" \
    $apiURL

else
  apiURL="$url/api/v4/channels/direct";
  Direct_Array=$( jq -n \
  --arg bot "$bot_id" \
  --arg user "$to" \
  '{$bot,$user}')
  echo $DirectArray
  ## 傳送資料
  # curl -i \
  #   -X "POST" \
  #   -H "Content-Type: application/json" \
  #   -H "Authorization: Bearer ${token}" \
  #   -d "${DirectArray}" \
  #   $apiURL
  # rtnFromMM=$(curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $token" -d $DirectArray $apiURL)
  # echo $rtnFromMM
fi




BUCKET_NAME=testbucket
OBJECT_NAME=testworkflow-2.0.1.jar
TARGET_LOCATION=/opt/test/testworkflow-2.0.1.jar

JSON_STRING=$( jq -n \
                  --arg bn "$BUCKET_NAME" \
                  --arg on "$OBJECT_NAME" \
                  --arg tl "$TARGET_LOCATION" \
                  '{bucketname: $bn, objectname: $on, targetlocation: $tl}' )



echo $JSON_STRING
# echo $full_message;
# echo $apiURL;