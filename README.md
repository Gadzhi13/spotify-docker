# spotify-docker
librespot in docker

# run
npm install
./start.sh

this will run the node server in background on port 3333. Server is needed for restarts if spotify is crashing. To change default port you can adjust it in start.sh

To restart spotify from Home Assistant add this to configuration YAML:
rest_command:
  restart_spotify:
    url: "http://${your_url}:3333/restart_spotify"
    method: POST
    content_type: "application/json"
    payload: '{"restart": true}'

or send a post with a json '{"restart": true}' to 'http://${your_url}:3333/restart_spotify'