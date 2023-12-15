cd /home/ubuntu/test_project &&
docker volume prune --force &&
sudo apt-get update &&
sudo apt-get install docker-compose &&
COMPOSE_HTTP_TIMEOUT=200  docker-compose -f docker_compose_prod.yml up -d