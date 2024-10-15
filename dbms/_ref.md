#### To ascess `psql` server:-

`docker exec -it hospital_postgres_db psql -U mithin -d hospital_db`

#### To connect to `psql` as user `mithin`:-

`docker exec -it hospital_postgres_db psql -U mithin `

#### To create a database:-

1) `CREATE DATABASE hospital_db;`
2) `\c hospital_db`
