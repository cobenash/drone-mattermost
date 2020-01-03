# Drone Mattermost Plugin
A plugin which can provide mattermost notify

## How to use drone Mattermost

```yaml=
pipeline:
  mattermost:
    image: plugin/mattermost
    # please remove the last slash
    url: https://your-mattermost-url 
    token: XXXXX
    channel_id: XXXX
    message: XXXX
    props: XXXXX
```

```shell=
$ docker run --rm \
-e PLUGIN_TOKEN=o7kkk5qszffrjfz3ygjn8eqxse \
-e PLUGIN_CHANNEL_ID=63i6qpnakj8e5yqokeaz6tg9aa \
-e PLUGIN_URL=https://chat.hellosanta.tw \
plugin/mattermost
```