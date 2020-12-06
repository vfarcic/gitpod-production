mkdir -p ~/.kube
echo $KUBECONFIG_CONTENT | base64 --decode | tee ~/.kube/config

export REPO_URL=$(git config --get remote.origin.url)
cat apps.yaml | sed -e "s@CHANGE_ME_REPO@$REPO_URL@g" | tee apps.yaml

kubectl apply --filename project.yaml
kubectl apply --filename apps.yaml