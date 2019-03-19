# Part 3: Advanced TSL Features

CREATE TABLE sensors(time timestamptz, device_id text, temperature float);
SELECT create_hypertable('sensors', 'time');

CREATE TABLE sensors_metadata(device_id text, vid text, route_id text);

WITH RECURSIVE CTE AS (
SELECT timestamptz '2019-02-01 00:00:00' AS x, 80.0::float AS y
UNION ALL
SELECT x+interval '1 minute', greatest(least((y+((random()-0.5)*1))::float,100::float), 0::float)
FROM cte WHERE x <'2019-04-01'
)
INSERT INTO sensors select x, '1', y+(random()-0.5)*20 FROM cte;

WITH RECURSIVE CTE AS (
SELECT timestamptz '2019-02-01 00:00:00' AS x, 80.0::float AS y
UNION ALL
SELECT x+interval '1 minute', greatest(least((y+((random()-0.5)*1))::float,100::float), 0::float)
FROM cte WHERE x <'2019-04-01'
)
INSERT INTO sensors select x, '2', y+(random()-0.5)*20 FROM cte;

WITH RECURSIVE CTE AS (
SELECT timestamptz '2019-02-01 00:00:00' AS x, 80.0::float AS y
UNION ALL
SELECT x+interval '1 minute', greatest(least((y+((random()-0.5)*1))::float,100::float), 0::float)
FROM cte WHERE x <'2019-04-01'
)
INSERT INTO sensors select x, '3', y+(random()-0.5)*20 FROM cte;

WITH RECURSIVE CTE AS (
SELECT timestamptz '2019-02-01 00:00:00' AS x, 80.0::float AS y
UNION ALL
SELECT x+interval '1 minute', greatest(least((y+((random()-0.5)*1))::float,100::float), 0::float)
FROM cte WHERE x <'2019-03-01'
)
INSERT INTO sensors select x, '4', y+(random()-0.5)*20 FROM cte;

WITH RECURSIVE CTE AS (
SELECT timestamptz '2019-03-10 00:00:00' AS x, 80.0::float AS y
UNION ALL
SELECT x+interval '1 minute', greatest(least((y+((random()-0.5)*1))::float,100::float), 0::float)
FROM cte WHERE x <'2019-04-01'
)
INSERT INTO sensors select x, '4', y+(random()-0.5)*20 FROM cte;

SELECT
  time_bucket_gapfill('2h', time, '2019-02-01', now()) AS time,
  device_id AS metric,
  avg(temperature)
FROM sensors
WHERE
  time > '2019-02-01' and device_id='4'
GROUP BY
  1,2
ORDER BY 1;
