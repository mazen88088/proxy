FROM alpine:latest
RUN apk add --no-cache curl
EXPOSE 10000
CMD ["sh", "-c", "echo 'Server is running' && sleep infinity"]
