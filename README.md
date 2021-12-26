# spuder/openscad

A docker image containing a fairly recent version of openscad installed. (Newer than what is currently available in apt repos)

| | |
|---|---|
|DockerHub| https://hub.docker.com/repository/docker/spuder/openscad | 
|Github| https://github.com/spuder/openscad-dockerhub | 

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


### Releasing A new version

To upgrade the version that is deployed.

The files are downloaded from `https://files.openscad.org/` Check that URL for available versions. 

1. Modify `OPENSCAD_VERSION` in `.github/workflows/dockerhub.yaml`

```
          build-args: |
            OPENSCAD_VERSION=2021.01
```

2. Commit & create git tag
```
git tag 2021.01
```

3. Push tags

4. Create release in github release page

5. Watch github actions deploy. 

### Limitations

This container is only intended for command line usage of openscad (e.g. in a CI/CD pipeline or scripts to manipulate STL files). Running a full QT/X11 environment from docker is probably possible, but is outside the scope of this repo. (If you have the skills to get it working, pull request welcome [github.com/spuder/openscad](https://hub.docker.com/repository/docker/spuder/openscad )). 

## Additional Resources

https://github.com/openscad/openscad/issues/1798#issuecomment-997619408