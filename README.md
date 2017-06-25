go-boilerplate
==============

go-boilerplate is a collection of various files that usually accompanies a Go project.

## Features

- Makefile with commands to build the project, build the Docker image, run tests, install dependencies...
- Use Godep to manage dependencies,
- Dockerfile to build a small image with the project executable.

## How to use?

Currently, the easiest way of starting a new project based on this boilerplate is to clone it and remove a `.git` directory. For example:

```bash
$ git clone --depth=1 --branch=master git@github.com:adambabik/go-boilerplate.git new-go-project
$ rm -rf new-go-project/.git
```

## License

MIT
