

sf_use_s2(FALSE)
tm_shape(mlw_shp) + tm_fill() + tm_borders()

tm_shape(zam_shp) + tm_fill() + tm_borders()

tm_shape(zim_shp) + tm_fill() + tm_borders()

# crop the population data to MLW_clusters shapefile and local municipalities
pop.mlw_clusters <- crop(pop_u5, dat)
popu5.mlw_clusters <- mask(pop.mlw_clusters, dat)

pop.blantyre <- crop(pop_u5, blantyre )
popu5.blantyre <- mask(pop.blantyre, blantyre)

# convert into spatial pixel data frame then into data frame to be able to plot in ggplot
# check population size
u5_mlw_spdf <- as(popu5.mlw_clusters, "SpatialPixelsDataFrame")
u5_mlw_df <- as.data.frame(u5_mlw_spdf)
colnames(u5_mlw_df) <- c("value", "x", "y")
sum(u5_mlw_df$value) # 111,856


u5_blan_spdf <- as(popu5.blantyre, "SpatialPixelsDataFrame")
u5_blan_df <- as.data.frame(u5_blan_spdf)
colnames(u5_blan_df) <- c("value", "x", "y")
sum(u5_blan_df$value) # 141,545

ggplot()  +
    geom_sf(data = blantyre) +
    geom_tile(data = u5_blan_df[u5_blan_df$value>0,], aes(x=x, y=y, fill=value), alpha=0.6) +
    scale_fill_viridis() +
    geom_sf(data = dat, alpha = 0.1, lwd = 0.5)