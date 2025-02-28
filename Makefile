.PHONY: setup
setup:
	docker-compose build
	docker-compose run --rm app bin/setup

curdir := $(shell pwd)
app_name := $(shell basename ${curdir}_app_1)

.PHONY: up
up:
	docker-compose up -d
	docker attach ${app_name}

.PHONY: down
down:
	docker-compose down

.PHONY: console
console:
	docker-compose run --rm app bundle exec rails console

.PHONY: migrate
migrate:
	docker-compose run --rm app bundle exec rails db:migrate

.PHONY: bundle-install
bundle-install:
	docker-compose run --rm app bundle install

.PHONY: annotate
annotate:
	docker-compose run --rm app bundle exec annotate

.PHONY: seed
seed:
	docker-compose run --rm app bundle exec rails db:seed_fu

.PHONY: test
test:
	docker-compose run --rm test bundle exec guard --no-bundler-warning --no-interactions

.PHONY: test-all
test-all:
	docker-compose run --rm test bundle exec rspec

.PHONY: seed-test
seed-test:
	docker-compose run --rm test bundle exec rails db:seed_fu

.PHONY: attach
attach:
	docker attach ${app_name}

.PHONY: migrate-reset
reset:
	docker-compose run --rm app bundle exec rails db:migrate:reset

.PHONY: set-development
set:
	docker-compose run --rm app bundle exec rails db:environment:set RAILS_ENV=development

.PHONY: guard
guard:
	docker-compose run --rm app bundle exec guard --no-bundler-warning --no-interactions
