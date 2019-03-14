#!/bin/sh

nohup chromium \
    --disable-accelerated-2d-canvas \
    --disable-background-networking \
    --disable-background-timer-throttling \
    --disable-breakpad \
    --disable-client-side-phishing-detection \
    --disable-cloud-import \
    --disable-default-apps \
    --disable-dev-shm-usage \
    --disable-extensions \
    --disable-gesture-typing \
    --disable-gpu \
    --disable-hang-monitor \
    --disable-infobars \
    --disable-notifications \
    --disable-offer-store-unmasked-wallet-cards \
    --disable-offer-upload-credit-cards \
    --disable-popup-blocking \
    --disable-print-preview \
    --disable-prompt-on-repost \
    --disable-setuid-sandbox \
    --disable-software-rasterizer \
    --disable-speech-api \
    --disable-sync \
    --disable-tab-for-desktop-share \
    --disable-translate \
    --disable-voice-input \
    --disable-wake-on-wifi \
    --enable-async-dns \
    --enable-simple-cache-backend \
    --enable-tcp-fast-open \
    --headless \
    --hide-scrollbars \
    --ignore-certificate-errors \
    --ignore-certificate-errors-spki-list \
    --ignore-ssl-errors \
    --media-cache-size=33554432 \
    --memory-pressure-off \
    --metrics-recording-only \
    --mute-audio \
    --no-default-browser-check \
    --no-first-run \
    --no-pings \
    --no-sandbox \
    --no-zygote \
    --password-store=basic \
    --prerender-from-omnibox=disabled \
    --remote-debugging-port=9222 \
    --remote-debugging-address=0.0.0.0 \
    --safebrowsing-disable-auto-update \
    --use-mock-keychain \
    --user-data-dir=/tmp
