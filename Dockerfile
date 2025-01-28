FROM postgres:13

# Set environment variables
ENV POSTGRES_USER=user \
    POSTGRES_PASSWORD=password \
    POSTGRES_DB=mydatabase \
    # Force group ID to match OpenShift's random UID requirements
    POSTGRES_GROUP_ID=999

# Create necessary directories with correct permissions upfront
RUN mkdir -p /var/run/postgresql && \
    chmod 775 /var/run/postgresql && \
    chgrp ${POSTGRES_GROUP_ID} /var/run/postgresql && \
    mkdir -p /var/lib/postgresql/data && \
    chmod 775 /var/lib/postgresql/data && \
    chgrp ${POSTGRES_GROUP_ID} /var/lib/postgresql/data

# Copy initialization files
COPY init.sql /docker-entrypoint-initdb.d/
COPY fix-permissions.sh /docker-entrypoint-initdb.d/

# Ensure scripts are executable
RUN chmod +x /docker-entrypoint-initdb.d/fix-permissions.sh

# Drop root privileges
USER postgres

EXPOSE 5432
