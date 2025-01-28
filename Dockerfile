# Use the official PostgreSQL image as the base image
FROM postgres:13

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=mydatabase

# Copy the initialization script to the appropriate location
COPY init.sql /docker-entrypoint-initdb.d/