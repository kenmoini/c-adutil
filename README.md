# adutil - in a container

Say you have a Linux system - it's already bound to an LDAP/Kerberos realm.

Then you want to use `adutil` with a different directory - it'll throw an error.

This is where this container comes into play.

## Building the Container

```bash
podman build -t adutil -f Containerfile .
```

## Running the Container

You can either run the container that you just built, or use the one from `quay.io/kenmoini/adutil`

```bash
# Make a directory to store generated assets
mkdir ad-gen

# Run the container, remote source
podman run --rm -it -v "$(pwd)/ad-gen:/tmp/ad-gen:Z" quay.io/kenmoini/adutil adutil --help

# Run the container, local build
podman run --rm -it -v "$(pwd)/ad-gen:/tmp/ad-gen:Z" adutil adutil --help

# Run the container, interactively
podman run --rm -it -v "$(pwd)/ad-gen:/tmp/ad-gen:Z" quay.io/kenmoini/adutil:latest /bin/bash
```

## Hints

- When performaing a `kinit` make sure the domain/realm is in all capital letters.
- Likely need to set a HOME path `export HOME=/tmp/ad-gen/`
- *I honestly haven't gotten this to work right yet...*