# Part 1: Installing TimescaleDB
## Install TimescaleDB

For install instructions, follow the steps outlined [here](https://docs.timescale.com/v1.2/getting-started/installation/).

To access a running instance on Azure Database for PostgreSQL:
`psql --host=azure-timescale.postgres.database.azure.com --port=5432 --username=test@azure-timescale --dbname=tutorial`

## Setup TimescaleDB

Run through the setup instructions [here](https://docs.timescale.com/v1.2/getting-started/setup).

Connect to your database and run `\dx` to confirm that TimescaleDB was properly installed as an extension.

---------- STOP HERE --------------

## Load the sample dataset

We will be using the taxi trip record data set provided by NYC Gov, available [here](http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml).

The data has been formatted for your easy consumption in this repository, so you can choose to download the relevant files there.

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
\copy taxi_data FROM '/Users/dianasaur/Projects/postgresconf2019_tutorial/jan_1.csv' WITH (FORMAT CSV, HEADER);

-- Your data is loaded! Try running
SELECT * FROM taxi_data LIMIT 1;

---------- STOP HERE --------------

## Manually set chunk_size

SELECT * FROM chunk_relation_size_pretty('taxi_data');

SELECT set_chunk_time_interval('taxi_data', interval '24 hours');

tar xopf jan_2.tar.gz

\copy taxi_data FROM '/Users/dianasaur/Projects/postgresconf2019_tutorial/jan_2.csv' WITH (FORMAT CSV, HEADER);

SELECT * FROM chunk_relation_size_pretty('taxi_data');

---------- STOP HERE --------------
