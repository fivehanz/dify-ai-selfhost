default: start

init: prod-nginx-link squid-volume-link

### PRODUCTION COMMANDS
start:
	docker compose --env-file .env --file ./docker-compose.yaml up -d
rebuild:
	docker compose --env-file .env --file ./docker-compose.yaml up -d --build
restart:
	docker compose --env-file .env --file ./docker-compose.yaml up -d --force-recreate	
stop:
	docker compose --env-file .env --file ./docker-compose.yaml down

squid-volume-link:
	ln -s ${shell pwd}/squid.conf /opt/apps/persistence/dify/ssrf_proxy/squid.conf

prod-nginx-link:
	ln -s ${shell pwd}/vhost.conf /etc/nginx/sites-enabled/dify.conf
	nginx -s reload
