run-app-dev:
	cp ./src/.env.example ./src/.env
	docker-compose -f docker-compose-dev.yml up --build -d
	docker exec php /bin/sh -c "composer install && chmod -R 777 storage && php artisan key:generate && php artisan migrate"