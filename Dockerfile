FROM python:3.9-slim
WORKDIR /app
EXPOSE 443
CMD ["python3", "-c", "import socket, threading; \
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM); \
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1); \
s.bind(('0.0.0.0', 443)); \
s.listen(100); \
print('Proxy server started on port 443'); \
def handle(c): \
    try: \
        data = c.recv(1024); \
        rem = socket.socket(socket.AF_INET, socket.SOCK_STREAM); \
        rem.connect(('www.google.com', 80)); \
        rem.sendall(data); \
        while True: \
            r = rem.recv(4096); \
            if not r: break; \
            c.sendall(r); \
    except: pass; \
    finally: c.close(); \
while True: \
    client, _ = s.accept(); \
    threading.Thread(target=handle, args=(client,)).start()"]
