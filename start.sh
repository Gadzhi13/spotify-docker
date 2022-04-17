docker build -t spotify .
docker container stop spotify
docker container rm spotify
docker run --network=host --device /dev/snd:/dev/snd --group-add audio -e SPOTIFY_USERNAME=$SPOTIFY_USERNAME -e SPOTIFY_PASSWORD=$SPOTIFY_PASSWORD --name spotify -d --restart unless-stopped --privileged spotify

forever start "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/server.js 3333