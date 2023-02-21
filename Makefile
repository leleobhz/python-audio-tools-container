.PHONY: podman

podman:
	podman build --tag python-audio-tools:latest .

podman-shell:
	podman run -it --rm --name python-audio-tools -v ./:/data --workdir=/data  localhost/python-audio-tools:latest
