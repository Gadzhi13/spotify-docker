FROM alpine:latest

WORKDIR /data

RUN apk add git alsa-lib-dev rust cargo \
 && git clone https://github.com/librespot-org/librespot \
 && cd librespot \
 && cargo build --release \
 && mv target/release/librespot /usr/local/bin \
 && mkfifo /data/fifo \
 && apk --purge del curl cargo portaudio-dev protobuf-dev

CMD librespot --name "Zinglerassistant" -u "$SPOTIFY_USERNAME" -p "$SPOTIFY_PASSWORD" --backend pipe --device "/data/fifo" --device-type "avr" --bitrate 320 --enable-volume-normalisation --initial-volume 100 --disable-discovery