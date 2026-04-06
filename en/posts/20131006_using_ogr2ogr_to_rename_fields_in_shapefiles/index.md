---
title: Using ogr2ogr to rename fields in shapefiles
authors:
 - Etiënne Thomassen
date: 2013-10-06T15:00:00+01:00
created_at: 2013-10-06
samenvatting:  Using ogr2ogr to rename fields in shapefiles 
categories:
 - GIS
 - OGR
 - GDAL
 - ogr2ogr
 - shapefile
lang: en
---

**ogr2ogr** is a commandline application packaged with GDAL. It can be used to rename the fields of a shapefile.

Like so:

	ogr2ogr outputfile.shp inputfile.shp -sql "SELECT oldfield1 AS newfield1, oldfield2 AS newfield2 from inputfile"

**The result only contains the fields in the SELECT query, with the field in the order they were mentioned in the SELECT query.**

A shapefield named **original.shp** with the fields *field1*, *field2* and *field3*(in that order), will change into **result.shp** with the fields *field3* and *newfield1*(in that order) using:

	ogr2ogr result.shp original.shp -sql "SELECT field3 AS field1, field1 AS newfield1 from original"

## Sources

- [Renaming Fields in a Shapefile](http://darrencope.com/2011/04/26/renaming-fields-in-a-shapefile/)
- [How to rename field names in a shapefile from the commandline?](http://gis.stackexchange.com/questions/58541/how-to-rename-field-names-in-a-shapefile-from-the-commandline)
