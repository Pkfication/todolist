#!/bin/bash
set -e

# Ensure we're in the project root
cd "$(dirname "$0")/.."

# Build Docker images
docker compose build

# Setup database
docker compose run --rm web bundle exec rails db:create
docker compose run --rm web bundle exec rails db:migrate

# Optional: Seed database
# docker-compose run --rm web bundle exec rails db:seed

echo "Application is ready to start. Run 'docker-compose up' to begin."