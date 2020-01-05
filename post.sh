#!/bin/sh

## Drone Parameter
owner=$DRONE_REPO_OWNER
repo_name=$DRONE_REPO_NAME
commit_sha=$DRONE_COMMIT_SHA
branch=$DRONE_COMMIT_BRANCH
author=$DRONE_COMMIT_AUTHOR
author_email=$DRONE_COMMIT_AUTHOR_EMAIL
commit_message=$DRONE_COMMIT_MESSAGE
number=$DRONE_BUILD_NUMBER
status=$DRONE_BUILD_STATUS
link=$DRONE_BUILD_LINK
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
message=$PLUGIN_MESSAGE

## replace string 
message="${message//\[build.owner\]/$owner}"
message="${message//\[build.repo_name\]/$repo_name}"
message="${message//\[build.commit_sha\]/$commit_sha}"
message="${message//\[build.branch\]/$branch}"
message="${message//\[build.author_email\]/$author_email}"
message="${message//\[build.commit_message\]/$commit_message}"
message="${message//\[build.status\]/$status}"
message="${message//\[build.link\]/$link}"
message="${message//\[build.job_started\]/$job_started}"
message="${message//\[build.job_finished\]/$job_finished}"
message="${message//\[build.number\]/$number}"

## Notify specific user. Only work for PLUGIN_ONLY_MATCH_EMAIL=TRUE
if [ $only_match_email ]; then
  count=$(echo $to | jq '. | length')
  for i in $(seq 1 $count);
  do
    key=$i-1
    userInfo=$(echo $to | jq '.['$key']')
    userInfo=$(echo "$userInfo" | tr -d '"')
    NotifyEmail=$(echo $userInfo | cut -d":" -f 2)
    NotifyUserName=$(echo $userInfo | cut -d":" -f 1)
    if [ "$author_email" = "$NotifyEmail" ]; then 
      message="@$NotifyUserName $message"
    fi;
  done
fi

# Send Message
apiURL="$url/api/v4/posts";

full_message=$( jq -n \
  --arg channel_id "$channel_id" \
  --arg message "$message" \
  '{channel_id: $channel_id,message: $message}')
curl -i \
    -X "POST" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${token}" \
    -d "${full_message}" \
    $apiURL