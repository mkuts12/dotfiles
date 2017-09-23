#!/bin/bash
username="WALKME\\michael.k"
id=`sudo -u $username pacmd list-modules | grep -B 2 -e 'argument: <device=hw:0,7>' | grep index | awk '{print $2}'`
hdmi_status=$(</sys/class/drm/card0/*HDMI*2*/status)
if [[ $hdmi_status == 'connected' ]]; then
	if [[ $id != '' ]]; then
		sudo -u $username pacmd unload-module $id
		else
			sudo -u $username pacmd load-module module-alsa-sink device=hw:0,7
	fi
	else
		sudo -u $username pacmd unload-module $id
fi
