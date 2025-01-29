#!/bin/bash
set -e

# Only modify permissions (without ownership changes)
chmod 775 /var/lib/postgresql/data
chmod 775 /var/run/postgresql

echo "Permissions adjusted for PostgreSQL directories"
