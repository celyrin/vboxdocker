# vboxdocker
This Docker container includes VirtualBox, allowing you to run VirtualBox inside a container using Docker.

## Prerequisites

Before running this container, ensure you have Docker installed on your system. You also need to ensure that VirtualBox is installed on the host system and the necessary kernel modules (`vboxdrv`) are loaded.

## Running the Container

To run this container, use the following Docker command:

```bash
docker run -it --rm --privileged \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --tmpfs /run \
  --tmpfs /run/lock \
  -v /dev/vboxdrv:/dev/vboxdrv \
  --net=host \
  vboxdocker
```

### Explanation of Parameters:

- `-it`: Runs Docker in interactive mode with a tty.
- `--rm`: Automatically removes the container when it stops.
- `--privileged`: Gives extended privileges to this container.
- `-v /sys/fs/cgroup:/sys/fs/cgroup:ro`: Mounts the cgroup filesystem from the host to the container in read-only mode.
- `--tmpfs /run` and `--tmpfs /run/lock`: Creates temporary file storage areas that are necessary for running services within the container.
- `-v /dev/vboxdrv:/dev/vboxdrv`: Mounts the VirtualBox driver from the host to allow VirtualBox to interact with the kernel modules.
- `--net=host`: Uses the host's networking stack inside the container.

## Important Notes

- Running VirtualBox inside a Docker container requires privileged access to the host's system resources, which can pose security risks. Ensure you trust the software and understand the security implications before proceeding.
- Ensure that the VirtualBox kernel modules are properly installed and loaded on your host system.

For any issues or further assistance, please refer to the [official VirtualBox documentation](https://www.virtualbox.org/wiki/Documentation) or open an issue in this repository.
