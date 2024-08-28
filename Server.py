# coding=utf-8
import socketserver
import pymysql
import time

HOST = "my-database.c7u2kc6sgxm7.ca-central-1.rds.amazonaws.com"
USER = "admin"
PASSWORD = "12121212"
DB = "chatroom"

db = pymysql.connect(host=HOST, user=USER, password=PASSWORD, db=DB)
csr = db.cursor()
timeFormat = '%Y-%m-%d %X'

class Chat_server(socketserver.DatagramRequestHandler): #继承DatagramRequestHandler重写handle
    def handle(self):
        try:
            (data_b,conn)=self.request
            addr = self.client_address
            if addrs.count(addr) == 0: #判断是否为新接收的客户端
                conns.append(conn)
                addrs.append(addr)
                name_s=data_b.decode('utf-8')
                users.setdefault(addr,name_s) #调用字典类型函数，将组成的键值对放入字典
                data_s=''
            else:
                name_s=users.get(addr)
                data_s=data_b.decode('utf-8')
                data=name_s+': '+data_s
                t2 = time.strftime(timeFormat, time.localtime(time.time()))
                sql2 = 'INSERT INTO message(time, message) VALUES ("' + t2 + '","' + data + '")'
                csr.execute(sql2)
                db.commit()
                print('data=',data)
                data_b = data.encode('utf-8')
            for cn in zip(conns,addrs): #将两个列表组合成元组
                cn[0].sendto(data_b,cn[1])
            if data_s.upper()[0:3]=='BYE':
                byeMsg = name_s + "离开了聊天室"
                conns.remove(conn) #删除连接客户端的对象conn
                addrs.remove(addr)
                del(users[addr]) #删除以addr为键的数据
        except Exception as e:
            print('Error is ',e)
conns=[] #定义列表变量，存储与客户端的连接对象conn
addrs=[] #定义列表变量，存储客户端的地址
users={} #定义字典变量，存储与客户端的连接对象conn和客户端用户名称name_s
ip=''
server=socketserver.ThreadingUDPServer((ip,9992),Chat_server)
print('等待连接……')
server.serve_forever()