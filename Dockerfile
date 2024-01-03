FROM ruby:3.1.2

ENV BUILD_PACKAGES dirmngr gnupg apt-transport-https ca-certificates curl software-properties-common
ENV BUILD_TMP_PACKAGES libnginx-mod-http-passenger nginx
ARG WEB_PORT=80

WORKDIR /var/www

COPY . .
COPY ./database.yml config/database.yml
COPY ./docker-entrypoint bin/docker-entrypoint

RUN set -ex && \
    apt-get update && apt-get install -y $BUILD_PACKAGES && \
    curl https://oss-binaries.phusionpassenger.com/auto-software-signing-gpg-key.txt \
    | gpg --dearmor | tee /etc/apt/trusted.gpg.d/phusion.gpg >/dev/null && \
    sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bullseye main > /etc/apt/sources.list.d/passenger.list' && \
    apt-get update && apt-get install -y $BUILD_TMP_PACKAGES

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN set -ex && \
    usermod --shell --group www-data && \
    chown -R www-data:www-data /var/www && \
    chmod +x bin/docker-entrypoint && \
    bundle install --clean --force --no-cache --without development && \
    SECRET_KEY_BASE=jkdf8xlandfkzz99alldlmernzp2mska7bghqp9akamzja7ejnq65ahjnfj RAILS_ENV=development bundle exec rake assets:precompile && \
    rm -rf /var/lib/apt/lists/*

EXPOSE $WEB_PORT

CMD ["./bin/docker-entrypoint"]
