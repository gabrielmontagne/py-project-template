VERSION := 0.0.1
AUTHOR := Gabriel Montagné Láscaris-Comneno
AUTHOR_EMAIL := gabriel@tibas.london

.PHONY: stub
stub: docs README.rst

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

README.rst:
ifdef NAME
	echo $(NAME) > README.rst
	echo "=======================================" >> README.rst
	echo ":version:$(VERSION)" >> README.rst
	echo ":author:$(AUTHOR) $(AUTHOR_EMAIL)" >> README.rst
else
	$(error define NAME=project)
endif
