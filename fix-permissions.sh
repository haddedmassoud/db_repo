#!/bin/bash
set -e

# Fix permissions for PostgreSQL data directory
chown -R postgres:postgres /var/lib/postgresql/data
chmod -R 750 /var/lib/postgresql/data

echo "Permissions fixed for /var/lib/postgresql/data"
