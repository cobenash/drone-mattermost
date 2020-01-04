FROM alpine
ADD post.sh /bin/
RUN chmod +x /bin/post.sh
RUN apk -Uuv add curl ca-certificates jq
ENTRYPOINT /bin/post.sh
