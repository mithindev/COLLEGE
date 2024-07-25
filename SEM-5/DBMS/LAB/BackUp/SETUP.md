## Running PostgreSQL with Docker

1. Go to the directory containing your `docker-compose.yml` file and run:

    ```bash
    docker-compose up -d
    ```

2. To access the PostgreSQL database, run:

    ```bash
    docker exec -it 408605031bdf psql -h postgres -U mithin -d postgres
    ```

Replace `408605031bdf` with the actual container ID of your `psql` service if it's different.
