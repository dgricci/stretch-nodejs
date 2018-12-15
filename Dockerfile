# nodejs environment
FROM dgricci/stretch:1.0.0
MAINTAINER  Didier Richard <didier.richard@ign.fr>
LABEL       version="1.0.0" \
            node="v10.14.2" \
            yarn="v1.12.3" \
            gulpCli="v2.0.1" \
            gruntCli="v1.3.0" \
            os="Debian Stretch" \
            description="Node.js, Yarn, Gulp-Cli and Grunt-Cli"

# Cf. https://github.com/nodejs/docker-node
ARG NPM_CONFIG_LOGLEVEL
ENV NPM_CONFIG_LOGLEVEL ${NPM_CONFIG_LOGLEVEL:-info}
ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION:-10.14.2}
ARG YARN_VERSION
ENV YARN_VERSION ${YARN_VERSION:-1.12.3}
ARG GULPCLI_VERSION
ENV GULPCLI_VERSION ${GULPCLI_VERSION:-2.0.1}
ARG GRUNTCLI_VERSION
ENV GRUNTCLI_VERSION ${GRUNTCLI_VERSION:-1.3.0}

# volume for user's projects
VOLUME /src

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm -f /tmp/build.sh
ENV PATH=${PATH}:/usr/local/node-v${NODE_VERSION}/bin:/usr/local/yarn-v${YARN_VERSION}/bin:/usr/local/yarn-v${YARN_VERSION}/.config-global/bin

# Externally accessible data is by default put in /src
# use -v at run time !
WORKDIR /src

# Output capabilities by default.
CMD nodejs --version && yarn versions && gulp --version && grunt --version

