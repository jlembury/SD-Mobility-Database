
--connect to database
psql -h  -p  -d  -U 

--set search path
set search_path to lodes, public;

--set client encoding
set client_encoding to 'utf8';

--enable/verify postgis extension in database
create extension postgis;

select postgis_full_version();

--import reference:
--http://www.bostongis.com/pgsql2shp_shp2pgsql_quickguide.bqg

--EPSG 4326 = WGS 84

--import block group .shp (from command line, not from psql) (Years 2013-2019)
shp2pgsql -s 4326 "C:\temp\BG\tl_2013_06_bg" lodes.tl_2013_06_bg | psql -h localhost -d dbname -U username
shp2pgsql -s 4326 "C:\temp\BG\tl_2014_06_bg" lodes.tl_2014_06_bg | psql -h localhost -d dbname -U username 
shp2pgsql -s 4326 "C:\temp\BG\tl_2015_06_bg" lodes.tl_2015_06_bg | psql -h localhost -d dbname -U username
shp2pgsql -s 4326 "C:\temp\BG\tl_2016_06_bg" lodes.tl_2016_06_bg | psql -h localhost -d dbname -U username
shp2pgsql -s 4326 "C:\temp\BG\tl_2017_06_bg" lodes.tl_2017_06_bg | psql -h localhost -d dbname -U username
shp2pgsql -s 4326 "C:\temp\BG\tl_2018_06_bg" lodes.tl_2018_06_bg | psql -h localhost -d dbname -U username
shp2pgsql -s 4326 "C:\temp\BG\tl_2019_06_bg" lodes.tl_2019_06_bg | psql -h localhost -d dbname -U username

--import subregional area .shp (from command line, not from psql)
shp2pgsql -s 4326 "C:\temp\SRA\Subregional_Areas_SRAs" lodes.sd_sra | psql -h localhost -d dbname -U username

--import zip code .shp (from command line, not from psql)
shp2pgsql -s 4326 "C:\temp\ZIP\ZIP_CODES" lodes.sd_zip | psql -h localhost -d dbname -U username

--copy table (no geometry) to CSV
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt00_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt00_2013_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt01_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt01_2013_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt02_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt02_2013_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt03_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt03_2013_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt04_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt04_2013_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt05_2013_sd_sra) to '~\lodes\od_csv\ca_od_main_jt05_2013_sd_sra.csv' with csv header

\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt00_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt00_2014_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt01_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt01_2014_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt02_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt02_2014_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt03_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt03_2014_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt04_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt04_2014_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt05_2014_sd_sra) to '~\lodes\od_csv\ca_od_main_jt05_2014_sd_sra.csv' with csv header

\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt00_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt00_2015_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt01_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt01_2015_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt02_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt02_2015_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt03_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt03_2015_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt04_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt04_2015_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt05_2015_sd_sra) to '~\lodes\od_csv\ca_od_main_jt05_2015_sd_sra.csv' with csv header

\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt00_2016_sd_sra) to '~\lodes\od_csv\ca_od_main_jt00_2016_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt01_2016_sd_sra) to '~\lodes\od_csv\ca_od_main_jt01_2016_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt02_2016_sd_sra) to '~\lodes\od_csv\ca_od_main_jt02_2016_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt03_2016_sd_sra) to '~\lodes\od_csv\ca_od_main_jt03_2016_sd_sra.csv' with csv header

\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt00_2017_sd_sra) to '~\lodes\od_csv\ca_od_main_jt00_2017_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt01_2017_sd_sra) to '~\lodes\od_csv\ca_od_main_jt01_2017_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt02_2017_sd_sra) to '~\lodes\od_csv\ca_od_main_jt02_2017_sd_sra.csv' with csv header
\copy (SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03 FROM lodes.ca_od_main_jt03_2017_sd_sra) to '~\lodes\od_csv\ca_od_main_jt03_2017_sd_sra.csv' with csv header

--export table with geometry to shapefile
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt00_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt00_2013_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt01_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt01_2013_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt02_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt02_2013_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt03_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt03_2013_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt04_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt04_2013_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt05_2013_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt05_2013_sd_sra"

pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt00_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt00_2014_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt01_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt01_2014_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt02_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt02_2014_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt03_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt03_2014_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt04_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt04_2014_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt05_2014_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt05_2014_sd_sra"

pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt00_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt00_2015_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt01_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt01_2015_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt02_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt02_2015_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt03_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt03_2015_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt04_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt04_2015_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt05_2015_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt05_2015_sd_sra"

pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt00_2016_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt00_2016_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt01_2016_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt01_2016_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt02_2016_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt02_2016_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt03_2016_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt03_2016_sd_sra"

pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt00_2017_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt00_2017_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt01_2017_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt01_2017_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt02_2017_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt02_2017_sd_sra"
pgsql2shp -f "~\lodes\od_shapefiles\ca_od_main_jt03_2017_sd_sra" -h localhost -u username -P password dbname "SELECT home_sra, home_sra_name, work_sra, work_sra_name, s000, sa01, sa02, sa03, se01, se02, se03, si01, si02, si03, geom_line_flow FROM lodes.ca_od_main_jt03_2017_sd_sra"

--SQL Syntax Samples
--**********************************************
--aggregate mobility data to the sra level, create index, create flow lines, and export shapefile --> see lodes_sandiego_spatial jupyter notebooks file
--drop sra table if exists
DROP TABLE IF EXISTS lodes.ca_od_main_jt04_2013_sd_sra;

--create table of mobility data aggregated to the sra level with sra polygon geometry
create table lodes.ca_od_main_jt04_2013_sd_sra as 
select h_sra.sra as home_sra, h_sra.name as home_sra_name, w_sra.sra as work_sra, w_sra.name as work_sra_name, sum(bg.s000) as s000, sum(bg.sa01) as sa01, sum(bg.sa02) as sa02, sum(bg.sa03) as sa03, sum(bg.se01) as se01, sum(bg.se02) as se02, sum(bg.se03) as se03, sum(bg.si01) as si01, sum(bg.si02) as si02, sum(bg.si03) as si03, h_sra.geom as geom_home, w_sra.geom as geom_work
from lodes.ca_od_main_jt04_2013_sd_bg as bg join lodes.sd_sra as h_sra on ST_Within(bg.geom_pt_home, h_sra.geom) join lodes.sd_sra as w_sra on ST_Within(bg.geom_pt_work, w_sra.geom)
group by h_sra.sra, h_sra.name, h_sra.geom, w_sra.sra, w_sra.name, w_sra.geom;

--add sra home centroid
alter table lodes.ca_od_main_jt04_2013_sd_sra add geom_pt_home geometry(Point,4326);
update lodes.ca_od_main_jt04_2013_sd_sra set geom_pt_home = ST_Centroid(geom_home);

--add sra work centroid
alter table lodes.ca_od_main_jt04_2013_sd_sra add geom_pt_work geometry(Point,4326);
update lodes.ca_od_main_jt04_2013_sd_sra set geom_pt_work = ST_Centroid(geom_work);

--create index based on work sra, home sra
CREATE INDEX idx_ca_od_main_jt04_2013_sd_wh_sra ON lodes.ca_od_main_jt04_2013_sd_sra (work_sra, home_sra);

--create flow line geometry to show home --> work mobility
ALTER TABLE lodes.ca_od_main_jt04_2013_sd_sra ADD geom_line_flow geometry(Linestring,4326);
UPDATE lodes.ca_od_main_jt04_2013_sd_sra SET geom_line_flow = ST_MakeLine(geom_pt_home, geom_pt_work);

--**********************************************
--get summarized mobility numbers for each sra and export shapefile
--Total numbers of residents leaving for work, commuters entering for jobs, 
--and people that live and work within the SRA

create table lodes.ca_od_main_jt00_2017_sd_sra_summary as select home_sra as sra, 
	home_sra_name as sra_name, h.s000-b.s000 as residents_leaving, 
	w.s000-b.s000 as commuters_entering, b.s000 as both_live_work, geom_home as geom
from (
	select home_sra, home_sra_name, sum(s000) as s000, geom_home
	from ca_od_main_jt00_2017_sd_sra
	group by home_sra, home_sra_name, geom_home
	order by home_sra
) as h join (
	select work_sra, work_sra_name, sum(s000) as s000
	from ca_od_main_jt00_2017_sd_sra
	group by work_sra, work_sra_name
	order by work_sra
) as w on h.home_sra = w.work_sra join (
	select home_sra as both_sra, home_sra_name as both_sra_name, s000
	from ca_od_main_jt00_2017_sd_sra
	group by home_sra, home_sra_name, s000, work_sra
	having home_sra = work_sra
	order by home_sra
) as b on h.home_sra = b.both_sra
group by home_sra, home_sra_name, h.s000, w.s000, b.s000, geom_home
order by home_sra_name;
	
pgsql2shp -f "" -h localhost -u  -P  "SELECT * FROM lodes.ca_od_main_jt00_2017_sd_sra_summary"
	
--**********************************************	


