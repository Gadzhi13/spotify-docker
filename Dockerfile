FROM alpine:latest

WORKDIR /data

RUN apk add git alsa-lib-dev rust cargo \
 && git clone https://github.com/librespot-org/librespot \
 && cd librespot \
 && cargo build --release --no-default-features --features alsa-backend\
 && mv target/release/librespot /usr/local/bin 

CMD librespot --name "Zinglerassistant" -u "$SPOTIFY_USERNAME" -p "$SPOTIFY_PASSWORD" --backend "alsa" --device "hw:0,3" --device-type "avr" --bitrate 320 --enable-volume-normalisation --initial-volume 100 --disable-discovery