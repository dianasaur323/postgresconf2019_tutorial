-- Create a table

CREATE TABLE taxi_data(
  VendorID INTEGER,
  tpep_pickup_datetime TIMESTAMP,
  tpep_dropoff_datetime TIMESTAMP,
  passenger_count INTEGER,
  trip_distance FLOAT,
  RatecodeID INTEGER,
  store_and_fwd_flag CHAR,
  PULocationID INTEGER,
  DOLocationID INTEGER,
  payment_type INTEGER,
  fare_amount FLOAT,
  extra FLOAT,
  mta_tax FLOAT,
  tip_amount FLOAT,
  tolls_amount FLOAT,
  improvement_surcharge FLOAT,
  total_amount FLOAT
);

-- Create a hypertable

SELECT create_hypertable('taxi_data', 'tpep_pickup_datetime');

-- Unzip the jan_1.tar.gz file
tar xopf jan_1.tar.gz

-- Run the following command in the psql interface
\copy taxi_data FROM '/Users/dianasaur/Projects/timescale_tutorial/jan_1.csv' WITH (FORMAT CSV, HEADER);

-- Your data is loaded! Try running
SELECT * FROM taxi_data LIMIT 1;
