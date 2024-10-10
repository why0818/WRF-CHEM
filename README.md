# WRF-CHEM
WRF-CHEM installation on Ubuntu 22.04

## 1. Prepare
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
sudo apt install csh m4 build-essential nasm cmake unzip libxmu-dev libcairo-dev libbz2-dev libxaw7-dev libx11-dev xorg-dev flex bison subversion liburi-perl evince tcsh cpp quota cvs libomp-dev python3-pip freeglut3-dev libjpeg-dev file
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

## 2. Libraries for WRF-chem

