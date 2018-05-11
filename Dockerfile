FROM node:8.11

RUN mkdir /opt/app
COPY . /opt/app
COPY sshd_config /etc/ssh/

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
        vim \
    && echo "root:Docker!" | chpasswd \
    && cd /opt/app \
    && npm install \
    && chmod 755 /opt/app/init_container.sh

EXPOSE 2222 3000

ENV PORT 3000

ENTRYPOINT ["/opt/app/init_container.sh"]