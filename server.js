var express = require('express')
var app = express()
const { exec } = require('child_process')

app.use(express.json())

var restart_spotify = () => {
  exec('sh ' + __dirname + '/start.sh',
        (error, stdout, stderr) => {
            console.log(stdout)
            console.log(stderr)
            if (error !== null) {
                console.log(`exec error: ${error}`)
            }
        })
      }

app.post('/restart_spotify', function(request, response) {
  console.log('POST /restart_spotify')
  if (request.body.restart) {
    restart_spotify()
    response.writeHead(200, {'Content-Type': 'text/html'})
    response.end('Spotify restarted')
  }
  response.writeHead(404, {'Content-Type': 'text/html'})
  response.end('What are you looking for in here?')
})

var port = 3333

if (process.argv[2]) {
  port = process.argv[2]
}

app.listen(port)
console.log(`Listening at http://localhost:${port}`)