**Repository of deploy process, with Docker containers.**

1. Start local. This command get repositories frontend and backend, 
build it and start, also it create postgres DB with all migrations.

```bash 
docker-compose up --build 
```

2. First start on server.
Connect to server via SSH and run commands. 
 - git clone https://github.com/world-country-monitoring-deploy.git
 - cd world-country-monitoring-deploy
 - add file my-secrets.env in project root and secrets inside file
 - docker-compose up --build