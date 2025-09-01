ARG VERSION

FROM postgres:${VERSION}

ARG VERSION

RUN echo "shared_preload_libraries = 'pg_stat_statements'" >> /usr/share/postgresql/postgresql.conf.sample

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

COPY entrypoint.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
