FROM debian:bookworm

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends git ca-certificates curl ssh webhook
RUN rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION=0.110.0
ENV HUGO_BINARY=hugo_extended_${HUGO_VERSION}_linux-amd64.deb
ENV SASS_VERSION=1.32.8
ENV SASS_BINARY=dart-sass-1.32.8-linux-x64.tar.gz

ENV GIT_CONTENT_PATH=.
ENV GIT_BRANCH=main
ENV HUGO_DESTINATION=/root/hugo-destination

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


WORKDIR /root

# Expose default webhook port
EXPOSE 9000

COPY --chmod=644 hooks.json /root/hooks.json

COPY --chmod=755 scripts/* /root/

ENTRYPOINT ["./docker-entrypoint.sh"]
