#!/bin/bash

apt-get update && \
   apt-get install -y software-properties-common net-tools && \
   apt-add-repository 'deb http://repo.owntracks.org/debian jessie main' && \
   apt-add-repository 'deb http://repo.mosquitto.org/debian jessie main' && \
   apt-get update && \
   apt-get install -y --force-yes \
	libmosquitto1 \
	libsodium13 \
	libcurl3 \
	liblua5.2-0 \
	mosquitto \
	mosquitto-clients \
	supervisor \
	ot-recorder \
	curl \
	&& \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*


cp ot-recorder.default /etc/default/ot-recorder
   
cp launcher.sh /usr/local/sbin/owntracks
chmod +x /usr/local/sbin/owntracks

cp generate-CA.sh /usr/local/sbin/generate-CA.sh

#mkdir -p -m 775 /etc/supervisor/conf.d/
cp supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#mkdir -p -m 775 /etc/mosquitto
cp mosquitto.passwd mosquitto.conf mosquitto.acl /etc/mosquitto/
mkdir -p -m 775 /var/log/supervisor && \
mkdir -p -m 775 /owntracks/recorder/store && \
chown -R owntracks:owntracks /owntracks && \
chmod 755 /usr/local/sbin/owntracks /usr/local/sbin/generate-CA.sh

/etc/init.d/mosquitto stop
chmod -x /etc/init.d/mosquitto

#cp owntracks /etc/init.d/owntracks
#chmod +x /etc/init.d/owntracks

#/etc/init.d/owntracks start
