
# About this Repo

This is the Docker image for [XBackBone](https://github.com/SergiX44/XBackBone) ~ based on webdevops/php-nginx.

# Supported tags and respective `Dockerfile`
-	[`dev` (*dev/src/Dockerfile*)](https://github.com/Pe46dro/XBackBone-docker/tree/dev)

# Quick reference

-	**Where to file issues**:  
	[https://github.com/Pe46dro/XBackBone-docker/issues](https://github.com/Pe46dro/XBackBone-docker/issues)

-	**Supported architectures**: `amd64`

-	**Supported Docker versions**:  
	[the latest release](https://github.com/docker/docker-ce/releases/latest) (down to 1.6 on a best-effort basis)

# How to use this image

You can use the following command to start the container and map the ports to the host:

```console
$ docker run -p 80:80 \
		-e URL=http:\/\/127.0.0.1 \
		--name xbb \
		pe46dro/xbackbone-docker
```

## Container shell access
Nginx erver log is available through Docker's container log:

```console
$ docker logs xbb
```

## Environment Variables
When you start this image, you can adjust the configuration by passing one or more environment variables on the `docker run` command line.

### `URL`
This will specify the app url, slashes need to be escaped like follow
`-e URL=http:\/\/127.0.0.1`

### `GENERATE_RELEASE=TRUE` *dev-only*
If set, this environment variable will generate a release zip and will place it on `srv/xbb/storage`

## Build Args Variables
When you build the image yourself, you can adjust the version using the `--build-arg variable=value` parameter on the `docker build` command line.

### `XBACKBONE_VERSION`
You can specify the tag from [XBackBone](https://github.com/SergiX44/XBackBone/releases) release and download the desired one

## Where to Store Data
### Available mount point
*	/app/storage
*	/app/resources/database
*	/app/logs

### Permissions
The folder on host system need to have both **UID** and **GID** *1000*

#### Example
```bash 
mkdir -p /srv/xbb/storage
mkdir -p /srv/xbb/database
mkdir -p /srv/xbb/logs

chown -R 1000:1000 /srv/xbb
```
# Mantainer
 * [Pe46dro](https://github.com/Pe46dro) - Creator

# License

View [license information](LICENSE) for the software contained in this image.