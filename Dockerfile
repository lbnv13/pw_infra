FROM debian:11-slim
ARG helm_ver=3.10.0
ARG kubectl_ver=1.25.2

RUN apt update -y && apt install -y --no-install-recommends ca-certificates curl bash git wget docker.io unzip gettext-base \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN wget -q https://get.helm.sh/helm-v${helm_ver}-linux-amd64.tar.gz && tar -xvf helm-v${helm_ver}-linux-amd64.tar.gz \
    && rm helm-v${helm_ver}-linux-amd64.tar.gz && mv ./linux-amd64/helm /usr/local/bin/

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v${kubectl_ver}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i /usr/local -n
