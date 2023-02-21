# python-audio-tools-container

## Summary

This project builds a image to be used with python-audio-tools

## Requirement

* podman
* make

## How to use

```bash
cd ~
git clone https://github.com/leleobhz/python-audio-tools-container.git
cd python-audio-tools-container
make podman
cd ~/wherearemyaudiofiles
make -f ~/python-audio-tools-container/Makefile podman-shell
```

## Notes

* twolame is missing because Alpine does not have it packaged. Since there is not much usage for mp2, i've skipped it.
* Missing a generic make for pulseaudio passthrough, but not needed now.
