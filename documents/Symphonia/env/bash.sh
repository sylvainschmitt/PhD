saga_cmd sim_hydrology 1 -DEM dem.sgrd -FLOW flow.sgrd
saga_cmd ta_lighting 0 -ELEVATION dem.sgrd -SHADE shade.sgrd
saga_cmd ta_preprocessor 5 -ELEV dem.sgrd -FILLED demfilledsinks.sgrd
saga_cmd ta_hydrology 15 -DEM demfilledsinks.sgrd -TWI wetness.srgd
gdal_translate -of GTiff wetness.sdat wetness.tiff