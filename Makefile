.PHONY: build
build:
	docker-compose -f docker-compose.yml build && \
	echo "Completed build."

.PHONY: flake8
flake8:
	flake8 . --config=setup.cfg --exit-zero && \
	echo "Completed style check."

.PHONY: pip_compile
pip_compile:
	pip-compile requirements/requirements.in && \
	echo "Compiled Python requirements."

.PHONY: kill
kill:
	docker-compose -f docker-compose.yml kill && \
	echo "Killed."

.PHONY: destroy
destroy:
	docker-compose -f docker-compose.yml kill && \
	docker-compose -f docker-compose.yml rm -f && \
	echo "Destroyed."

.PHONY: pytest
pytest:
	docker-compose -f docker-compose.yml exec beluga /bin/bash -c \
	'pytest --cache-clear -vv --disable-pytest-warnings --tb=long --color=yes'

.PHONY: run
run:
	docker-compose -f docker-compose.yml up -d && \
	docker-compose -f docker-compose.yml \
	exec beluga /bin/bash -c 'sanic-admin application.py'
