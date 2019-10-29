SELECT
  ST_AREA(ST_CONCAVEHULL(ST_Union(geom), 0.7)::geography) AS area
FROM public."2014-06-01 " WHERE id = 2;

CREATE TABLE junef AS
SELECT ST_ConvexHull(
    ST_Collect(geom::geometry)
) AS the_geom
FROM public."2014-06-01 " WHERE id = 2;

CREATE TABLE june(id, geom) AS
SELECT id, ST_ConvexHull(
    ST_Collect(geom::geometry)
) AS geom
FROM public."2014-06-01 "
GROUP BY id;

INSERT INTO june(id, geom)
SELECT id, ST_ConvexHull(ST_Collect(geom::geometry)) As the_geom
FROM "2014-06-01 "
GROUP BY id
having st_npoints(st_collect(geom))>=3;