IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

deploy-graylog :
	bash scripts/deploy-graylog.sh

deploy-elk :
	bash scripts/deploy-elk.sh

deploy-influxdb :
	bash scripts/deploy-influxdb.sh

deploy-icinga-dist:
	bash scripts/deploy-icinga-dist.sh

deploy-icinga-standalone:
	bash scripts/deploy-icinga-standalone.sh

build-powerdns:
	bash scripts/build-powerdns.sh

deploy-debian-buster:
	bash scripts/deploy-debian-buster.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

deploy-microservices:
	bash scripts/deploy-microservices.sh

build-images:
	bash scripts/build-images.sh
	
push-image:
	docker push $(IMAGE)

.PHONY: deploy-libvirt deploy-vagrant deploy-packer deploy-terraform push-image
