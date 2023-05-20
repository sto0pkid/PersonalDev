# Build
`docker build -t personaldev:{VERSION} .`

# Run
`docker run -it --name personaldev -v personaldev:/home/appuser personaldev:{VERSION} /bin/bash`
