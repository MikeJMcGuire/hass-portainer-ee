FROM portainer/portainer-ee:2.21.0-alpine

RUN apk --no-cache add tzdata && rm -rf /var/cache/apk/*

ENTRYPOINT ["/portainer"]