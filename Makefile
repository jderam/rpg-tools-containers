SHELL := bash
.DEFAULT_GOAL := help
OS := $(shell uname)

.PHONY: help build run deploy stop test format gen-requirements


gen_requirements_txt: ## Generate a new requirements.txt file
	pip-compile requirements.in > requirements.txt

run_test_uvicorn: ## Run fastapi/uvicorn test server
	uvicorn main:app --reload

d_build: ## Build the docker container
	# docker rm rpg-tools
	docker build -t rpg-tools-app .

d_run: ## Run the docker container
	docker run --name rpg-tools --detach --rm --publish 8000:8000 rpg-tools-app

d_build_and_run: d_build d_run ## build AND run!!!

d_stop: ## Stop running docker container
	docker stop rpg-tools

help: ## Generate and display help info on make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
