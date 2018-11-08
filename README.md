# DIGITEC Builds

A set of scripts to help you test several projects at the same time as if they are in production.

## Usage

You can use target make commands to simplify your life.

### Get all projects locally and install dependencies:

```sh
$ make init
```

### Build projects

```sh
$ make build
```

At this point you are ready to work with the separate projects locally and commit changes back to origin repositories.

## Testing

Use [http-server](https://www.npmjs.com/package/http-server) or any other server application to serve this project's root.

Browse `/digitec` folder to test sites as if they are in production server.
