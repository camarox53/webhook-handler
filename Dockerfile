FROM ubuntu:20.04

LABEL maintainer="Cam Morris - mergetomaster.com"

USER root

# Create user to run application 
RUN addgroup --system --gid 101 webhook \
    && adduser --system --disabled-login --ingroup webhook --no-create-home --home /nonexistent --gecos "webhook user" --shell /bin/false --uid 101 webhook 

# Install dependencies
RUN apt-get update && apt-get install -y \
      webhook \
      gosu \
      && rm -rf /var/lib/apt/lists/*

# Create directory to store data 
RUN mkdir /data 

# Copy hooks.json file 
COPY hooks.json /data/hooks.json

# Set Permission on Data Directory
#RUN chown -R webhook:webhook /data

WORKDIR /data

# Expose port 80 for this container 
EXPOSE 8080

# Set Stop Signal 
STOPSIGNAL SIGQUIT

# Setup docker entrypoint to handle permissions on potential webhook scripts / files 
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Launch Command 
CMD ["/usr/bin/webhook" , "-hooks", "/data/hooks.json", "-port", "8080"]

HEALTHCHECK CMD curl -sSLf http://localhost:8080/health-check >/dev/null || exit 1
