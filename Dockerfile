FROM alpine
RUN apk -Uuv add curl ca-certificates jq
ADD post.sh /bin/
RUN chmod +x /bin/post.sh
ENTRYPOINT /bin/post.sh
