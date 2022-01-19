FROM alpine:latest

WORKDIR /data

RUN apk -U add libgcc curl cargo portaudio-dev protobuf-dev \
 && cd /root \
 && curl -LO https://github.com/librespot-org/librespot/archive/master.zip \
 && unzip master.zip \
 && cd librespot-master \
 && cargo build --jobs $(grep -c ^processor /proc/cpuinfo) --release --no-default-features \
 && mv target/release/librespot /usr/local/bin \
 && cd / \
 && apk --purge del curl cargo portaudio-dev protobuf-dev \
 && apk add llvm-libunwind \
 && rm -rf /etc/ssl /var/cache/apk/* /lib/apk/db/* /root/master.zip /root/librespot-master /root/.cargo

 ENV SPOTIFY_USERNAME=$SPOTIFY_USERNAME
 ENV SPOTIFY_PASSWORD=$SPOTIFY_PASSWORD

CMD librespot --name "Zinglerassistant" -u "$SPOTIFY_USERNAME" -p "$SPOTIFY_PASSWORD" --device "avr" --bitrate "360" --backend pulseaudio --enable-volume-normalisation --linear-volume --initial-volume="90" --disable-discovery