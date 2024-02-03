DEV-SERVICE-NAME = dev
PROD-SERVICE-NAME = prod

build-dev:
	docker-compose -f docker-compose.yml up --build -d ${DEV-SERVICE-NAME}

stop:
	docker-compose -f docker-compose.yml stop ${DEV-SERVICE-NAME}

start:
	docker-compose -f docker-compose.yml start ${DEV-SERVICE-NAME}

.PHONY: add-%
add-%:
	docker-compose exec ${DEV-SERVICE-NAME} poetry add --group dev ${@:add-%=%}

build-prod:
	docker-compose -f docker-compose.yml build ${PROD-SERVICE-NAME}

run:
	docker-compose -f docker-compose.yml run --rm ${PROD-SERVICE-NAME} python -m production add 1 2

remove-dangling-images:
	docker rmi `docker images -f "dangling=true" -q`