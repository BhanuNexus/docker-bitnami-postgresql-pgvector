ARG PG_VERSION=16.3.0
ARG PG_MAJOR_VERSION=16
ARG PGVECTOR_VERSION=0.7.2

FROM pgvector/pgvector:$PGVECTOR_VERSION-pg$PG_MAJOR_VERSION AS builder

FROM bitnami/postgresql:$PG_VERSION

COPY --from=builder /usr/lib/postgresql/16/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/16/extension/vector* /opt/bitnami/postgresql/share/extension/