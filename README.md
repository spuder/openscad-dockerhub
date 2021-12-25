# spuder/openscad

A docker image containing a fairly recent version of openscad installed. (Newer than what is currently available in apt repos)

## Usage

Basic example to print `--version`
```
docker pull spuder/openscad:2021.01
docker run -it spuder/openscad:2021.01 openscad --version
OpenSCAD version 2021.01
```

Basic example to Convert STL to PNG
```
docker run -it -v $(PWD):/data spuder/openscad:2021.01 openscad /dev/null -D "import(\"/data/cube.stl\");" -o "/data/cube.png" --imgsize=600,600 --colorscheme "Tomorrow Night"
```

Building from source

### FAQ
:question: Why make this container? Doesn't openscad [provide official container images](https://hub.docker.com/u/openscad)? 

The openscad images are for pipelines, not for actually running openscad

[Additional Context](https://github.com/openscad/docker-openscad/issues/3#issuecomment-1001055766)

### Limitations

This container is only intended for command line usage of openscad (e.g. in a CI/CD pipeline or scripts to manipulate STL files). Running a full QT/X11 environment from docker is probably possible, but is outside the scope of this repo. (If you have the skills to get it working, pull request welcome). 

https://github.com/openscad/openscad/issues/1798#issuecomment-997619408