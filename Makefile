.PHONY: all
all: build
	docker run -d -t --tty --rm --name openpgp openpgp || touch Dockerfile
	docker exec --user pgpcard --workdir /home/pgpcard -it openpgp /bin/bash || true
	docker kill openpgp

.PHONY: build
build: Makefile

.PHONY: clean
clean:
	docker kill openpgp


Makefile: Dockerfile start.sh build.sh gpg.conf
	docker build --tag openpgp .
	touch Makefile
