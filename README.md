# WRF-CHEM
WRF-CHEM installation on Ubuntu 22.04

## 1. Prepare 准备工作
### 1.1 Log in and check name
```bash
# show ubuntu version.
cat /etc/os-release
# show user name.
whoami
```

### 1.2 Update
```bash
# update repository.
sudo apt update
```

### 1.3 Intall libs
```bash
sudo apt install csh m4 build-essential nasm cmake unzip libxmu-dev libcairo-dev libbz2-dev libxaw7-dev libx11-dev xorg-dev flex bison subversion liburi-perl evince tcsh cpp quota cvs libomp-dev python3-pip freeglut3-dev libjpeg-dev file vim
```

### 1.4 Install Compiler
```bash
# install compiler.
sudo apt install gcc g++ gfortran
# show compiler version.
gcc -v
g++ -v
gfortran -v
cpp --version
```

## 2. Libraries Installation 安装库文件

### 2.1 Install mpich
```bash
# Create directory
mkdir -p /home/ubuntu/Build_WRF/src
mkdir -p /home/ubuntu/Build_WRF/LIBRARIES
cd /home/ubuntu/Build_WRF/src
```
Download Source Code. (provided) 
```bash
wget https://www.mpich.org/static/downloads/4.0.2/mpich-4.0.2.tar.gz
```
Uncompress Source Code and Compile.
```bash
tar -xzvf mpich-4.0.2.tar.gz
cd mpich-4.0.2
FFLAGS=-fallow-argument-mismatch FCFLAGS=-fallow-argument-mismatch ./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/mpich
make -j4
make install
```更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
### mpich
export PATH=/home/ubuntu/Build_WRF/LIBRARIES/mpich/bin:$PATH
```

