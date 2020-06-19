.DEFAULT_GOAL := build
.EXPORT_ALL_VARIABLES:
env ?= .env
include $(env)

.PHONY:

help:
	@echo ''
	@echo 'Usage: make [TARGET] [EXTRA_ARGUMENTS]'

build:
	docker build --no-cache -f pipeline/Dockerfile -t $(APP_NAME) pipeline

run:
	# chmod 777 /path/to/Local_host_dir
	#docker run -d -v $(HOST_DIR):$(DOCKER_DIR) -p=$(HOST_PORT):$(CONTAINER_PORT) $(APP_NAME):$(TAG)
	docker run -d -ti --env-file=./.env --name=$(LICENSE_APP_NAME) $(LICENSE_APP_NAME)

stop:
	docker stop $(APP_NAME)

tag:
	docker tag $(APP_NAME) bspruth/$(APP_NAME):$(TAG)

save:
	docker save -o $(LICENSE_APP_NAME).tar $(LICENSE_APP_NAME)

execute:
	docker exec -ti $(LICENSE_APP_NAME) sh
