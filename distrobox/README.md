# Distrobox Development Environment

This directory contains the configuration for a custom Arch Linux development environment managed by Distrobox.

## 1. Build the Custom Image

The environment uses a custom container image defined in `images/arch-dev/Containerfile`. This image comes pre-packaged with essential development tools.

To build the image, navigate to the image directory and use Podman or Docker:

```bash
cd images/arch-dev
podman build -t arch-dev:latest .
```
*(Note: You can replace `podman` with `docker` if you prefer. The build command will automatically detect the `Containerfile`.)*

## 2. Create the Distrobox Container

Once the image is built, you can create the Distrobox container using the `distrobox-assemble` command. The configuration is defined in the `distrobox.ini` file.

From the `distrobox` directory, run:

```bash
distrobox-assemble create
```

This will create a new container named `dev` based on your `arch-dev:latest` image.

## 3. Run the Container

After the container is created, you can enter it to start your development session:

```bash
distrobox enter dev
```

You will now be inside a shell in your custom Arch Linux environment.
