FROM $OS_IMAGE
MAINTAINER githubfoam

ENTRYPOINT ["/bin/ping"]
CMD ["ping"]
