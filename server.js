var express = require('express')
var app = express()
const { exec } = require('child_process');

var restart_spotify = exec('sh /home/gadzhi/projects/spotify-docker/start.sh',
        (error, stdout, stderr) => {
            console.log(stdout);
            console.log(stderr);
            if (error !== null) {
                console.log(`exec error: ${error}`);
            }
        });

app.post('/restart_spotify', function(request, response) {
  console.log('POST /restart_spotify')
  restart_spotify();
  response.writeHead(200, {'Content-Type': 'text/html'})
  response.end('Spotify restarted')
})

const port = 3000
app.listen(port)
console.log(`Listening at http://localhost:${port}`)