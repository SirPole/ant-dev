#!/bin/sh

nohup google-chrome \
	--disable-background-networking \
	--disable-default-apps \
	--disable-extensions \
	--disable-gpu \
	--disable-sync \
	--disable-translate \
	--headless \
	--hide-scrollbars \
	--ignore-certificate-errors \
	--ignore-certificate-errors-spki-list \
	--ignore-ssl-errors \
	--metrics-recording-only \
	--mute-audio \
	--no-first-run \
	--no-sandbox \
	--remote-debugging-port=9222 \
	--remote-debugging-address=0.0.0.0 \
	--safebrowsing-disable-auto-update \
	--user-data-dir=/tmp
