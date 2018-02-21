docker run \
    --rm  \
    -it  \
    -d   \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /home/david/cornell:/cornell \
    --device /dev/snd \
    --name latex \
    dhl88/latex
docker cp ./sty/davidnotes.sty  latex:/root/texmf/tex/latex/commonstuff/
docker cp ./sty/davidphys.sty   latex:/root/texmf/tex/latex/commonstuff/
docker cp ./sty/tikzfeynman.sty latex:/root/texmf/tex/latex/commonstuff/
docker cp ./scripts/embeddfonts latex:/usr/bin/
docker exec -it latex /bin/bash
docker stop latex

#    -v /dev/snd:/dev/snd \ # for alsa audio
