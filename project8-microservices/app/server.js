const http = require('http');
const name = process.env.SERVICE_NAME || 'service';
const calls = (process.env.CALL_URLS || '').split(',').filter(Boolean);

http.createServer(async (req, res) => {
  const out = { service: name, mongoHost: process.env.MONGO_HOST, time: new Date().toISOString(), downstream: {} };
  for (const u of calls) {
    try {
      const r = await fetch(u, { signal: AbortSignal.timeout(2000) });
      out.downstream[u] = await r.json();
    } catch (e) { out.downstream[u] = 'unreachable: ' + e.message; }
  }
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify(out, null, 2));
}).listen(3000, () => console.log(name + ' listening on 3000'));
