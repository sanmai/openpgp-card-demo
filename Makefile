all: build
	docker run -d -t --tty --rm --name openpgp openpgp
	docker exec --user pgpcard --workdir /home/pgpcard -it openpgp /bin/bash || true
	docker kill openpgp

build:
	docker build --tag openpgp .

clean:
	docker kill openpgp
