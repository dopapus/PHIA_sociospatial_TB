# Mapping the admin-levels and population data

sf_use_s2(FALSE)
tm_shape(mlw_shp) + tm_fill() + tm_borders()

tm_shape(zam_shp) + tm_fill() + tm_borders()

tm_shape(zim_shp) + tm_fill() + tm_borders()

# crop the population data to shapefile and local municipalities
# Malawi
pop_mlw_shp <- crop(mlw_pop, mlw_shp)
pop_mlw     <- mask(pop_mlw_shp, mlw_shp)

# Zambia
pop_zam_shp <- crop(zam_pop, zam_shp)
pop_zam     <- mask(pop_zam_shp, zam_shp)

# Zimbabwe
pop_zim_shp <- crop(zim_pop, zim_shp)
pop_zim     <- mask(pop_zim_shp, zim_shp)

# convert into spatial pixel data frame then into data frame to be able to plot in ggplot
# check population size
# Malawi
pop_mlw_spdf <- as(pop_mlw, "SpatialPixelsDataFrame")
mlw_df <- as.data.frame(pop_mlw_spdf)
colnames(mlw_df) <- c("value", "x", "y")
sum(mlw_df$value) # 15,691,678

# Zambia
pop_zam_spdf <- as(pop_zam, "SpatialPixelsDataFrame")
zam_df <- as.data.frame(pop_zam_spdf)
colnames(zam_df) <- c("value", "x", "y")
sum(zam_df$value) # 16,051,571

# Zimbabwe
pop_zim_spdf <- as(pop_zim, "SpatialPixelsDataFrame")
zim_df <- as.data.frame(pop_zim_spdf)
colnames(zim_df) <- c("value", "x", "y")
sum(zim_df$value) # 13,521,963

# plotting ----
# Malawi
ggplot()  +
    geom_sf(data = mlw_shp) +
    geom_tile(data = mlw_df[mlw_df$value>0,], 
              aes(x=x, y=y, fill=log(value)), alpha=0.6) +
    scale_fill_viridis() 

# Zambia
ggplot()  +
    geom_sf(data = zam_shp) +
    geom_tile(data = zam_df[zam_df$value>0,], 
              aes(x=x, y=y, fill=log(value)), alpha=0.6) +
    scale_fill_viridis() 

# Zimbabwe
ggplot()  +
    geom_sf(data = zim_shp) +
    geom_tile(data = zim_df[zim_df$value>0,], 
              aes(x=x, y=y, fill=log(value)), alpha=0.6) +
    scale_fill_viridis() 

# map all
ggplot()  +
    geom_sf(data = zam_shp) +
    geom_sf(data = zim_shp) +
    geom_sf(data = mlw_shp) 
    
