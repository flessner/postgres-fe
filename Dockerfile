ARG VERSION

FROM postgres:${VERSION}

ARG VERSION

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

RUN apt-get update && \
    apt-get install -y \
        postgresql-${VERSION}-pgvector \
        postgresql-${VERSION}-postgis-3 \
        postgresql-${VERSION}-cron \
        postgresql-contrib && \
    rm -rf /var/lib/apt/lists/*

RUN echo "CREATE EXTENSION IF NOT EXISTS vector;" > /docker-entrypoint-initdb.d/init-extensions.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS postgis;" >> /docker-entrypoint-initdb.d/init-extensions.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS hstore;" >> /docker-entrypoint-initdb.d/init-extensions.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS pg_cron;" >> /docker-entrypoint-initdb.d/init-extensions.sql && \
    echo "CREATE EXTENSION IF NOT EXISTS pgcrypto;" >> /docker-entrypoint-initdb.d/init-extensions.sql

EXPOSE 5432
