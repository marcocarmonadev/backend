start:
	@if [ $(shell git branch --show-current) = main ]; then \
		docker compose up \
		--build \
		--no-log-prefix; \
	else \
		echo "Error: switch to the 'main' branch to start."; \
	fi;
down:
	@if [ "$(shell docker ps -aq -f name=marcocarmonadev-backend-devcontainer)" ]; then \
		docker rm marcocarmonadev-backend-devcontainer; \
	fi
	@if [ "$(shell docker ps -aq -f name=marcocarmonadev-backend-database)" ]; then \
		docker rm marcocarmonadev-backend-database; \
	fi
	@docker compose down;