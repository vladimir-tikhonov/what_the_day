setup-dev:
	docker-compose pull
	docker-compose build
	docker-compose run --rm website npm install --quiet
	docker-compose run --rm backend mix deps.get
	docker-compose run --rm backend mix ecto.setup
	docker-compose run --rm backend mix db.sync

start:
	docker-compose up

stop:
	docker-compose down

build-ci:
	docker-compose run --rm website npm run build
	docker-compose run --rm website npm run eslint
	docker-compose run --rm website npm run sass-lint
	docker-compose run --rm backend mix compile --warnings-as-errors
	docker-compose run --rm backend mix dogma
	docker-compose run --rm backend mix test

connect-dev-db:
	docker-compose run --rm postgres psql -h postgres -U postgres

backend-console:
	docker-compose run --rm backend iex -S mix

backend-test:
	docker-compose run --rm backend mix test
