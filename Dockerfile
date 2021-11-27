FROM node:16-alpine

WORKDIR /action

ENV ACTION_WORKSPACE=/action

COPY scripts/ scripts/

RUN apk add --no-cache git bash docker-cli

ENTRYPOINT [ "/action/scripts/run.sh" ] 