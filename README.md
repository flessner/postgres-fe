# PostgreSQL Flessner Edition

A minimal [PostgreSQL](https://github.com/postgres/postgres) Docker image with essential extensions for version `15`, `16` and `17`.

## Features

- **pgvector** - Vector similarity search for AI/ML applications
- **postgis** - Spatial and geographic data support
- **hstore** - Key-value pair storage
- **pg_cron** - Database-native job scheduling
- **pgcrypto** - Cryptographic functions
- **pg_stat_statements** - Query performance tracking
- **nanoid** - Compact, URL-friendly unique identifier generation
- **pg_trgm** - Fuzzy text search and similarity matching

## Usage

```bash
# Command for running Postgres 17 (latest)
docker run -d --name postgres-fe \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=p4ssw0rd \
  -v data:/var/lib/postgresql/data \
  ghcr.io/flessner/postgres-fe:17
```

```yaml
# Docker compose for running Postgres 17 (latest)
services:
  postgres:
    image: ghcr.io/flessner/postgres-fe:17
    container_name: postgres-fe
    ports:
      - "5432:5432"
    environment:
      POSTGRES_DB: postgres
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: p4ssw0rd
    volumes:
      - data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  data:
```

## Available Tags

- `latest`, `17` - PostgreSQL 17
- `16` - PostgreSQL 16  
- `15` - PostgreSQL 15
