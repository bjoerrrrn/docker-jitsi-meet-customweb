# docker-jitsi-meet-web configurable with env variables
This Container will *replace* the docker-jitsi-meet-web container.

You`ll have the additional environmental variables:
- WEB_WATERMARK_IMAGE
- WEB_WATERMARK_HEIGHT
- WEB_WATERMARK_WIDTH
- WEB_TITLE
- JITSI_WATERMARK_LINK
- HIDE_WARNING

You can set them like in this **example**:
- WEB_WATERMARK_IMAGE=https://strate.media/wp-content/uploads/2020/04/meeting.png
- WEB_WATERMARK_HEIGHT=150px
- WEB_WATERMARK_WIDTH=286px
- WEB_TITLE=Awesome Videochat
- JITSI_WATERMARK_LINK=meet.strate.media
- HIDE_WARNING=True

The logo is fetched on container creation. So if you want to change the settings you have to recreate the container.
Title and watermark are configured in interface_config.js - the file is persisted in a volume at default. You can change settings there at runtime or wipe the file and let it recreate on container creation.

A few performance options are hardcoded in Dockerfile like Resolution 480p, channelLastN: 4, enableLayerSuspension: true and disableAudioLevels: true.

I know- its a dirty hack and far from docker guidelines, but hey, take it or leave it. ;-)