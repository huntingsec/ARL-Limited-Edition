# ARL-Limited-Edition
原汁原味的ARL灯塔，在基础上进行了魔改优化

原项目地址https://github.com/TophantTechnology/ARL

### 安装

#### 更新源安装docker

```
apt update
apt install wget docker.io docker-compose -y
```

#### 安装代码
##### 一键安装

###### 先保证安装wget docker.io docker-compose

```
git clone https://github.com/huntingsec/ARL-Limited-Edition.git
cd ARL-Limited-Edition
chmod +x install.sh
./install.sh
```
## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=huntingsec/ARL-Limited-Edition&type=Date)](https://star-history.com/#huntingsec/ARL-Limited-Edition&Date)


##### 手动安装（逐步执行）
###### wget用断点续传下载防止下载中断

###### 如果速度太慢可下载到本地导入服务器
```
wget --tries=3 -c -nc [https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.1/ARL-limited-edition.zip](https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.2/ARL-Limited-Edition.zip)
unzip ARL-Limited-Edition.zip
```
###### 经兄弟们反馈，都部署在垃圾的VPS上容易卡顿，线程回调到了2，增加了web弱口令的字典
```
cd ARL-Limited-Edition/docker
docker load -i arl_web.tar
docker load -i mongo.tar
docker load -i rabbitmq.tar
docker volume create arl_db
docker-compose up -d
docker cp ../app/config.py $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/
docker cp domain_2w.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts
docker cp file_top_2000.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts
docker cp common_password.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/opt/ARL-NPoC/xing/dicts/
```

##### 添加指纹（可能会有添加不上指纹的情况，多执行几遍就好了）

```
cd ARL-Finger-ADD
python3 ARL-Finger-ADD.py https://127.0.0.1:5003/ admin arlpass
```

##### 重启docker

```
systemctl restart docker.service
```

##### 有问题进群咨询

![a9bbf910b8cf50888c7c4f9efd06eb5](https://github.com/huntingsec/ARL-Limited-Edition/blob/main/link.jpg)
