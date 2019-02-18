all: miniconda

miniconda: Dockerfile 
	docker build . -t dhl88/miniconda

clean: Dockerfile 
	docker build . --no-cache -t dhl88/miniconda
