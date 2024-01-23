FROM alpine:latest

# Install dependencies
RUN apk update 
RUN apk add --no-cache \
    openjdk17-jre \
    bash \
    rsync \
    openssh-server

RUN adduser -D -h /minecraft -s /bin/bash minecraft
RUN chown -R minecraft:minecraft /minecraft

USER minecraft
WORKDIR /minecraft

EXPOSE 25565 22

CMD bash start.sh

