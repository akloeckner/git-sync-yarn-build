# Base this off of git-sync container
FROM k8s.gcr.io/git-sync/git-sync:v3.2.2

# Revert to root user
USER root:root

# Install NodeJS and yarn development environment
RUN apt-get update \
 && apt-get install -y curl \
 && apt-get install -y bash \
 && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
 && apt-get install -y nodejs \
 && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install yarn \
 && rm -rf /var/lib/apt/lists/*

# Define default build script to be used by yarn
ENV YARN_BUILD_SCRIPT=build

# Create sync hook command and instruct git-sync to use it
RUN echo "#!/bin/sh"                   >  /yarn-build.sh \
 && echo "yarn install"                >> /yarn-build.sh \
 && echo "yarn run $YARN_BUILD_SCRIPT" >> /yarn-build.sh \
 && chmod a+x /yarn-build.sh
ENV GIT_SYNC_HOOK_COMMAND=/yarn-build.sh

# Set correct git-sync user again
USER 65533:65533
