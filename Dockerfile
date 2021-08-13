FROM ubuntu
RUN sudo apt-get -y update
RUN sudo apt-get -y dist-upgrade
RUN sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN sudo apt-get update
RUN sudo apt-get install -y docker-ce docker-ce-cli containerd.io
RUN sudo usermod -aG docker $(whoami)
RUN sudo apt-get install -y jq
RUN COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
RUN sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose