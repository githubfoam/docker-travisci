NAME	= githufoam/nexus3
ALIAS	= nexus3
VERSION	= 3.19.1-01

all:	build tag_latest push

build:

	@echo "Build the current tag $(NAME):$(VERSION)"

	docker build 	--rm 	\
					--tag $(NAME):$(VERSION) \
					.

tag_latest:

	docker tag $(NAME):$(VERSION) $(NAME):latest

push:

	docker push $(NAME)
