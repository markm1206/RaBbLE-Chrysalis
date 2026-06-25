const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

const SPELLS_DIR = __dirname;
const CHRYSALIS_ROOT = path.dirname(SPELLS_DIR);
const COLLECTIVE_ROOT = path.dirname(CHRYSALIS_ROOT);
const AETHER_ROOT = path.join(COLLECTIVE_ROOT, 'RaBbLE-Aether');
const NEBULA_ROOT = path.join(COLLECTIVE_ROOT, 'RaBbLE-NeBuLA');
const CHRYSALIS_WEB = path.join(CHRYSALIS_ROOT, 'Chrysalis-Web');

const PORT = parseInt(process.env.DEV_PORT || '8081', 10);
const HOSTNAME = 'localhost';

const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);
  let pathname = parsedUrl.pathname;

  // Handle prefix variations (/chrystalis/ or /chrysalis/) to resolve pathing
  const prefixMatch = pathname.match(/^\/(?:chry|chrys)talis(?:-web)?(\/|$)/i);
  if (prefixMatch) {
    pathname = pathname.substring(prefixMatch[0].length - 1);
    if (!pathname.startsWith('/')) {
      pathname = '/' + pathname;
    }
  }

  let filePath;

  // Map CDN paths to local directories
  if (pathname.startsWith('/aether/')) {
    const file = pathname.replace(/^\/aether\/[^/]+\//, '');
    filePath = path.join(AETHER_ROOT, 'dist', file);
  } else if (pathname.startsWith('/nebula/')) {
    const file = pathname.replace(/^\/nebula\/[^/]+\//, '');
    filePath = path.join(NEBULA_ROOT, 'dist', file);
  } else {
    // Serve from Chrysalis-Web
    filePath = path.join(CHRYSALIS_WEB, pathname === '/' ? 'index.html' : pathname);
  }

  // Normalize path and prevent directory traversal
  filePath = path.normalize(filePath);
  if (!filePath.startsWith(AETHER_ROOT) && !filePath.startsWith(NEBULA_ROOT) && !filePath.startsWith(CHRYSALIS_WEB)) {
    res.writeHead(403);
    res.end('Forbidden');
    return;
  }

  // Serve file helper
  const serveFile = (p) => {
    fs.readFile(p, (err, content) => {
      if (err) {
        if (err.code === 'ENOENT') {
          // If directory, try index.html
          fs.stat(p, (statErr, stats) => {
            if (!statErr && stats.isDirectory()) {
              serveFile(path.join(p, 'index.html'));
            } else {
              res.writeHead(404);
              res.end(`404 Not Found: ${parsedUrl.pathname}`);
            }
          });
        } else {
          res.writeHead(500);
          res.end('Internal Server Error');
        }
        return;
      }

      const ext = path.extname(p);
      const contentTypes = {
        '.html': 'text/html',
        '.css': 'text/css',
        '.js': 'text/javascript',
        '.json': 'application/json',
        '.svg': 'image/svg+xml',
        '.png': 'image/png',
        '.jpg': 'image/jpeg',
        '.jpeg': 'image/jpeg',
        '.ico': 'image/x-icon',
        '.gif': 'image/gif',
        '.map': 'application/json',
      };
      const contentType = contentTypes[ext] || 'application/octet-stream';

      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content);
    });
  };

  serveFile(filePath);
});

server.listen(PORT, HOSTNAME, () => {
  console.log(`\x1b[38;2;0;245;255m  ✓ Chrysalis Web server running at http://${HOSTNAME}:${PORT}/\x1b[0m`);
  console.log(`\x1b[38;2;107;104;128m    Local Web:  http://${HOSTNAME}:${PORT}/\x1b[0m`);
  console.log(`\x1b[38;2;107;104;128m    Subpath:    http://${HOSTNAME}:${PORT}/chrystalis/\x1b[0m`);
});
