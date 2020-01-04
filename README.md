# Drone Mattermost Plugin
The main goal of this Plugin is to provide an integration between Drone and Mattermost.
We can use this Plugin as one of the CI/CD steps and send notifications to the specific channel with a custom message and mention the author in the string.

## How to use drone Mattermost
There are some environment variables need to set up. Please follow the following table, and see the description.


### Docker Environment Variable
| Parameter | Example value | Description |
| -------- | -------- | -------- |
|   url   |   https://your-mattermost-link   | please remove the last slash|
| token | o7kkk5qszffroxfgvgjn8eqxse | You can get one by create a bot account in Mattermost system backend.|
| channel_id | 63i6qpnasscfgokeaz6tg9aa|Please check the channel overview page|
| message |Build Number:[build.number] Build Status:[build.status]| You can use token in the string. Please look at the following table. |

### Message Token


| Token | Description|
| -------- | -------- |
| [build.owner]    |  Owner of the repo |
| [build.repo_name]|   |
| [build.commit_sha]    |   |
| [build.branch]    |   |
| [build.author_email]    |   |
| [build.commit_message]    |   |
| [build.status]    |   |
| [build.link]    |   |
| [build.job_started]    |   |
| [build.job_finished]    |   |
| [build.number]    |   |

### docker-compose example

```yaml=
pipeline:
  mattermost:
    image: plugin/mattermost
    # please remove the last slash
    url: https://your-mattermost-url 
    token: XXXXX
    channel_id: XXXX
    message: XXXX
```


### docker run example
```shell=
$ docker run --rm \
-e PLUGIN_TOKEN=o7kkk5qszffrjfz3ygjn8eqxse \
-e PLUGIN_CHANNEL_ID=63i6qpnakj8e5yqokeaz6tg9aa \
-e PLUGIN_URL=https://your-awesome-mattermost-url \
-e PLUGIN_TO="victor|victor.yang@hellosanta.com.tw" \
-e PLUGIN_ONLY_MATCH_EMAIL=true \
-e PLUGIN_MESSAGE="Project:[build.repo_name] Build Number:[build.number]  Message:[build.commit_message]  Build Status:[build.status]  Build Link:[build.link] Author：[build.author_email]" \
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