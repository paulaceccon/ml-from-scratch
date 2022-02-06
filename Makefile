# === COMMANDS ================================================================
# Installs the Python dependencies
install:
	pip3 install -r requirements.txt

# Installs the dev Python dependencies
install-dev:
	echo "Installing DEV dependencies"
	pip3 install -e ".[dev]"

# Downloads the Python dependencies
download:
	pip3 download -r requirements.txt

# Downloads the dev Python dependencies
download-dev:
	echo "Installing DEV dependencies"
	pip3 download ".[dev]"


# === DEPENDENCIES ============================================================
# Locks the dependency file (from setup.py)
freeze:
	CUSTOM_COMPILE_COMMAND="make freeze" pip-compile --no-annotate --no-emit-index-url --output-file requirements.txt setup.py --cache-dir /tmp/pip-compile-cache

# Upgrades the dependencies lock file
freeze-upgrade:
	CUSTOM_COMPILE_COMMAND="make freeze" pip-compile --no-annotate --no-emit-index-url --output-file requirements.txt --upgrade setup.py --cache-dir /tmp/pip-compile-cache
