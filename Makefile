.PHONY: clean clean-dist clean-lib clean-all dist zip local deps

default: clean clean-dist dist zip;

deps:
	pip install -r requirements.dev.txt
	pip install -r requirements.txt -t lib/

dist:
	test -d dist || mkdir dist
	cp -r src/* dist/
	cp -r lib/* dist/

zip: dist
	cd dist && zip -q -r dist.zip .

clean:
	find src/ -name \*.pyc -delete

clean-dist:
	rm -rf dist/*

clean-lib:
	rm -rf lib/*

clean-all: clean clean-dist clean-lib

local:
	python-lambda-local -l lib/ -t 3 src/main.py event/test.json
