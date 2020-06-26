IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

build-deploy-microservices:
	bash scripts/build-deploy-microservices.sh
build-images:
	bash scripts/build-images.sh
push-image:
	docker push $(IMAGE)

.PHONY: deploy-libvirt deploy-vagrant deploy-packer deploy-terraform push-image
