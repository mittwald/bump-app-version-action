FROM alpine:3.13

RUN apk add --no-cache bash curl git sed

COPY ./bump-app-version.sh /bump-app-version.sh

ENTRYPOINT ["/bump-app-version.sh"]