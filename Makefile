setup-dev:
	docker-compose pull
	docker-compose build
	docker-compose run --rm website npm install --quiet
	docker-compose run --rm backend mix deps.get
	docker-compose run --rm backend mix ecto.setup

start:
	docker-compose up

build-ci:
	docker-compose run --rm website npm run build
	docker-compose run --rm website npm run eslint
	docker-compose run --rm website npm run sass-lint
	docker-compose run --rm backend mix test

connect-dev-db:
	docker-compose run --rm postgres psql -h postgres -U postgres

backend-console:
	docker-compose run --rm backend iex -S mix
