cd ../world-country-monitoring-deploy || exit

git pull
docker compose build
docker compose up -d