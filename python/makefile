all: labpython

labpython: Dockerfile 
	docker build . -t dhl88/python

clean: Dockerfile 
	docker build . --no-cache -t dhl88/python
