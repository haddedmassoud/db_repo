#!/bin/bash
set -e

# Start PostgreSQL in the background
exec "$@" &
PID=$!

# Wait for PostgreSQL to start
until psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c '\q'; do
  echo "PostgreSQL is starting up..."
  sleep 1
done

echo "PostgreSQL is up and running!"

# Keep the container running
wait $PID