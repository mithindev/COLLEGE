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


<hr>

Use this command for ascessing a Database using a link

docker run -it --rm postgres:latest psql "postgresql://username:sXa5QrVy0NEK@ep-bitter-paper-92298120.us-east-2.aws.neon.tech/prisma_migrate_shadow_db_673b47f0-016b-42e3-80c8-34d36b822caf?sslmode=require"

