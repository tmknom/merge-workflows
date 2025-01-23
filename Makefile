-include .makefiles/reusable-workflows/Makefile
.makefiles/reusable-workflows/Makefile:
	@git clone https://github.com/tmknom/makefiles.git .makefiles >/dev/null 2>&1

ACTDOCS ?= ghcr.io/tmknom/actdocs:latest
.PHONY: docs
docs: ## Generate documentation for README
	$(SECURE_DOCKER_RUN) $(ACTDOCS) inject --sort --file=docs/github-actions.md .github/workflows/github-actions.yml
