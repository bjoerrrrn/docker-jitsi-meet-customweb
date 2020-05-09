# docker-jitsi-meet-customweb
This Container will replace the docker-jitsi-meet-web container.

You`ll have the additional environmental variables:
WEB_WATERMARK_IMAGE
WEB_WATERMARK_HEIGHT
WEB_WATERMARK_WIDTH
WEB_TITLE

You can set them like in this example:
WEB_WATERMARK_IMAGE=https://strate.media/wp-content/uploads/2020/04/meeting.png
WEB_WATERMARK_HEIGHT=150px
WEB_WATERMARK_WIDTH=286px
WEB_TITLE=Awesome Videochat

The logo is fetched on container creation. So if you want to change the settings you have to recreate the container.
I know- its a dirty hack and far from docker guidelines, but hey, take it or leave it. ;-)