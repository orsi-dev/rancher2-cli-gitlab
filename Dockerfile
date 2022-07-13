FROM lachlanevenson/k8s-kubectl:v1.23.3

# Install bash and gettext
# gettext includes envsubst, used for variable expansion in config files
RUN apk add --update bash gettext && rm -rf /var/cache/apk/*

# Download Rancher cli
RUN wget https://github.com/rancher/cli/releases/download/v2.4.9/rancher-linux-amd64-v2.4.9.tar.gz --no-check-certificate
# Unzip
RUN tar -xvzf rancher-linux-amd64-v2.4.9.tar.gz
# Make executable available
RUN ln -s /root/rancher-v2.4.9/rancher /usr/bin/rancher

ENTRYPOINT [ "/bin/bash", "-c" ]

CMD [ "rancher" ]
