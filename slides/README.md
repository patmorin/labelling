This directory contains slides for a talk about this paper as well as the audio (audacity) and video (flowblade) files that were used to make a ~20 minute talk for FOCS 2020.


- You need to run `make` here to create the image files in `video-images/` (see extra information below)
- `audio/voice-over.aup` is an audacity file that needs to be exported to create `audio/voice-over.wav`
- Once the images and audio files are made, you can open `video.flb` with flowblade to render the movie.


In order for ipe to compile figures, ods-figs.sty should be included in your texpath. On my system (Ubuntu), I put it here:

    ~/.texlive2019/texmf-var/tex/latex/ods/ods-figs.sty

I think anywhere under ~/.texlive2019 would work.

I also ran

    texhash ~/.texlive2019

I don't know if that was necessary.
