# 20180124
# as root - because of the logout that would be required after the docker user set
#curl https://releases.rancher.com/install-docker/1.12.sh | sh
curl https://releases.rancher.com/install-docker/17.03.sh | sh
# when running as non-root (ubuntu) run the following and logout/log back in
sudo usermod -aG docker ubuntu
docker run -d --restart=unless-stopped -p 8880:8080 --name rancher_server rancher/server:v1.6.14
# no Kubernetes 1.9.0 yet
#curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
mkdir ~/.kube
wget http://storage.googleapis.com/kubernetes-helm/helm-v2.8.0-linux-amd64.tar.gz
tar -zxvf helm-v2.8.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm

# pending create of client host
# see https://wiki.onap.org/display/DW/ONAP+on+Kubernetes#ONAPonKubernetes-Registeryourhost
# pending token and paste to
#vi ~/.kube/config
echo "run the following after attaching the host"
echo "helm init --upgrade"
#helm init --upgrade
