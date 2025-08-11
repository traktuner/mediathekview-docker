# mediathekview-docker

Run MediathekView inside Docker. \
Based on the fabulous project [MediathekView](https://github.com/mediathekview/MediathekView)



## Recommended volume mountpoints

      "./config/:/config:rw"
      "./config/:/root:rw" # needed to keep settings permanent
      "<folder to store downloads>:/media:rw"

## Environment Variables

Environment variables can be set by adding one or more arguments `-e "<VAR>=<VALUE>"` to the `docker run` command, or in your docker-compose.yml.

| Variable       | Description                                  | Default |
|----------------|----------------------------------------------|---------|
|`UMASK`| Mask that controls how file permissions are set for newly created files. The value of the mask is in octal notation.  By default, this variable is not set and the default umask of `022` is used, meaning that newly created files are readable by everyone, but only writable by the owner. See the following online umask calculator: http://wintelguy.com/umask-calc.pl | (unset) |
|`TZ`| [TimeZone] of the container.  Timezone can also be set by mapping `/etc/localtime` between the host and the container. | `Etc/UTC` |
|`APP_NICENESS`| Priority at which the application should run.  A niceness value of -20 is the highest priority and 19 is the lowest priority.  By default, niceness is not set, meaning that the default niceness of 0 is used.  **NOTE**: A negative niceness (priority increase) requires additional permissions.  In this case, the container should be run with the docker option `--cap-add=SYS_NICE`. | (unset) |
|`USER_ID`| When mounting docker-volumes, permission issues can arise between the docker host and the container. You can pass the User_ID permissions to the container with this variable. | `1000` |
|`GROUP_ID`| When mounting docker-volumes, permission issues can arise between the docker host and the container. You can pass the Group_ID permissions to the container with this variable. | `1000` |
|`CLEAN_TMP_DIR`| When set to `1`, all files in the `/tmp` directory are deleted during the container startup. | `1` |
|`SECURE_CONNECTION`| When set to `1`, an encrypted connection is used to access the application's GUI (either via a web browser or VNC client). | `0` |
|`VNC_PASSWORD`| Password needed to connect to the application's GUI. | (unset) |
|`X11VNC_EXTRA_OPTS`| Extra options to pass to the x11vnc server running in the Docker container.  **WARNING**: For advanced users. Do not use unless you know what you are doing. | (unset) |
|`ENABLE_CJK_FONT`| When set to `1`, open-source computer font `WenQuanYi Zen Hei` is installed.  This font contains a large range of Chinese/Japanese/Korean characters. | `0` |

### Tags

| Tag | Description |
|-----|-------------|
| versioned | Versioned stable releases based on ubuntu 24.04 LTS |
| latest | Automatic build of the master branch (may be unstable) based on ubuntu 24.04 LTS |
| ubuntu24 | Automatic build of the master branch (may be unstable) based on ubuntu 24.04 LTS |

You can find the Docker image on GHCR: \
`docker pull ghcr.io/traktuner/mediathekview-docker:<tag>>`

## Ports

Here is the list of ports used by container.  They can be mapped to the host
via the `-p <HOST_PORT>:<CONTAINER_PORT>` parameter.  The port number inside the
container cannot be changed, but you are free to use any port on the host side.

| Port | Mapping to host | Description |
|------|-----------------|-------------|
| 5800 | Mandatory | Port used to access the application's GUI via the web interface. |
| 5900 | Optional | Port used to access the application's GUI via the VNC protocol.  Optional if no VNC client is used. |
