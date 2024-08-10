import socket
import threading
import tkinter as tk
import sys
import pymysql
import time

db = pymysql.connect(host="114.116.244.175", user="root", password="Xiaotutu20", db="ex1")
csr = db.cursor()
timeFormat = '%Y-%m-%d %X'

def send_msg(): #命令按钮的事件响应函数
    txt = bt_txt.get() #从字符串对象中获取按钮的文本
    msg = et_txt.get().strip()
    if txt == '登录':
        bt_txt.set('发送') #设置按钮文本
        t1 = time.strftime(timeFormat, time.localtime(time.time()))
        sql1 = 'INSERT INTO messagestorage(时间, 消息) VALUES ("' + t1 + '","' + msg + "进入聊天室" + '")'
        csr.execute(sql1)
        db.commit()
    et_txt.set('')
    print('msg=',msg)
    msg_b=msg.encode('utf-8') #将msg内容转化为bytes字节流并保存在msg_b
    client.sendto(msg_b, (ip, 9992)) #向服务器发送消息
    if msg.upper()[0:3]=='BYE': #判断前三个字符
        chat_send.config(state=tk.DISABLED) #设置按钮状态，不再响应鼠标单击
        client.close()
        sys.exit(0)

def receive_msg(): #该函数为线程执行代码，用于从服务器接收消息并显示
    while True:
        try:
            (data_b,addr)=client.recvfrom(1024) #接收服务器发来的消息
            data_s=data_b.decode('utf-8') #将字节流数据转换为字符串
            if not data_s:
                continue
            print('data_s=',data_s) #调试和监测运行
            if (':' not in data_s):
                chat_list.insert(0,data_s + "进入了聊天室") #插入列表框第一行
            else:
                chat_list.insert(0, data_s)  # 插入列表框第一行
            chat_list.see(0) #使新插入的数据可视
        except Exception as e:
            print('Error is ',e)
            print('Exit!')
            break

ip='127.0.0.1'
client=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
client.connect_ex((ip,9992))
t=threading.Thread(target=receive_msg) #创建线程，执行自定义函数receive_msg()
t.start()

root=tk.Tk() #创建窗口root
root.title('聊天室')
root.geometry('300x350')
root.resizable(width=False,height=True)
fm=tk.Frame(root,width=300,height=300) #在窗口root中定义框架fm
scrl=tk.Scrollbar(fm) #在框架fm中定义滚动条scrl
chat_list=tk.Listbox(fm,width=300,selectmode=tk.BROWSE) #在框架fm中定义列表框chat_list
chat_list.configure(yscrollcommand=scrl.set) #设置列表框chat_list纵向滚动由滚动条scrl控制
scrl['command']=chat_list.yview #设置滚动条scrl的命令响应为列表框chat_list的纵向滚动显示
bt_txt=tk.StringVar(value='登录') #定义字符串对象，作为命令按钮的文本连续变量
et_txt=tk.StringVar(value='')
chat_txt=tk.Entry(root,bd=5,width=280,textvariable=et_txt) #定义单行编辑框并与et_txt绑定
chat_send=tk.Button(root,textvariable=bt_txt,command=send_msg) #定义按钮并于bt_txt绑定，事件处理函数为send_msg
scrl.pack(side=tk.RIGHT, fill=tk.Y) #定义scrl在框架右侧，以纵向充满方式显示
lb = tk.Label(root,text='')
chat_txt.pack() #显示
chat_send.pack()
chat_list.pack()
fm.pack()
lb.pack()
root.mainloop() #显示主窗口root并接收操作