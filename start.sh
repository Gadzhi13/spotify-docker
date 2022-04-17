docker build -t spotify .
docker container stop spotify
docker container rm spotify
docker run --network=host --device /dev/snd:/dev/snd --group-add audio -e SPOTIFY_USERNAME=$SPOTIFY_USERNAME -e SPOTIFY_PASSWORD=$SPOTIFY_PASSWORD --name spotify -d --restart unless-stopped spotify

forever start $BASH_SOURCE/server.js 3333