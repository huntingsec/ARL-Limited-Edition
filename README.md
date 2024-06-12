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

##### git

```
git clone https://github.com/huntingsec/ARL-Limited-Edition.git
```

##### release

```
wget https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.1/ARL-limited-edition.zip
unzip ARL-Limited-Edition.zip
```

##### 一键安装

```
cd ARL-Limited-Edition
chmod +x install.sh
./install.sh
```

##### 手动安装

```
cd ARL-Limited-Edition/docker
docker load -i arl_web.tar
docker load -i mongo.tar
docker load -i rabbitmq.tar
docker docker volume create arl_db
docker-compose up -d
docker cp ../app/config.py $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/
docker cp domain_2w.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts
docker cp file_top_2000.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts
```

##### 添加指纹

```
cd ARL-Finger-ADD
python3 ARL-Finger-ADD.py https://127.0.0.1:5003/ admin arlpass
```

