# how to make it automatically work with the right version?
# `personaldev:latest` tag?
docker run -it --name personaldev -v personaldev:/home/appuser personaldev:{VERSION} /bin/bash
