## Create two RasterLayer objects of similar extent
library(raster)

r <- s <- raster(ncol=50, nrow=50)
## Fill the raster with values
r[] <- 1:ncell(r)
s[] <- 2 * (1:ncell(s))
s[200:400] <- 150
s[50:150] <- 151
## Perform the replacement
r[s %in% c(150, 151)] <- NA
## Visualise the result
plot(r)


## Import the variable "cars" in the working environment
data(cars)
class(cars)
## Visualise the first six rows of the variable
head(cars)
# The plot function on this type of dataset (class = data.frame, 2 column)
# automatically generates a scatterplot
plot(cars)


## Example using built-in dataset from the sp package
library(sp)
## Load required datastes
data(meuse)
# The meuse dataset is not by default a spatial object
# but its x, y coordinates are part of the data.frame
class(meuse)
coordinates(meuse) <- c("x", "y")
class(meuse)
bubble(meuse, "zinc", maxsize = 2.5,
       main = "zinc concentrations (ppm)", key.entries = 2^(-1:4))


## Load meuse.riv dataset
data(meuse.riv)
## Create an object of class SpatialPolygons from meuse.riv
meuse.sr <- SpatialPolygons(list(Polygons(list(Polygon(meuse.riv)),"meuse.riv")))
## Load the meuse.grid dataset
data(meuse.grid)
## Assign coordinates to the dataset and make it a grid
coordinates(meuse.grid) = c("x", "y")
gridded(meuse.grid) = TRUE
## Plot all variables of the meuse.grid dataset in a multiple window spplot
spplot(meuse.grid, col.regions=bpy.colors(), main = "meuse.grid",
       sp.layout=list(
         list("sp.polygons", meuse.sr),
         list("sp.points", meuse, pch="+", col="black")
       )
)



