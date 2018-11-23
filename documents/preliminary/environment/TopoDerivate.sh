## Script to compute all topography derivates from DEM ##

# Including :
# 1 - Relative Elevation
# 2 - Topographic Wetness Index (TWI)
# 3 - Slope, Aspect, Curvature
# 4 - Topographic Ruggedness Index  (TRI)
# 6 - Treefall gaps
# 5 - Hillshade

#!/bin/bash

cd /home/sylvain/Documents/BIOGECO/PhD/data/Paracou/topography # working directory
DEM=DEM_1m_2015.tif # Variable to control input DEM in all derivates
DCM=MNC_ParacouAvril2009_1m.tif # Variable to control input DCM in all derivates

## 1 - Relative Elevation ##

grass -c .grass/ # to be computed inside grass
r.in.gdal DEM_1m_2015.tif out=DEM -o # import DEM
g.region -pa raster=DEM # set region
r.watershed elevation=DEM \
            threshold=10000 \
            drainage=direction \
            stream=streams # flow direction and stream network
g.extension extension=r.stream.distance # stream distance
r.stream.distance stream_rast=streams \
                  direction=direction elevation=DEM \
                  method=downstream \
                  distance=distance_stream_downstream \
                  difference=difference_stream_downstream # relative elevation
r.out.gdal input=streams output=streams_1m.tif # stream export
r.out.gdal input=difference_stream_downstream output=RelativeElevation_1m.tif # relative elevation export
exit # exit grass
rm -r .grass # clean grass tmp folder

## 2 - Topographic Wetness Index (TWI) ##

mkdir .saga
saga_cmd ta_preprocessor 5 -ELEV $DEM -FILLED ./.saga/demfilledsinks_1m.sgrd # bassins-versants
saga_cmd ta_hydrology 15 -DEM ./.saga/demfilledsinks_1m.sgrd -TWI ./.saga/wetness_1m.srgd # TWI
gdal_translate -of GTiff ./.saga/wetness_1m.sdat TWI_1m.tif # SAGA format -> GEOTif tif
rm -r .saga

## 3 - Slope, Aspect, Curvature ##

mkdir .saga
saga_cmd ta_morphometry 0 -ELEVATION $DEM \
						  -SLOPE ./.saga/slope_1m.sgrd \
						  -ASPECT ./.saga/aspect_1m.sgrd \
						  -C_GENE ./.saga/curvature_1m.sgrd 
gdal_translate -of GTiff ./.saga/slope_1m.sdat slope_1m.tif
gdal_translate -of GTiff ./.saga/aspect_1m.sdat aspect_1m.tif
gdal_translate -of GTiff ./.saga/curvature_1m.sdat curvature_1m.tif
rm -r .saga

## 4 - Topographic Ruggedness Index  (TRI) ##

mkdir .saga
saga_cmd ta_morphometry 16 -DEM $DEM \
						   -TRI ./.saga/TRI_1m.sgrd
gdal_translate -of GTiff ./.saga/TRI_1m.sdat TRI_1m.tif
rm -r .saga

## 6 - Treefall gaps ##

mkdir .saga
saga_cmd grid_tools 15 -INPUT $DCM \
                       -METHOD 1 \
                       -MIN 0 \
                       -MAX 4 \
                       -RNEW 1 \
					   -RESULT ./.saga/gaps.sgrd # gaps 0-4m = 1
saga_cmd grid_tools 15 -INPUT ./.saga/gaps.sgrd \
                       -METHOD 0 \
                       -SOPERATOR 4 \
                       -OLD 4 \
                       -NEW 0 \
					   -RESULT ./.saga/gaps2.sgrd # gaps >4m = 0
gdal_translate -of GTiff ./.saga/gaps2.sdat ./.saga/gaps.tif
gdal_polygonize.py ./.saga/gaps.tif ./.saga/gaps.gml
ogr2ogr ./.saga/gaps.shp ./.saga/gaps.gml
ogr2ogr -f "ESRI Shapefile" \
        -where "DN = 1" \
        ./.saga/gaps2.shp ./.saga/gaps.shp # filtering only gaps
saga_cmd shapes_polygons 2 -POLYGONS ./.saga/gaps2.shp \
                           -OUTPUT ./.saga/gaps3.shp \
                           -BAREA 1 # computing gaps area
ogr2ogr -f "ESRI Shapefile" \
        -where "AREA > 4" \
        ./.saga/gaps4.shp ./.saga/gaps3.shp # filtering area > 4m2
mkdir Gaps
cp ./.saga/gaps4* Gaps/
rm -r .saga

## 5 - Hillshade ##

mkdir .saga
saga_cmd ta_lighting 0 -ELEVATION $DEM -SHADE ./.saga/hillshade_1m.sgrd
gdal_translate -of GTiff ./.saga/hillshade_1m.sdat hillshade_1m.tif
rm -r .saga
