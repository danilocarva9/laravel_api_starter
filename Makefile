run-app-dev:
	cp ./src/api/.env.example ./src/api/.env
	docker-compose -f docker-compose-dev.yml up --build -d
	docker exec api /bin/sh -c "composer install && chmod -R 777 storage && php artisan key:generate && php artisan migrate"