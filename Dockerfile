FROM alpine:latest

# Install dependencies
RUN apk update 
RUN apk add --no-cache \
    openjdk17-jre \
    bash \
    rsync \
    openssh-server

RUN ssh-keygen -A

EXPOSE 25565 22

ENTRYPOINT [ /usr/sbin/sshd -D & java -Xmx1024M -Xms1024M -jar /minecraft-server.jar nogui ]

