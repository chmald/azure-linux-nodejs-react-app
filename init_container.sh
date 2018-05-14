#!/bin/sh

test ! -d "$APP_HOME" && echo "INFO: $APP_HOME not found. creating..." && mkdir -p "$APP_HOME" && npx create-react-app $APP_HOME

test ! -d "$HTTPD_LOG_DIR" && echo "INFO: $HTTPD_LOG_DIR not found. creating..." && mkdir -p "$HTTPD_LOG_DIR"

echo "Starting SSH..."
service ssh start

echo "Staring applicaiton..."
npm start --prefix $APP_HOME
