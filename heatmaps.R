set.seed(1)
library(ggplot2)
df <- as.data.frame(expand.grid(1:50, 1:50))

df$col <- sample(0:40, size = nrow(df), replace = TRUE)

df <- df[sample(1:nrow(df), nrow(df) * .2, replace = FALSE), ]  # make holes

df <- df[rep(1:nrow(df), df$col), -3]

ggplot(df, aes(x = Var1, y = Var2)) + 
  geom_point() + 
  stat_density2d(aes(fill=..density..), geom = "tile", contour = FALSE) +
  scale_fill_gradient2(low = "white", high = "red")

#
x <- c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4)
y <- c(1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5)
z <- rnorm(20)

library(fields)
library(akima)

s <- interp(x,y,z)
image.plot(s)

#
library(MASS)
set.seed(123); xy = cbind(rnorm(1000), rnorm(1000))
# Use kde2d from MASS. Pick h for a nice smooth map, pick n for the resolution:
k = kde2d(xy[,1],xy[,2], h = .8, n = 50)

library(raster)
r = raster(k)
plot(r)

# https://www.sharpsightlabs.com/blog/how-to-create-a-crime-heatmap-in-r/
# # INSTALL PACKAGES
library(tidyverse)
library(ggmap)
library(stringr)
library(viridis)

lsf_crime <- read_csv('https://sharpsightlabs.com/datasets/sf_crime-data-2017.csv'
                      ,col_names = c('incident_number'
                                     ,'crime_category'
                                     ,'crime_description'
                                     ,'day_of_week'
                                     ,'date'
                                     ,'time'
                                     ,'police_district'
                                     ,'resolution'
                                     ,'address'
                                     ,'lon'
                                     ,'lat'
                                     ,'location'
                                     ,'PdId'
                      )
                      ,skip = 1
)

# INSPECT
lsf_crime %>% glimpse()


# PLOT SCATTERPLOT
# - we'll do this as a quick data-check
ggplot() +
  geom_point(data = lsf_crime, aes(x = lon, y = lat), alpha = .05)

# CREATE A QUICK “FIRST DRAFT” HEATMAP
# In the next step, let’s very quickly create a “heatmap” of the data, 
# which is essentially a 2-dimentional density plot.

# SIMPLE HEATMAP
ggplot() +
  stat_density2d(data = lsf_crime, aes(x = lon, y = lat, fill = ..density..), 
                 geom = 'tile', 
                 contour = F
                 , alpha = .5)+
  scale_fill_viridis(option = 'inferno') +
  theme_light()




register_google(key = "AIzaSyCuwJehFmJwsh7hf1Wf_6Ezb9oUuK7PuFA")

map_sf <- get_map('San Francisco', zoom = 12, maptype = 'satellite')
