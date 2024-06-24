init: prod-nginx-link

default: start

### PRODUCTION COMMANDS
start:
	docker compose --env-file .env --file ./docker-compose.yaml up -d
rebuild:
	docker compose --env-file .env --file ./docker-compose.yaml up -d --build
restart:
	docker compose --env-file .env --file ./docker-compose.yaml up -d --force-recreate	
stop:
	docker compose --env-file .env --file ./docker-compose.yaml down

prod-nginx-link:
	ln -s ${shell pwd}/vhost.conf /etc/nginx/sites-enabled/dify.conf
	nginx -s reload
