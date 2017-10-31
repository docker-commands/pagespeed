VERSION = 1.0.0
ORGANIZATION=docker-commands
REPOSITORY=pagespeed
PORT=80

all: build
  
build: Dockerfile
	docker build -t ${ORGANIZATION}/${REPOSITORY}:${VERSION} .

push:
	#docker push ${ORGANIZATION}/${REPOSITORY}:${VERSION}
	git add Dockerfile
	git push origin ${VERSION}

shell: build
	docker run --name ${REPOSITORY} -it --rm ${ORGANIZATION}/${REPOSITORY}:${VERSION} /bin/sh

run: build
	docker run --name ${REPOSITORY} --rm ${ORGANIZATION}/${REPOSITORY}:${VERSION}
