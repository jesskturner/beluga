.PHONY: build
build:
	docker-compose -f docker-compose.yml build && \
	echo "Completed build."

.PHONY: destroy
destroy:
	docker-compose -f docker-compose.yml kill && \
	docker-compose -f docker-compose.yml rm -f && \
	echo "Destroyed."

.PHONY: eslint
eslint:
	node_modules/eslint/bin/eslint.js --ext .jsx,.js beluga/static && \
	echo "Completed linting."

.PHONY: flake8
flake8:
	flake8 . --config=setup.cfg --exit-zero && \
	echo "Completed style check."

.PHONY: kill
kill:
	docker-compose -f docker-compose.yml kill && \
	echo "Killed."

.PHONY: pip_compile
pip_compile:
	pip-compile requirements/requirements.in && \
	echo "Compiled Python requirements."

.PHONY: pytest
pytest:
	docker-compose -f docker-compose.yml exec beluga /bin/bash -c \
	'pytest --cache-clear -vv --disable-pytest-warnings --tb=long --color=yes'

.PHONY: run
run:
	docker-compose -f docker-compose.yml up -d && \
	docker-compose -f docker-compose.yml \
	exec beluga /bin/bash -c 'sanic-admin application.py'

.PHONY: webpack
webpack:
	docker-compose -f docker-compose.yml exec beluga /bin/bash -c \
	'node_modules/webpack/bin/webpack.js --config webpack.config.js --mode development --watch --progress --reporter'

.PHONY: yarn
yarn:
	docker-compose -f docker-compose.yml exec beluga /bin/bash -c \
	'yarn --no-progress --no-color'
