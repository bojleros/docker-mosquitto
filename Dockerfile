FROM alpine:3.8

RUN apk --no-cache add mosquitto mosquitto-clients && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log /mosquitto/secrets

COPY docker-entrypoint.sh /

COPY mosquitto.conf /mosquitto/config/mosquitto.conf

RUN chmod 755 /docker-entrypoint.sh && \
    chown -R mosquitto:mosquitto /mosquitto

EXPOSE 1883/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
