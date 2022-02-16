FROM ubuntu:20.04

LABEL maintainer="Cam Morris - mergetomaster.com"

# Create user to run application 
RUN addgroup --system --gid 101 webhook \
    && adduser --system --disabled-login --ingroup webhook --no-create-home --home /nonexistent --gecos "webhook user" --shell /bin/false --uid 101 webhook 

# Install dependencies
RUN apt-get update && apt-get install -y \
      webhook 

# Create directory to store data 
RUN mkdir /data 

# Copy hooks.json file 
COPY hooks.json /data/hooks.json

# Set Permission on Data Directory
RUN chown -R webhook:webhook /data

# Set Application User
USER webhook 

# Expose port 80 for this container 
EXPOSE 80

# Set Stop Signal 
STOPSIGNAL SIGQUIT

# Launch Command 
CMD ["/usr/bin/webhook" , "-hooks", "/data/hooks.json", "-port", "80"]
