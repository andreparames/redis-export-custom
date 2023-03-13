default: check
check:
	pycodestyle redisexport/
	pylint redisexport/
clean:
	rm -rf dist/*
build: clean
	python3 -m build
test-upload:
	python3 -m twine upload --repository testpypi dist/*
upload:
	python3 -m twine upload dist/*
.PHONY: default check clean build test-upload upload
