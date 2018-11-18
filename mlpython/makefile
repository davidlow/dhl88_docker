all: mlpython

mlpython: Dockerfile requirements.txt requirements2.txt
	docker build . -t dhl88/mlpython

clean: Dockerfile requirements.txt requirements2.txt
	docker build . --no-cache -t dhl88/mlpython
