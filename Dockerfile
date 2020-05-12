FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get install -y docker-ce-cli && \
   apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y gcc g++ make && \
    apt-get install -y nodejs && \
    apt-get clean

# drop back to the regular jenkins user - good practice
USER jenkins