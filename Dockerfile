FROM debian

COPY setup.sh /app/setup.sh
RUN bash /app/setup.sh

# Don't run as root
# https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b
USER appuser

# Start the container in the appuser's home directory
WORKDIR /home/appuser