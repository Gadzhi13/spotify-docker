FROM alpine:latest

WORKDIR /data

RUN apk add git alsa-lib-dev rust cargo alsa-utils alsa-utils-doc alsa-lib alsaconf alsa-ucm-conf\
 && git clone https://github.com/librespot-org/librespot \
 && cd librespot \
 && cargo build --release \
 && mv target/release/librespot /usr/local/bin 

CMD librespot --name "Zinglerassistant" -u "$SPOTIFY_USERNAME" -p "$SPOTIFY_PASSWORD" --backend alsa --device-type "avr" --bitrate 320 --enable-volume-normalisation --initial-volume 100 --disable-discovery