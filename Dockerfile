FROM debian:stretch

# Install dependencies
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends git ca-certificates curl ssh webhook nginx \
  && rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION 0.110.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.deb
ENV SASS_VERSION 1.32.8
ENV SASS_BINARY dart-sass-1.32.8-linux-x64.tar.gz

ENV GIT_REPO_CONTENT_PATH ''
ENV GIT_REPO_BRANCH 'master'
ENV TARGET_DIR '/target'

# Download and install hugo and sass
RUN \
  curl -sL -o /tmp/hugo.deb \
  https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  dpkg -i /tmp/hugo.deb && \
  rm /tmp/hugo.deb && \
  curl -sL -o /tmp/dart-sass.tar.gz \
  https://github.com/sass/dart-sass/releases/download/${SASS_VERSION}/${SASS_BINARY} && \
  tar -C /usr/local -xzf /tmp/dart-sass.tar.gz && \
  rm /tmp/dart-sass.tar.gz
  

WORKDIR /tmp

# Expose default webhook port
EXPOSE 9000

COPY hooks.json /etc/hooks.json
COPY scripts /scripts
ADD nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT [ "bash", "/scripts/start.sh" ]
