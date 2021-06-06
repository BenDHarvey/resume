SHELL := /bin/bash

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

export: ## Export to pdf
	emacs -u "$(id -un)" --batch --eval '(load user-init-file)' resume.org -f org-latex-export-to-pdf
