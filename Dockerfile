# Alpine v3.12
FROM docker:git

# RUN apt-get update && apt-get install --yes \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     software-properties-common \
#     git

RUN apk add --no-cache \
    nodejs \
    npm

RUN npm install -g yarn

RUN git clone https://github.com/lando/lando.git

RUN cd lando && git checkout v3.1.2 && yarn

RUN ln -s /lando/bin/lando.js /usr/bin/lando

ENTRYPOINT ["/bin/sh"]
