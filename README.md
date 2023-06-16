# Frp 客户端

**1、编译生成镜像**

```
cd Dockerfile文件所在的目录
docker build -t xzxiaoshan/frpc .
```

**2、创建配置文件**

在目录 /opt/test/frp/client (目录自便) 中创建配置文件 frpc.ini
配置文件内容配置，详见[官网](https://github.com/fatedier/frp/blob/master/README_zh.md)。

**3、创建启动容器**

```
docker run -itd --name=frpc -v /opt/test/frp/client:/frp xzxiaoshan/frpc
```

**4、访问**

启动成功OK
