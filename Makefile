
VERSION10x = 10.0.0-0

push: push-10.x

push-10.x: build-10.x
	docker tag bryanherger/vertica:$(VERSION10x)_centos-7 bryanherger/vertica:10.x
	docker tag bryanherger/vertica:$(VERSION10x)_centos-7 bryanherger/vertica:latest
	docker push bryanherger/vertica:$(VERSION10x)_centos-7
	docker push bryanherger/vertica:10.x
	docker push bryanherger/vertica:latest

build: build-10.x

build-10.x:
	docker build --rm=true -f Dockerfile.centos.7_10.x \
	             --build-arg VERTICA_PACKAGE=vertica-$(VERSION10x).x86_64.RHEL6.rpm \
	             -t bryanherger/vertica:$(VERSION10x)_centos-7 .

clean:
	docker rm -v $(docker ps -a -q -f status=exited)
	docker rmi $(docker images -f "dangling=true" -q)
