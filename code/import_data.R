# Data import

# load packages ----
pacman::p_load(rio, tidyverse,sp, sf, raster, ggmap, here, janitor, viridis, terra, tmap)

# import shapefiles ----
# Malawi
mlw_shp <- st_read(here("data", "raw", "shapefiles", "Malawi","mwi_adm_nso_hotosm_20230405_shp", "mwi_admbnda_adm3_nso_hotosm_20230405.shp")) # admin-level 3 n=433

# Zambia
zam_shp <- st_read(here("data", "raw", "shapefiles", "Zambia","zmb_adm_ecz_20230629_em_shp", "zmb_admbnda_adm3_ecz_20230629_em.shp")) # admin-level 3 n=156

# Zambia admin-level 4: n = 1853
zam_shp2 <- st_read(here("data", "raw", "shapefiles", "Zambia","zmb_adm_ecz_20230629_em_shp", "zmb_admbnda_adm4_ecz_20230629_em.shp"))

# Zimbabwe
zim_shp <- st_read(here("data", "raw", "shapefiles", "Zimbabwe","zwe_admbnda_adm3_zimstat_ocha_20180911", "zwe_admbnda_adm3_zimstat_ocha_20180911.shp")) # admin-level 3 n=91

# Zimbabwe admin-level 2: n = 91
zim_shp2 <- st_read(here("data", "raw", "shapefiles", "Zimbabwe","zwe_admbnda_adm2_zimstat_ocha_20180911", "zwe_admbnda_adm2_zimstat_ocha_20180911.shp"))


# import WorldPop data ----
# Malawi
mlw_pop <- raster(here("data","raw","WorldPop", "mwi_ppp_2015.tif"))

# Zambia
zam_pop <- raster(here("data","raw","WorldPop", "zmb_ppp_2016.tif"))

# Zimbabwe
zim_pop <- raster(here("data","raw","WorldPop", "zwe_ppp_2015.tif"))


# import PHIA data ----
## centroids ----
# Malawi
mlw_centroids  <- import(here("data", "raw", "PHIA data", "Malawi", "mphia2015centroids.csv")) 
attr(mlw_centroids, 'spec') <- NULL #drop attributes

# Zambia
zam_centroids  <- import(here("data", "raw", "PHIA data", "Zambia", "zamphia2016centroids.csv"))
attr(zam_centroids, 'spec') <- NULL 

# Zimbabwe
zim_centroids  <- import(here("data", "raw", "PHIA data", "Zimbabwe", "zimphia2015centroids.csv")) #centroidid
attr(zim_centroids, 'spec') <- NULL 

## household data ----
# Malawi
mlw_hh <- import(here("data", "raw", "PHIA data", "Malawi", "mphia2015hh.csv"))
attr(mlw_hh, 'spec') <- NULL 

# Zambia
zam_hh <- import(here("data", "raw", "PHIA data", "Zambia", "zamphia2016hh.csv"))
attr(zam_hh, 'spec') <- NULL 

# Zimbabwe
zim_hh <- import(here("data", "raw", "PHIA data", "Zimbabwe", "zimphia2015hh.csv"))
attr(zim_hh, 'spec') <- NULL 

## individual adult data ----
# Malawi
mlw_adultind <- import(here("data", "raw", "PHIA data", "Malawi", "mphia2015adultind.csv"))
attr(mlw_adultind, 'spec') <- NULL 

# Zambia
zam_adultind <- import(here("data", "raw", "PHIA data", "Zambia", "zamphia2016adultind.csv"))
attr(zam_adultind, 'spec') <- NULL 

# Zimbabwe
zim_adultind <- import(here("data", "raw", "PHIA data", "Zimbabwe", "zimphia2015adultind.csv"))
attr(zim_adultind, 'spec') <- NULL 

## individual adult biological data ----
# Malawi
mlw_adultbio <- import(here("data", "raw", "PHIA data", "Malawi", "mphia2015adultbio.csv"))
attr(mlw_adultbio, 'spec') <- NULL 

# Zambia
zam_adultbio <- import(here("data", "raw", "PHIA data", "Zambia", "zamphia2016adultbio.csv"))
attr(zam_adultbio, 'spec') <- NULL 

# Zimbabwe
zim_adultbio <- import(here("data", "raw", "PHIA data", "Zimbabwe", "zimphia2015adultbio.csv"))
attr(zim_adultbio, 'spec') <- NULL


