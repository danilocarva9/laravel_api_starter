run-app-dev: validate-params
	cp ./src/.env.example ./src/.env
	docker-compose -f docker-compose-dev.yml up --build -d
	docker exec php /bin/sh -c "composer install && chmod -R 777 storage && php artisan key:generate && php artisan migrate"

validate-params:
ifndef DATABASE
$(error DATABASE is not set)
endif

ifndef USERNAME
$(error USERNAME is not set)
endif

ifndef PASSWORD
$(error PASSWORD is not set)
endif