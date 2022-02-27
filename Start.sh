# Get sudo working
sudo -l 

# update packages and their version
sudo apt-get update && sudo apt-get upgrade -y

# install curl and apt-transport-https
sudo apt-get update && sudo apt-get install -y apt-transport-https curl

# add key to verify releases
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# add kubernetes apt repo
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# install kubelet, kubeadm and kubectl
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# install docker
sudo apt-get install docker.io

# apt-mark hold is used so that these packages will not be updated/removed automatically
sudo apt-mark hold kubelet kubeadm kubectl

#install helm v3
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

#install kind 
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind

sudo apt-get install jq make
