# Use the official PostgreSQL image as the base image
FROM postgres:13

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=mydatabase

# Fix permissions issue by changing ownership during build
USER root
RUN mkdir -p /var/lib/postgresql/data /var/run/postgresql && \
    chown -R postgres:postgres /var/lib/postgresql /var/run/postgresql

# Switch back to the postgres user
USER postgres

# Copy the initialization script to the appropriate location
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL default port
EXPOSE 5432
