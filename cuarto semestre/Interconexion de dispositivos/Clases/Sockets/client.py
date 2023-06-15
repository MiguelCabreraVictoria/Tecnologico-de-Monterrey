import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#s.connect(("13.66.83.166", 80))
#s.send(b'GET /assessment/acceso/ HTTP/1.1\r\n\r\n')
#datos = s.recv(1024)
#print(datos.decode("ascii"))

s.bind(('0.0.0.0', 1337))
s.listen(1)

connection, address = s.accept()
with connection: 
    datos = connection.recv(1024)
    print(datos.decode("ascii"))
    connection.close()

