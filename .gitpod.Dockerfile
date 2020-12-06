FROM gitpod/workspace-full

RUN mkdir -p /home/gitpod/kubectl/bin/
RUN curl -Lo /home/gitpod/kubectl/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x /home/gitpod/kubectl/bin/kubectl
ENV PATH $PATH:/home/gitpod/kubectl/bin