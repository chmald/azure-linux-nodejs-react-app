FROM node:8.11

RUN mkdir /opt/app
COPY init_container.sh /opt
COPY sshd_config /etc/ssh/

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
        vim \
        git \
    && echo "root:Docker!" | chpasswd \
    && cd /opt/app \
    && npx create-react-app app \
    && chmod 755 /opt/init_container.sh

EXPOSE 2222 3000

ENV PORT 3000

ENTRYPOINT ["/opt/init_container.sh"]