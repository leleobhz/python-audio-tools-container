FROM python:3-alpine

WORKDIR /tmp

RUN apk --no-cache add tini bash make git gcc musl-dev mandoc man-pages pkgconfig linux-headers m4 libcdio libcdio-dev libcdio-paranoia libcdio-paranoia-dev alsa-lib alsa-lib-dev mpg123 mpg123-dev libpulse pulseaudio-dev lame lame-dev opus opus-dev opusfile opusfile-dev libvorbis libvorbis-dev wavpack wavpack-dev\
    && git clone --single-branch --depth=1 https://github.com/tuffy/libdvd-audio.git \
    && cd libdvd-audio \
    && make -j $(nproc) install PKG_CONFIG_DIR=/usr/local/lib/pkgconfig/ \
    && cd .. \
    && git clone --single-branch --depth=1 https://github.com/tuffy/python-audio-tools.git \
    && cd python-audio-tools \
    && python setup.py build -j $(nproc) \
    && python setup.py install \
    && cd docs \
    && make -j $(nproc) install \
    && cd /tmp \
    && rm -rf python-audio-tools libdvd-audio \
    && apk del make git gcc musl-dev mandoc man-pages pkgconfig linux-headers m4 libcdio-dev libcdio-paranoia-dev alsa-lib-dev mpg123-dev pulseaudio-dev lame-dev opus-dev opusfile-dev libvorbis-dev wavpack-dev

WORKDIR /data

VOLUME /data

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/bash"]
