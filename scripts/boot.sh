cd /home/ubuntu/test_project &&
docker volume prune --force &&
COMPOSE_HTTP_TIMEOUT=200  docker-compose -f docker_compose_prod.yml up -d