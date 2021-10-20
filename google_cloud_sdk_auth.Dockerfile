### Pre-install yum stuff
FROM fedora:latest as dnf-install

# Replace version with a version number to pin a specific version (eg: "-123.0.0")
ARG GCLOUD_VERSION=

# install gcloud-cli
RUN mkdir -p /gcloud/bin
WORKDIR /gcloud
COPY utils/dockerfile_assets/google-cloud-sdk.repo /etc/yum.repos.d/

# Install packages
# These packages will end up in the final image
# Installed here to save build time
RUN yum --assumeyes install \
    google-cloud-sdk${GCLOUD_VERSION} \
    && yum clean all;

# Cleanup Home Dir
RUN rm /root/anaconda* /root/original-ks.cfg

WORKDIR /root

VOLUME ["/root/.config/gcloud/"]

