all: build
	docker run -d -t --tty --rm --name openpgp openpgp
	docker exec -it openpgp /bin/bash
	docker kill openpgp

build:
	docker build --tag openpgp .

