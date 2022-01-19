docker build -t spotify .
docker container rm spotify
docker run --network=host --device /dev/snd:/dev/snd --group-add audio -e SPOTIFY_USERNAME=$SPOTIFY_USERNAME -e SPOTIFY_PASSWORD=$SPOTIFY_PASSWORD --name spotify -d spotify