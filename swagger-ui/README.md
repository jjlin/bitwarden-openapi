This directory should contain the files from the dependency-free swagger-ui distribution:

1. Download the latest release from https://github.com/swagger-api/swagger-ui/releases.
2. Unpack the release archive and copy all files from the `dist` directory (except `index.html`)
   into this directory.
3. For local development, you can serve this directory using something like
   [Caddy](https://github.com/caddyserver/caddy) (e.g., by running `caddy file-server`).
