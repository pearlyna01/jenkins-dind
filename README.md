# Jenkins Docker with DinD
I made a jenkins Dockerfiles and a docker compose yaml file based on the [Installing Jenkins - Docker documentation](https://www.jenkins.io/doc/book/installing/docker/) as reference. These helps to setup a dind container for Jenkins and a Jenkins container.  
This setup allows the Jenkins container to create docker containers using dind (docker in docker). However, this is not recommended for production.  

**Feel free to try it out.**

### Steps
1. create jenkins docker network with the create_network.sh script
   - ```sh create_network.sh```
2. docker compose up the dind container and jenkins container 
   - ```docker compose -f jenkins-compose.yaml up -d```