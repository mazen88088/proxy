FROM python:3.9-slim
WORKDIR /app
EXPOSE 443
RUN echo "HTTP/1.1 200 OK\nContent-Type: text/plain\n\nProxy Online" > index.html
CMD ["python3", "-m", "http.server", "443"]
