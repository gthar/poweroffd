ver = 1.0
progname = poweroffd

py_ver = 3.7
py_interpreter = which python$(py_ver)
env = env

src = $(progname).py
setup = setup.py

pkg = dist/$(progname)-$(ver).tar.gz

.DEFAULT_GOAL := $(pkg)

$(pkg): $(src) $(setup)
	`$(py_interpreter)` setup.py sdist

$(env):
	virtualenv -p `$(py_interpreter)` $(env)

.PHONY: install
install: $(pkg) $(env)
	. $(env)/bin/activate; \
	pip install $(pkg)

.PHONY: clean
clean:
	`$(py_interpreter)` setup.py clean --all
