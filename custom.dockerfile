# base starter
ARG OS_IMAGE=ubuntu:16.04
FROM $OS_IMAGE
MAINTAINER githubfoam

ENTRYPOINT ["/bin/ping"]
CMD ["ping"]
