# Use the official PostgreSQL image as the base image
FROM postgres:13

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=mydatabase

# Copy the initialization script to the appropriate location
# This will automatically run during the container initialization
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL default port
EXPOSE 5432
