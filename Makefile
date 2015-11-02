.PHONY: clean clean-dist clean-lib clean-all dist zip local dev lib

default: clean clean-dist dist zip;

dev:
	pip install -r requirements.dev.txt

lib:
	pip install -r requirements.txt -t lib/

dist: lib
	test -d dist || mkdir dist
	cp -r src/* dist/
	cp -r lib/* dist/ || echo

zip: dist
	cd dist && zip -x .gitignore -q -r dist.zip .

clean:
	find src/ -name \*.pyc -delete

clean-dist:
	rm -rf dist/*

clean-lib:
	rm -rf lib/*

clean-all: clean clean-dist clean-lib;

local:
	python-lambda-local -l lib/ -t 3 src/main.py event/test.json
