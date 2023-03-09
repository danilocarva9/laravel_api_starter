run-app-dev:
	cp ./src/api-gateway/.env.example ./src/api-gateway/.env
	docker-compose -f docker-compose-dev.yml up --build -d --scale nginx=3
	docker exec api-gateway /bin/sh -c "composer install && chmod -R 777 storage && php artisan key:generate && php artisan migrate"