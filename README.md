# Everon Assignment
Readme.md contains prerequisits on how to setup the environment, and information on how to add additional microservices helm charts.

## Prerequisits
- Google Authentication/Credentials  
```brew cask install google-cloud-sdk```
- credentials.json file in the repository root.
- Terraform 12  
```brew install terraform```
- Helm 3 
```brew install helm```

## Infrastructure default values
Open [terraform.tfvars](k8s-cluster/terraform.tfvars) and change the values according to the needs.

## Infrastructure commands
Change directory to k8s-cluster
```bash

# Install terraform providers
terraform init

# Check for infrastructure deployment/changes
terraform plan

# Deploy infrastructure
terraform apply
```

## Microservice - Helm charts

Helm is used to generate the skeleton for the microservices. This could also be done through Terraform as shown in [helm.tf](k8s-cluster/helm.tf).

Decision is made to generate this outside of terraform using Helm as in my experience Developers should be able to make changes. These files charts are also stored outside of the gitrepo on dockerhub, artifactory or similar tools.

### Create new microservice

Change to the root of the repository
```bash
helm create <service name>
```

Open [values.yaml](k8s-charts/nginxdemos-hello/values.yaml) and provide image name:
```bash
repository: nginxdemos/hello:latest
```

Additional changes made, 
- Change service type to NodePort.
- Enabled ingress, change value to true.

Open [deployment.yaml](k8s-charts/nginxdemos-hello/templates/deployment.yaml) and add deployment strategie:
```bash
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 1
```

Open [values.yaml](k8s-charts/nginxdemos-hello/values.yaml) and define resources limnit:
```bash
resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
```
