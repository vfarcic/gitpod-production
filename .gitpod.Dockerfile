FROM gitpod/workspace-full

# kubectl
RUN mkdir -p /home/gitpod/kubectl/bin/
RUN curl -Lo /home/gitpod/kubectl/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x /home/gitpod/kubectl/bin/kubectl
ENV PATH $PATH:/home/gitpod/kubectl/bin

# gcloud
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-320.0.0-linux-x86_64.tar.gz
RUN tar -xzvf google-cloud-sdk-320.0.0-linux-x86_64.tar.gz -C /home/gitpod/
RUN rm google-cloud-sdk-320.0.0-linux-x86_64.tar.gz
ENV PATH $PATH:/home/gitpod/google-cloud-sdk/bin/

# aws
RUN curl -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
RUN unzip awscliv2.zip
RUN mkdir -p /home/gitpod/aws/bin
RUN ./aws/install --install-dir /home/gitpod/aws --bin-dir /home/gitpod/aws/bin
RUN rm -rf awscliv2.zip
ENV PATH $PATH:/home/gitpod/aws/bin
