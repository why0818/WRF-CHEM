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
Download Source Code. (provided)  下载源码（已提供）
```bash
wget https://www.mpich.org/static/downloads/4.0.2/mpich-4.0.2.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar -xzvf mpich-4.0.2.tar.gz
cd mpich-4.0.2
FFLAGS=-fallow-argument-mismatch FCFLAGS=-fallow-argument-mismatch ./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/mpich
make -j4
make install
```
Update PATH variables 更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
### mpich
export PATH=/home/ubuntu/Build_WRF/LIBRARIES/mpich/bin:$PATH
```
```bash
source /home/ubuntu/.profile
```

### 2.2 Install zlib
```bash
cd /home/ubuntu/Build_WRF/src
```
```bash
wget http://www.zlib.net/fossils/zlib-1.2.12.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf zlib-1.2.12.tar.gz
cd zlib-1.2.12
./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/zlib
make -j4
make install
```

### 2.3 Install hdf5
```bash
cd /home/ubuntu/Build_WRF/src
```
```bash
wget https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_1_12_2/source/hdf5-1.12.2.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf hdf5-1.12.2.tar.gz
cd hdf5-1.12.2
./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/hdf5 --with-zlib=/home/ubuntu/Build_WRF/LIBRARIES/zlib --enable-fortran --enable-fortran2003 --enable-cxx --with-default-api-version=v18
make -j4
make install
```
Update PATH variables 更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
### hdf5
export PATH=/home/ubuntu/Build_WRF/LIBRARIES/hdf5/bin:$PATH
export LD_LIBRARY_PATH=/home/ubuntu/Build_WRF/LIBRARIES/hdf5/lib:$LD_LIBRARY_PATH
```
```bash
source /home/ubuntu/.profile
```
### 2.4 Install curl
```bash
cd /home/ubuntu/Build_WRF/src
```
```bash
wget https://curl.se/download/curl-7.83.1.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf curl-7.83.1.tar.gz
cd curl-7.83.1
./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/curl --with-zlib=/home/ubuntu/Build_WRF/LIBRARIES/zlib --without-ssl
make -j4
make install
```

### 2.5 Install netcdf

