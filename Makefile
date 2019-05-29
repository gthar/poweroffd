ver = 1.0
progname = poweroffd
user = poweroffd
pin = 17

py_ver = 3.7
py_interpreter = which python$(py_ver)
env = env
service_dir = .

service = $(progname).service
src = $(progname).py
setup = setup.py
service_template = $(service).jinja2

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
	render_jinja $(service_template) --output $(service_dir)/$(service) \
		env=$(env) \
		user=$(user) \
		pin=$(pin)

.PHONY: clean
clean:
	`$(py_interpreter)` setup.py clean --all
