# Drone Mattermost Plugin
A plugin which can provide mattermost notify

## How to use drone Mattermost
With this plugin, we can decide whether we can send message to channel or send direct message to the user.

Therefore, we need to create bot account first and use the bot account id as the main input.


```yaml=
pipeline:
  mattermost:
    image: plugin/mattermost
    # please remove the last slash
    url: https://your-mattermost-url 
    token: XXXXX
    channel_id: XXXX
    bot_id: XXXX
    message: XXXX
    props: XXXXX
```


## Testing for sending msg to channel
```shell=
$ docker run --rm \
-e PLUGIN_TOKEN=o7kkk5qszffrjfz3ygjn8eqxse \
-e PLUGIN_CHANNEL_ID=63i6qpnakj8e5yqokeaz6tg9aa \
-e PLUGIN_BOT_ID=bot-master \
-e PLUGIN_URL=https://chat.hellosanta.tw \
-e PLUGIN_TO=victor \
-e PLUGIN_SEND_TO_CHANNEL=true \
-e DRONE_REPO_OWNER=hellosanta \
-e DRONE_REPO_NAME=sampel-project \
-e DRONE_COMMIT_SHA=45da7659390f729d97068701718adc21d81c0fd5 \
-e DRONE_COMMIT_BRANCH=master \
-e DRONE_COMMIT_AUTHOR=victor.yang \
-e DRONE_COMMIT_AUTHOR_EMAIL=victor.yang@hellosanta.com.tw \
-e DRONE_COMMIT_MESSAGE=update \
-e DRONE_BUILD_NUMBER=1 \
-e DRONE_BUILD_STATUS=success \
-e DRONE_BUILD_LINK=http://github.com/hellosanta/sample-project \
-e DRONE_JOB_STARTED=1477550560 \
-e DRONE_JOB_FINISHED=1477550580 \
plugin/mattermost
```

## Testing for sending msg directly
```shell=
$ docker run --rm \
-e PLUGIN_TOKEN=o7kkk5qszffrjfz3ygjn8eqxse \
-e PLUGIN_CHANNEL_ID=63i6qpnakj8e5yqokeaz6tg9aa \
-e PLUGIN_BOT_ID=y4u17ro4p78f5x6xkra7y4fdta \
-e PLUGIN_URL=https://chat.hellosanta.tw \
-e PLUGIN_TO=bhwy6ttagtggbqfneannk4k95a \
-e PLUGIN_SEND_TO_CHANNEL=false \
-e DRONE_REPO_OWNER=hellosanta \
-e DRONE_REPO_NAME=sampel-project \
-e DRONE_COMMIT_SHA=45da7659390f729d97068701718adc21d81c0fd5 \
-e DRONE_COMMIT_BRANCH=master \
-e DRONE_COMMIT_AUTHOR=victor.yang \
-e DRONE_COMMIT_AUTHOR_EMAIL=victor.yang@hellosanta.com.tw \
-e DRONE_COMMIT_MESSAGE=update \
-e DRONE_BUILD_NUMBER=1 \
-e DRONE_BUILD_STATUS=success \
-e DRONE_BUILD_LINK=http://github.com/hellosanta/sample-project \
-e DRONE_JOB_STARTED=1477550560 \
-e DRONE_JOB_FINISHED=1477550580 \
plugin/mattermost
```

## Reference
* https://api.mattermost.com/
* https://api.mattermost.com/#tag/channels%2Fpaths%2F~1channels~1direct%2Fpost