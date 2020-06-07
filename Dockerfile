FROM jitsi/web:latest
LABEL maintainer "bjoern <bjoern@strate.media>"

RUN apt-dpkg-wrap apt-get update && \
	apt-dpkg-wrap apt-get install -y curl && \
	apt-cleanup && \
	echo 'if [ -z ${WEB_WATERMARK_IMAGE+x} ]; then echo ""; else rm -f /usr/share/jitsi-meet/images/watermark.png && curl $WEB_WATERMARK_IMAGE --output /usr/share/jitsi-meet/images/watermark.png; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${WEB_WATERMARK_HEIGHT+x} ]; then echo ""; else sed -i "s/height:74px;/height:$WEB_WATERMARK_HEIGHT;/g" /usr/share/jitsi-meet/css/all.css; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${WEB_WATERMARK_WIDTH+x} ]; then echo ""; else sed -i "s/width:186px;/width:$WEB_WATERMARK_WIDTH;/g" /usr/share/jitsi-meet/css/all.css; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${WEB_TITLE+x} ]; then echo ""; else sed -i "s/Jitsi Meet/$WEB_TITLE/g" /usr/share/jitsi-meet/title.html; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${WEB_TITLE+x} ]; then echo ""; else sed -i "s/Jitsi Meet/$WEB_TITLE/g" /config/interface_config.js; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${HIDE_WARNING+x} ]; then echo ""; else sed -i "s/.circular-label.insecure{background:#d77976}/.circular-label.insecure{display:none!important;background:#d77976}/g" /usr/share/jitsi-meet/css/all.css; fi' >> /etc/cont-init.d/10-config && \
	echo 'if [ -z ${JITSI_WATERMARK_LINK+x} ]; then echo ""; else sed -i "s/jitsi.org/$JITSI_WATERMARK_LINK/g" /config/interface_config.js; fi' >> /etc/cont-init.d/10-config && \
	echo 'sed -i "s/channelLastN: -1,/channelLastN: 4,enableLayerSuspension: true,disableAudioLevels: true,resolution: 480,/g" /config/config.js; fi' >> /etc/cont-init.d/10-config
	
	