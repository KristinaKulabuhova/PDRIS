FROM jenkins/jenkins:latest
# if we want to install via apt
USER root
RUN apt-get update
RUN apt-get -y install git build-essential cmake make zlib1g-dev \
  libreadline-dev libncurses5-dev libssl-dev libunwind-dev libicu-dev \
  python3 python3-yaml python3-six python3-gevent git
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
RUN chmod +x ./kind
RUN mv ./kind /usr/local/bin/kind
RUN apt-get -y install docker.io
