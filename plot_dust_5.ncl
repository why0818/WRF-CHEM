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
