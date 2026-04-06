---
title: Local GDAL on Webfaction
date: 2013-12-23
description: Local GDAL on Webfaction
categories:
 - GIS
 - GDAL
 - Webfaction
lang: en
toc: true
---

After getting a Django app to read a .GML (Geography Markup Language) file, I noticed this did not work on Webfaction. After uploading the .GML, Django gave the following error trying to read the datasource:

	raise OGRException('Could not open the datasource at "%s"' % ds_input)

Thinking this might be a difference between my local GDAL version and the one on my webhost. I tried:

	gdal-config --version

Which gave GDAL 1.5.3 on Webfaction and GDAL 1.10.1 on my computer. I decided to try and install a local version of GDAL on Webfaction.

In my home directory on Webfaction:

	$ mkdir src
	$ cd scr
	$ svn checkout https://svn.osgeo.org/gdal/branches/1.10/gdal gdal
	$ cd gdal
	$ ./configure --prefix=$HOME  --with-python=/usr/local/bin/python2.7  --with-expat=yes
	$ make
	$ make install

Next I added the location of my local GDAL library to the settings.py of my Django project.

	GDAL_LIBRARY_PATH = '/home/user123/lib/libgdal.so'

And restarted Apache.

That fixed it.

## Sources

- [GeoDjango DataSource GPX uploads fail.](http://community.webfaction.com/questions/5667/geodjango-datasource-gpx-uploads-fail) (Webfaction)
- [Installing GDAL for PostGIS 2.0](http://community.webfaction.com/questions/5689/installing-gdal-for-postgis-20) (Webfaction)
- [GeoDjango geos bug](http://community.webfaction.com/questions/12947/geodjango-geos-bug) (Webfaction)
- [GDAL 1.10 ogr2ogr OSM “Unable to open datasource”](http://gis.stackexchange.com/questions/67371/gdal-1-10-ogr2ogr-osm-unable-to-open-datasource/67614?newreg=d819d60d4c0843f39b35f7c41560551a) (Stack Exchange GIS)
