VERSION := 0.0.1
AUTHOR := Gabriel Montagné Láscaris-Comneno
AUTHOR_EMAIL := gabriel@tibas.london
YEAR := $(shell date +%Y)



.PHONY: stub
stub: docs README.rst stub-license stub-setup


init:
	pip3 install -r requirements.txt


test:
	nosetests




.PHONY: stub-license
stub-license:
	@sed -i 's/\[+author+\]/$(AUTHOR) <$(AUTHOR_EMAIL)>/g' LICENSE
	@sed -i 's/\[+year+\]/$(YEAR)/g' LICENSE

.PHONY: stub-setup
stub-setup: name
	@sed -i 's/\[+author+\]/$(AUTHOR)/g' setup.py
	@sed -i 's/\[+name+\]/$(NAME)/g' setup.py
	@sed -i 's/\[+email+\]/$(AUTHOR_EMAIL)/g' setup.py
	@sed -i 's/\[+version+\]/$(VERSION)/g' setup.py

docs: name
	sphinx-quickstart \
		-p "$(NAME)" \
		-v $(VERSION) \
		--makefile \
		--batchfile \
		-r $(VERSION) \
		-a "$(AUTHOR)" \
		docs

README.rst: name
	@echo $(NAME) > README.rst
	@echo "=======================================" >> README.rst
	@echo ":version:$(VERSION)" >> README.rst
	@echo ":author:$(AUTHOR) $(AUTHOR_EMAIL)" >> README.rst

.PHONY: name
name:
ifdef NAME
	@echo project name $(NAME)
else
	$(error define NAME=project)
endif
