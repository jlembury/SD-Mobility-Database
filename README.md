# :red_car: Human Mobility in San Diego County
### A Spatial Database Implementation

Python in a Jupyter Notebook was used to automate the implementation of a PostgreSQL database with PostGIS extension. LODES Census Origin-Destination data for California was collected [HERE](https://lehd.ces.census.gov/data/lodes/LODES7/ca/od/). This data was joined to spatial data for [Census Block Groups](https://www.census.gov/cgi-bin/geo/shapefiles/index.php) and then [Sub-regional Areas](https://sandag.org/resources/maps_and_gis/gis_downloads/sandagreportingareas.asp). The psycopg2 library was used to implement a PostgreSQL from the Jupyter Notebook. Geometry was added in the form of flowlines and aggregated data for Sub-regional Areas, then exported as shapefiles for ArcGIS Pro visualizations.

Check out the [PROJECT SLIDES](https://gisjess.com/pdf/Database%20Implementation.pdf) for more information on methods and findings.
