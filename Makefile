.DEFAULT_GOAL := help

.PHONY: help up down logs ps

help: ## Muestra los comandos disponibles
	@echo "Comandos disponibles:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

local: ## Levantar la base de datos
	@docker compose up -d

clean: ## Parar los contenedores
	@docker compose down

logs: ## Ver logs de postgres
	@docker compose logs -f db

ps: ## Ver que está corriendo
	@docker compose ps