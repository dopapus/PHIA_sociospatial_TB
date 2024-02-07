# Data import

# load packages
pacman::p_load(rio, tidyverse,sp, sf, raster, ggmap, here, janitor, viridis, terra, tmap)

mlw_shp <- st_read(here("data", "raw", "shapefiles", "Malawi","mwi_adm_nso_hotosm_20230405_shp", "mwi_admbnda_adm3_nso_hotosm_20230405.shp")) # admin-level 3 n=433

zam_shp <- st_read(here("data", "raw", "shapefiles", "Zambia","zmb_adm_ecz_20230629_em_shp", "zmb_admbnda_adm3_ecz_20230629_em.shp")) # admin-level 3 n=156

zim_shp <- st_read(here("data", "raw", "shapefiles", "Zimbabwe","zwe_admbnda_adm3_zimstat_ocha_20180911", "zwe_admbnda_adm3_zimstat_ocha_20180911.shp")) # admin-level 3 n=91

# Zambia admin-level 4: n = 1853
zam_shp2 <- st_read(here("data", "raw", "shapefiles", "Zambia","zmb_adm_ecz_20230629_em_shp", "zmb_admbnda_adm4_ecz_20230629_em.shp"))

# Zimbabwe admin-level 2: n = 91
zim_shp2 <- st_read(here("data", "raw", "shapefiles", "Zimbabwe","zwe_admbnda_adm2_zimstat_ocha_20180911", "zwe_admbnda_adm2_zimstat_ocha_20180911.shp"))

sf_use_s2(FALSE)
tm_shape(mlw_shp) + tm_fill() + tm_borders()

tm_shape(zam_shp) + tm_fill() + tm_borders()

tm_shape(zim_shp) + tm_fill() + tm_borders()

