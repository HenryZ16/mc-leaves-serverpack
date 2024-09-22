FROM ubuntu:22.04

COPY ./build-server.sh /home/mc/build-server.sh
COPY ./plugins.sh /home/mc/plugins.sh
COPY ./server-icon.png /home/mc/server-icon.png
COPY ./server.properties /home/mc/server.properties

RUN chmod +x /home/mc/build-server.sh \
    && /home/mc/build-server.sh