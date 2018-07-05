all: labpython

labpython: Dockerfile requirements.txt
	docker build . -t dhl88/labpython

clean: Dockerfile requirements.txt
	docker build . --no-cache -t dhl88/labpython
