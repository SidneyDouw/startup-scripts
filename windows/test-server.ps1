npm install -g pm2
npm install -g pm2-windows-startup
pm2-startup install

Set-Content -Path 'C:\server.js' -Value "var http = require('http');
var server = http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write('<html><body><p>Server is running</p></body></html>');
    res.end();
});
server.listen(8080)
console.log('Node.js web server at port 8080 is running..')
"

pm2 start "C:\server.js"
pm2 save

New-NetFirewallRule -DisplayName "ALLOW TCP PORT 8080" -Direction inbound -Profile Any -Action Allow -LocalPort 8080 -Protocol TCP