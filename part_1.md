# Part 1: Installing TimescaleDB
## Install TimescaleDB

For install instructions, follow the steps outlined [here](https://docs.timescale.com/v1.2/getting-started/installation/).

To access a running instance on Azure Database for PostgreSQL:
`psql --host=azure-timescale.postgres.database.azure.com --port=5432 --username=test@azure-timescale --dbname=tutorial`

Password = Tutorial2019

## Setup TimescaleDB

Run through the setup instructions [here](https://docs.timescale.com/v0.12/getting-started/setup).

Connect to your database and run `\dx` to confirm that TimescaleDB was properly installed as an extension.

## Load the sample dataset

We will be using the taxi trip record data set provided by NYC Gov, available [here](http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml).

The data has been formatted for your easy consumption in this repository, so you can choose to download the relevant files there.

Use the SQL instructions provided in [part_1.sql](https://github.com/dianasaur323/timescale_tutorial/blob/master/part_1.sql) to load the CSV file.

## Manually set chunk_size

SELECT * FROM chunk_relation_size_pretty('taxi_data');

SELECT set_chunk_time_interval('taxi_data', interval '24 hours');

tar xopf jan_2.tar.gz

\copy taxi_data FROM '/Users/dianasaur/Projects/timescale_tutorial/jan_2.csv' WITH (FORMAT CSV, HEADER);

SELECT * FROM chunk_relation_size_pretty('taxi_data');
