# Drone Mattermost Plugin
A plugin which can provide mattermost notify

## How to use drone Mattermost

```yaml=

pipeline:
  mattermost:
    image: plugin/mattermost
    url: https://your-mattermost-url # please remove the last slash
    token: XXXXX
    channel_id: XXXX
    message: XXXX
    props: XXXXX
```