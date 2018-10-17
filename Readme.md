# Just Enough Kubernetes

Code Examples and basic app to deploy.



# Level 1

    kubectl create -f manifests/level-1/pod.yaml

https://cloud.docker.com/repository/docker/burningpony/just-enough-kubernetes/general

# Level 2

    kubectl create -f manifests/level-1/deployment.yaml

## Cut a new version

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment

    TAG=0.0.3
    docker build . -t burningpony/just-enough-kubernetes:release-$TAG
    docker push burningpony/just-enough-kubernetes:release-$TAG


## Start rollout for version

    kubectl set image deployment/just-enough-deployment just-enough-container=burningpony/just-enough-kubernetes:release-$TAG --record

# Level 3

    kubectl create -f manifests/level-3


## License
All Rights Reserved.
