# Name: Sophie C. Stuhler
# Date: 11-01-2017

# import packages

library(raster)
library(sp)
library(spatstat)

# Source functions

source('R/ageCalculator.R')
source('R/HelloWorld.R')
source('R/minusRaster.R')


HelloWorld('john')
ageCalculator(2009)

# Import datasets
r  <- raster(system.file("external/rlogo.grd", package="raster"))
r2 <- r

# Filling the rasterLayer with new values
r2[] <- (1:ncell(r2))/10

# Performs the calculation

r3 <- minusRaster(r,r2)

# Actual commands