# jenkins-extended
Official jenkins with some additions : 
- several plugins automatically installed (see plugins.txt file)
- fix (temporary) for https://issues.jenkins-ci.org/browse/JENKINS-31089 issue
- docker and docker-compose are preinstalled
  - just set DOCKER_HOST env var to the right value to allow this jenkins to control the docker daemon
    (if docker is configured in an insecure way of course)

