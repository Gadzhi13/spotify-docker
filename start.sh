docker run --network=host --device /dev/snd --group-add audio -e SPOTIFY_USERNAME=$SPOTIFY_USERNAME -e SPOTIFY_PASSWORD=$SPOTIFY_PASSWORD -d spotify