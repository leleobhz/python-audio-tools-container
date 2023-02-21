.PHONY: podman

podman:
	podman build --tag python-audio-tools:latest .

podman-shell:
	podman run --privileged -it --rm --name python-audio-tools -v ./:/data --workdir=/data  localhost/python-audio-tools:latest
