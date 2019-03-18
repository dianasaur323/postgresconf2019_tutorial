--- Create a table

CREATE TABLE zone_lookup(
  LocationID INTEGER,
  Borough TEXT,
  Zone TEXT,
  service_zone TEXT
);

-- Run the following command in the psql interface
\copy zone_lookup FROM '/Users/dianasaur/Projects/timescale_tutorial/zone_lookup.csv' WITH (FORMAT CSV, HEADER);
