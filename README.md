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
```bash
cd /home/ubuntu/Build_WRF/src
```
Download Source Code.
```bash
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.8.0.tar.gz
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.5.3.tar.gz
```
#### 2.5.1 Install netcdf-c
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf netcdf-c-4.8.0.tar.gz
cd netcdf-c-4.8.0
CFLAGS=-fPIC CPPFLAGS='-I/home/ubuntu/Build_WRF/LIBRARIES/hdf5/include -I/home/ubuntu/Build_WRF/LIBRARIES/curl/include' LDFLAGS='-L/home/ubuntu/Build_WRF/LIBRARIES/hdf5/lib -L/home/ubuntu/Build_WRF/LIBRARIES/curl/lib ' ./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/netcdf --enable-netcdf-4 --enable-netcdf4 --enable-shared --enable-dap
make -j4
make install
cd ..
```
#### 2.5.2 Install netcdf-fortran
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf netcdf-fortran-4.5.3.tar.gz
cd netcdf-fortran-4.5.3
CPPFLAGS='-I/home/ubuntu/Build_WRF/LIBRARIES/netcdf/include' LDFLAGS='-L/home/ubuntu/Build_WRF/LIBRARIES/netcdf/lib' FCFLAGS='-m64' ./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/netcdf
make -j4
make install
```
Update PATH variables 更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
### netcdf
export PATH=/home/ubuntu/Build_WRF/LIBRARIES/netcdf/bin:$PATH
export NETCDF=/home/ubuntu/Build_WRF/LIBRARIES/netcdf
export LD_LIBRARY_PATH=/home/ubuntu/Build_WRF/LIBRARIES/netcdf/lib:$LD_LIBRARY_PATH
```
```bash
source /home/ubuntu/.profile
```
### 2.6 Install libpng
```bash
cd /home/ubuntu/Build_WRF/src
```
```bash
wget https://jaist.dl.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar xzvf libpng-1.6.37.tar.gz
cd libpng-1.6.37
CPPFLAGS='-I/home/ubuntu/Build_WRF/LIBRARIES/netcdf/include' FCFLAGS='-m64' ./configure --prefix=/home/ubuntu/Build_WRF/LIBRARIES/libpng
make -j4
make install
```
Update PATH variables 更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
#### jasper
export PATH=/home/ubuntu/Build_WRF/LIBRARIES/jasper/bin:$PATH
export LD_LIBRARY_PATH=/home/ubuntu/Build_WRF/LIBRARIES/jasper/lib:$LD_LIBRARY_PATH
```
```bash
source /home/ubuntu/.profile
```
### 2.7 Install ncl
```bash
cd /home/ubuntu/Build_WRF/src
```
Install miniconda.
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh ./Miniconda3-latest-Linux-x86_64.sh
```
Install ncl.
```bash
source /home/ubuntu/.bashrc
conda create -n ncl_stable -c conda-forge ncl # 创建Conda环境
source activate ncl_stable
```
Test ncl. 测试ncl工具
```bash
ncl -V
```
Show version 6.6.2 is good.
Update PATH variables 更新PATH变量
```bash
vim /home/ubuntu/.profile
```
```text
#### ncl
source activate ncl_stable
```
```bash
source /home/ubuntu/.profile
```
## 3. Install WRF
### 3.1 WRF-chem and KPP
Variable setup. 设置变量
```bash
ulimit -s unlimited
export MALLOC_CHECK_=0
export EM_CORE=1
export NMM_CORE=0
export WRF_CHEM=1
export WRF_KPP=1
export YACC='/usr/bin/yacc -d'
export FLEX=/usr/bin/flex
export FLEX_LIB_DIR=/usr/lib/x86_64-linux-gnu
export KPP_HOME=/home/ubuntu/Build_WRF/WRFV4.4/chem/KPP/kpp/kpp-2.1
export WRF_SRC_ROOT_DIR=/home/ubuntu/Build_WRF/WRFV4.4
export PATH=$KPP_HOME/bin:$PATH
export SED=/usr/bin/sed
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
```

```bash
cd /home/ubuntu/Build_WRF/
```

```bash
wget -c https://github.com/wrf-model/WRF/releases/download/v4.4/v4.4.tar.gz -O wrf-4.4.tar.gz
```
Uncompress Source Code and Compile. 解压源码并编译
```bash
tar -xvzf wrf-4.4.tar.gz
cd WRFV4.4/chem/KPP/kpp/kpp-2.1/src
/usr/bin/flex scan.l
cd /home/ubuntu/Build_WRF/WRFV4.4
```
```bash
vim configure
```

| Change from |    To    |
|:---------:|:----------:|
| if [ "$USENETCDFPAR" == "1" ] ; then | if [ "$USENETCDFPAR" **=** "1" ] ; then|

```bash
./configure
```
Enter selection [1-75] : **33**  
Compile for nesting? (1=basic, 2=preset moves, 3=vortex following) [default 1]: **1**  

Complie kpp.
```bash
./compile 2>&1 | tee compile_kpp.log
```
Complie em_real mode.
```bash
./compile em_real 2>&1 | tee compile_wrf.log # 等待30-50min（根据电脑性能）
```
![Compile WRF](figure/fig01.jpg)
这一步所需要的时间较长，需要耐心等待。  
Wait 30-50 minutes for finish test by
```bash
ls -lah main/*.exe 
```

![WRF finish](figure/fig02.jpg)
如图中所示，出现这些.exe文件即表示WRF安装成功！  
If you see real.exe and wrf.exe then correct. Else check Error in compile_wrf.log file.
### 3.2 WPS installation
```bash
cd /home/ubuntu/Build_WRF/
ln -sf WRFV4.4 WRF
```
Download Source Code
```bash
wget -c https://github.com/wrf-model/WPS/archive/refs/tags/v4.4.tar.gz -O wps-4.4.tar.gz
```
Uncompress Source Code.
```bash
tar -xvzf wps-4.4.tar.gz
```
Define variable.
```bash
cd WPS-4.4
export JASPERLIB=/home/ubuntu/Build_WRF/LIBRARIES/jasper/lib
export JASPERINC=/home/ubuntu/Build_WRF/LIBRARIES/jasper/include
```
Configure WPS.
```bash
./configure
```
edit configure.wps file. Change DM_FC to mpif90 and Append -lgomp in WRF_LIB.
```bash
vim configure.wps
```
```text
COMPRESSION_LIBS = -L/home/ubuntu/Build_WRF/LIBRARIES/jasper/lib -ljasper -lpng -lz
COMPRESSION_INC = -I/home/ubuntu/Build_WRF/LIBRARIES/jasper/include

WRF_LIB = -L$(WRF_DIR)/external/io_grib1 -lio_grib1 \
          -L$(WRF_DIR)/external/io_grib_share -lio_grib_share \
          -L$(WRF_DIR)/external/io_int -lwrfio_int \
          -L$(WRF_DIR)/external/io_netcdf -lwrfio_nf \
          -L$(NETCDF)/lib -lnetcdff -lnetcdf -lgomp
```
Complie WPS.
```bash
./compile 2>&1 | tee compile_wps.log
```
Wait for finish test by
```bash
ls -lah *.exe
```
![Compile WRF](figure/fig03.jpg)
如图，出现以上.exe文件表示WPS安装成功！

## 4. Create Directory for Data.
### 4.1 Geography Data
```bash
cd /home/ubuntu/Build_WRF/
```
Download Geography Data.
```bash
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/albedo_modis.tar.bz2
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog_complete.tar.gz
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/maxsnowalb_modis.tar.bz2
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/topo_2m.tar.bz2
```
Uncompress Geography Data.
```bash
tar -xvzf geog_complete.tar.gz
cd geog
tar -xvjf ../albedo_modis.tar.bz2
tar -xvjf ../maxsnowalb_modis.tar.bz2
tar -xvjf ../topo_2m.tar.bz2
```
### 4.2 Real-time Input Data.
Create Real-time Data Directory and Change to Directory.
```bash
mkdir -p /home/ubuntu/Build_WRF/data/fnl
cd /home/ubuntu/Build_WRF/data/fnl
```
Download Data from
https://rda.ucar.edu/datasets/ds083.2/index.html#sfol-wl-/data/ds083.2?g=22010


![Compile WRF](figure/fig04.jpg)

Select Download Script and copy rda-download.csh to directory
/home/ubuntu/Build_WRF/data/fnl
Change Directory to WPS directory.
```bash
cp /home/ubuntu/rda-download.csh /home/ubuntu/Build_WRF/data/fnl
cd /home/ubuntu/Build_WRF/data/fnl
csh ./rda-download.csh
ls -al fnl*
```

## 5. Run WRF-chem
### 5.1 Run WPS
```bash
cd /home/ubuntu/Build_WRF/WPS-4.4
```
Change GEOGRID.TBL
```bash
cd geogrid
rm -rf GEOGRID.TBL
ln -svf GEOGRID.TBL.ARW_CHEM GEOGRID.TBL
cd ..
```
Create namelist.wps file.
```bash
rm -rf namelist.wps
vim namelist.wps
```

```text
&share
wrf_core = 'ARW',
max_dom = 1,
start_date = '2010-07-14_00:00:00',
end_date = '2010-07-16_00:00:00',
interval_seconds = 10800,
io_form_geogrid = 2,
/
&geogrid
parent_id
= 1,
parent_grid_ratio = 1,
i_parent_start = 1,
j_parent_start = 1,
e_we
= 41,
e_sn
= 41,
geog_data_res = '10m',
dx
= 100000,
dy
= 100000,
map_proj = 'lambert',ref_lat = 35.0,
ref_lon = 25.0,
truelat1 = 30.0,
truelat2 = 40.0,
stand_lon = 25.0,
geog_data_path = '/home/ubuntu/Build_WRF/geog'
/
ref_x = 20.5
ref_y = 20.5
&ungrib
out_format = 'WPS',
prefix = 'FILE',
/
&metgrid
fg_name = 'FILE'
io_form_metgrid = 2,
/
opt_ignore_dom_center = .true.,
&mod_levs
press_pa = 201300 , 200100 , 100000 ,
95000 , 90000 ,
85000 , 80000 ,
75000 , 70000 ,
65000 , 60000 ,
55000 , 50000 ,
45000 , 40000 ,
35000 , 30000 ,
25000 , 20000 ,
15000 , 10000 ,
5000 , 1000
/
```
Create Geography Data.
```bash
./geogrid.exe
```
Wait for finish test by
```bash
ls -lah geo_em.d01.nc
```
If you see geo_em.d01.nc is correct.

link Real-time Data top WPS.
```bash
./link_grib.csh /home/ubuntu/Build_WRF/data/fnl/fnl_201007*
```
link Vtable
```bash
ln -sf ungrib/Variable_Tables/Vtable.GFS Vtable
```
create grib file.
```bash
./ungrib.exe
```
Wait for finish test by
```bash
ls -lah FILE*
```
create met file.
```bash
./metgrid.exe
```
```bash
ls -lah met_em.*
```
### 5.2 Run WRF
```bash
cd /home/ubuntu/Build_WRF/WRF/test/em_real/
```
link met file from WPS to WRF.
```bash
ln -sf /home/ubuntu/Build_WRF/WPS-4.4/met_em* .
```
remove namelist file.
```bash
rm -rf namelist.input
```
```bash
vim namelist.input
```
```text
&time_control
run_days = 2,
run_hours = 0,
run_minutes = 0,
run_seconds = 0,
start_year = 2010,
start_month = 07,
start_day = 14,
start_hour = 00,
start_minute = 00,
start_second = 00,
end_year = 2010,
end_month = 07,
end_day = 16,
end_hour = 00,
end_minute = 00,
end_second = 00,
interval_seconds = 10800,
input_from_file = .true.,
history_interval = 60,
frames_per_outfile = 72,
restart = .false.,
restart_interval = 0,
io_form_history = 2,
io_form_restart = 2,
io_form_input = 2,
io_form_boundary = 2,
auxinput6_inname = 'wrfbiochemi_d01',
auxinput7_inname = 'wrffirechemi_d<domain>',
auxinput8_inname = 'wrfchemi_gocart_bg_d<domain>',
auxinput12_inname = 'wrf_chem_input',
auxinput5_interval_m = 86400,
auxinput7_interval_m = 86400,
auxinput8_interval_m = 86400,
io_form_auxinput2 = 2,
io_form_auxinput5 = 0,
io_form_auxinput6 = 0,
io_form_auxinput7 = 0,
io_form_auxinput8 = 0,
io_form_auxinput12 = 0,
debug_level = 0,
auxinput1_inname = "met_em.d<domain>.<date>",
auxinput13_inname = 'wrfchemv_d<domain>',
auxinput13_interval_m = 86400,
io_form_auxinput13 = 0,
/

&dfi_control
/

&domains
time_step = 600,
time_step_fract_num = 0,
time_step_fract_den = 1,
max_dom = 1,
s_we = 1,
e_we = 41,
s_sn = 1,
e_sn = 41,
e_vert = 31,
num_metgrid_levels = 27,
num_metgrid_soil_levels = 4,
dx = 100000,
dy = 100000,
grid_id = 1,
parent_id = 0,
i_parent_start = 1,
j_parent_start = 1,
parent_grid_ratio = 1,
parent_time_step_ratio = 1,
p_top_requested = 10000,
feedback = 1,
smooth_option = 0,
p_top_requested = 10000,
zap_close_levels = 50,
interp_type = 1,
t_extrap_type = 2,
force_sfc_in_vinterp = 0,
use_levels_below_ground = .true.,
use_surface = .true.,
lagrange_order = 1,
sfcp_to_sfcp = .true.,
/

&physics
num_land_cat = 21,
mp_physics = 4,
progn = 0,
ra_lw_physics = 1,
ra_sw_physics = 2,
radt = 30,
sf_sfclay_physics = 1,
sf_surface_physics = 2,
bl_pbl_physics = 1,
bldt = 0,
cu_physics = 5,
cu_diag = 1,
cudt = 0,
ishallow = 0,
isfflx = 1,
ifsnow = 1,
icloud = 1,
surface_input_source = 1,
num_soil_layers = 4,
sf_urban_physics = 0,
mp_zero_out = 2,
mp_zero_out_thresh = 1.e-12,
maxiens = 1,
maxens = 3,
maxens2 = 3,
maxens3 = 16,
ensdim = 144,
cu_rad_feedback = .true.,
/

&fdda
/

&dynamics
rk_ord = 3,
w_damping = 1,
diff_opt = 1,
km_opt = 4,
diff_6th_opt = 0,
diff_6th_factor = 0.12,
base_temp = 290.
damp_opt = 0,
zdamp = 5000.,
dampcoef = 0.01,
khdif = 0,
kvdif = 0,
non_hydrostatic = .true.,
moist_adv_opt = 2,
scalar_adv_opt = 2,
chem_adv_opt = 2,
tke_adv_opt = 2,
time_step_sound = 4,
h_mom_adv_order = 5,
v_mom_adv_order = 3,
h_sca_adv_order = 5,
v_sca_adv_order = 3,
/

&bdy_control
spec_bdy_width = 5,
spec_zone = 1,
relax_zone = 4,
specified = .true.,
nested = .false.,
/

&grib2
/

&namelist_quilt
nio_tasks_per_group = 0,
nio_groups = 1,
/

&chem
kemit = 1,
chem_opt = 401,
bioemdt = 0,
photdt = 0,
chemdt = 10,
io_style_emissions = 0,
emiss_opt = 3,
emiss_opt_vol = 0,
emiss_ash_hgt = 20000.,
chem_in_opt = 0,
phot_opt = 0,
gas_drydep_opt = 0,
aer_drydep_opt = 1,
bio_emiss_opt = 0,
ne_area = 0,
dust_opt = 1,
dmsemis_opt = 0,
seas_opt = 0,
depo_fact = 0.25,
gas_bc_opt = 0,
gas_ic_opt = 0,
aer_bc_opt = 1,
aer_ic_opt = 1,
gaschem_onoff = 0,
aerchem_onoff = 1,
wetscav_onoff = 0,
cldchem_onoff = 0,
vertmix_onoff = 1,
chem_conv_tr = 0,
conv_tr_wetscav = 0,
conv_tr_aqchem = 0,
biomass_burn_opt = 0,
plumerisefire_frq = 30,
have_bcs_chem = .false.,
aer_ra_feedback = 0,
aer_op_opt = 0,
opt_pars_out = 0,
diagnostic_chem = 0,
/
```
create real case.
```bash
mpirun -np 1 ./real.exe
```
And see file wrfbdy_d01 wrfinput_d01.
```bash
ls -alh wrfbdy_d01 wrfinput_d01
```
Run WRF
```bash
mpirun -np 2 ./wrf.exe
```
```bash
ls -alh wrfout_*
```
### 5.3 Show Result
list data inside wrfout.
```bash
ncdump -h wrfout_d01*
ncdump -v DUST_5 wrfout_d01*
```
Create pdf from wrfout.
```bash
cd /home/ubuntu/Build_WRF/WRF/test/em_real
```
Create ncl script.
```bash
vim plot_dust_5.ncl
```
```text
;*************************************************
; WRF: DUST_5
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"
begin
  f = addfile ("wrfout_d01_2010-07-14_00:00:00", "r")
  wks = gsn_open_wks("pdf" ,"WRF_DUST_5") ; ps,pdf,x11,ncgm,eps
  gsn_define_colormap(wks,"BlAqGrYeOrReVi200") ; select color map
  res = True ; plot mods desired
  res@gsnMaximize = True ; uncomment to maximize size
  res@gsnSpreadColors = True ; use full range of colormap
  res@cnFillOn = True ; color plot desired
  res@cnLinesOn = False ; turn off contour lines
  res@cnLineLabelsOn = False ; turn off contour labels
  WRF_map_c(f, res, 0) ; reads info from file
  res@tfDoNDCOverlay = True
  res@pmTickMarkDisplayMode = "Always"  ; turn on tickmarks
  times = wrf_user_getvar(f,"times",-1) ; get all times in the file
  ntimes = dimsizes(times) ; number of times in the file
  
  do nt=0,ntimes,6
    x = f->DUST_5(nt,0,:,:) ; (Time,level, south_north, west_east)
    res@tiMainString = "WRF-CHEM (DUST_5) " + times(nt)
    res@gsnLeftString = x@description
    plot = gsn_csm_contour_map(wks,x(:,:),res)
  end do
end
```
Create PDF
```bash
ncl plot_dust_5.ncl
```
Output is [WRF_DUST_5.pdf](./WRF_DUST_5.pdf)
