FROM node:8.11

COPY init_container.sh /opt
ENV APP_HOME "/home/site/wwwroot"
ENV HTTPD_LOG_DIR "/home/LogFiles"

COPY sshd_config /etc/ssh/

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
        vim \
    && echo "root:Docker!" | chpasswd \
    && chmod 755 /opt/init_container.sh

EXPOSE 2222 3000

ENV PORT 3000

ENTRYPOINT ["/opt/init_container.sh"]