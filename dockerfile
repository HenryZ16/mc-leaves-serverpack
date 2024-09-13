FROM openjdk:21

COPY ./build-server.sh /home/mc
COPY ./server-icon.png /home/mc
COPY ./server.properties /home/mc

RUN chmod +x /home/mc/build-server.sh \
    && /home/mc/build-server.sh