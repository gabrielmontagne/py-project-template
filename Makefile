VERSION := 0.0.1
AUTHOR := Gabriel Montagné Láscaris-Comneno

.PHONY: stub
stub: docs

docs:
ifdef NAME
	sphinx-quickstart \
		-p "$(NAME)" \
		-v $(VERSION) \
		--makefile \
		--batchfile \
		-r $(VERSION) \
		-a "$(AUTHOR)" \
		docs
else
	$(error define NAME=project)
endif
