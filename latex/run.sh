docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /home/david/work:/work \
    --device /dev/snd \
    --name latex \
    dhl88/latex

#    -v /dev/snd:/dev/snd \ # for alsa audio
