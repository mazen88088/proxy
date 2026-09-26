FROM python:3.9-slim
WORKDIR /app
RUN echo "Server is running" > index.html
EXPOSE 10000
CMD ["python3", "-m", "http.server", "10000"]
