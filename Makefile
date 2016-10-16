setup-dev:
	docker-compose pull
	docker-compose build
	docker-compose run --rm website npm install --quiet

start:
	docker-compose up

build-ci:
	docker-compose run --rm website npm run build
	docker-compose run --rm website npm run eslint
	docker-compose run --rm website npm run sass-lint
