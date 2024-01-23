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

RUN ssh-keygen -A
EXPOSE 25565 22

CMD /usr/sbin/sshd -D & java -Xmx1024M -Xms1024M -jar /minecraft/minecraft-server.jar nogui

