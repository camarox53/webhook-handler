# Webhook Handler - [![MergeToMaster][m2m-badge]][m2m] [![MergeToMaster][build-badge]][docker-build]


[m2m-badge]:    https://img.shields.io/badge/M2M-mergetomaster.com-orange
[build-badge]:  https://img.shields.io/docker/cloud/build/cmorris/webhook-handler
[m2m]:          http://mergetomaster.com
[docker-build]: https://github.com/camarox53/webhook-handler/actions/workflows/build.yaml


Webhook handler is a basic webhook handling service designed to 
make setting up webhooks as simple as possible. This is a docker 
container for the [Webhook]: https://github.com/adnanh/webhook project. 

Check out our tutorial video on Youtube at: https://www.youtube.com/channel/UCHt0upg2ZCNeY9GZoIgsKvw



## How To Run This Container: 

1. Install Docker  
```sh
$ sudo apt update && sudo apt install docker.io -y 
```

2. Start Docker Daemon 
```sh
$ sudo systemctl start docker 
```

3. Add User To Docker Group
```sh
$ sudo usermod -aG docker $(whoami)
```

3. Reboot
```sh
$ sudo reboot
```

4. Clone Down Webhook-Hanlder Container 
```sh
$ docker pull cmorris/webhook-handler:latest
```

5. Start Container 
```sh
$ docker run cmorris/webhook-handler:latest -d 
```


## Optional Parameters: 

Common Optional Parameters for Docker Run Command: 
* `-p 8080:80` Uses port `8080` for the webhook service on the host machine rather 
  than 80. Change `8080` to whatever port you want to use on the host. 

* `-v test/:/data` Mounts a directory called `test` in your current working directory 
  to into the container at `/data` (location of the hook.json file). This can be used to 
  inject a custom hooks.json file into the container. 

## Exec'ing Into The Container

To Exec Into The Container:
1. Execute the docker run command in step 3 above. 

2. Note the Container ID of the webhook container
```sh
$ docker ps
```

3. Execute The Exec Command:  
```sh
$ docker exec -it <CONTAINER_ID HERE> /bin/bash
```


