FROM postgres:13

# Set environment variables
ENV POSTGRES_USER=user \
    POSTGRES_PASSWORD=password \
    POSTGRES_DB=mydatabase

# Create directories with OpenShift-compatible permissions
RUN mkdir -p /var/lib/postgresql/data && \
    mkdir -p /var/run/postgresql && \
    chmod -R 775 /var/lib/postgresql/data && \
    chmod -R 775 /var/run/postgresql && \
    chgrp -R 0 /var/lib/postgresql/data && \
    chgrp -R 0 /var/run/postgresql

# Copy initialization script
COPY init.sql /docker-entrypoint-initdb.d/

# Switch to non-root user context (matches OpenShift's random UID)
USER 1001

EXPOSE 5432
