docker run \
    --rm  \
    -it \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -e PYTHONPATH="/kaggle" \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /home/david/kaggle:/kaggle \
    --name mlpython \
    dhl88/mlpython
