-include .env

init-env:
	cp .env.example .env
	cd .. && cat controlplane/.env.example | sed "s|WORKSPACE_ROOT_FOLDER|$$PWD|g" > controlplane/.env

dev:
	docker-compose \
	-f ${MEMIXIT_API_PATH}/docker-compose.yml \
	-f ${MEMIXIT_WEB_APP_PATH}/docker-compose.yml \
	--env-file ./.env \
	-p 'memixit' \
	up