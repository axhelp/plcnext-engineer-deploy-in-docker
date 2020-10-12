# Deploy PLCnext program in Docker container

## Build docker image using files from local device

- Build and download project files with PLCnext Engineer to local device
- Copy all files from directory `/opt/plcnext/projects/PCWE` using SFTP

```
rm -rf ./projects/PCWE
scp -r admin@192.168.1.10:/opt/plcnext/projects/PCWE ./projects

```

- Build docker image and push to Docker registry

```
# Use semantic versioning as a :tag, e.g. :1.0.0
docker buildx build --platform linux/arm/v7 -t registry.hub.docker.com/device-program:tag  .
docker push registry.hub.docker.com/device-program:tag

```

## Balena engine / Docker installation on remote device

Follow [instructions](https://github.com/PLCnext/Docker_GettingStarted)

## Login via SSH and run Docker container on remote device

- Login via ssh

```
ssh admin@192.168.1.10
```

- Login via SSH, pull Docker image and run container

```
# Login to private Docker registry, e.g. registry.hub.docker.com
balena-engine login registry.hub.docker.com

# Use semantic versioning as a :tag, e.g. :1.0.0
balena-engine run \
    -it \
    --rm \
    -v /opt/plcnext/projects:/opt/plcnext/projects \
    registry.hub.docker.com/device-program:tag

```

- Restore files permissions and restart `plcnnext` service

```
chmod +x /opt/plcnext/projects/restore-permissions.sh
chmod +x /opt/plcnext/projects/restart.sh
. /opt/plcnext/projects/restore-permissions.sh
. /opt/plcnext/projects/restart.sh

```
