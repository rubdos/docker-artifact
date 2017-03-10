[![build status](https://gitlab.com/rubdos/docker-artifact/badges/master/build.svg)](https://gitlab.com/rubdos/docker-artifact/commits/master)
[![Docker Automated build](https://img.shields.io/docker/automated/rubdos/artifact.svg)](https://hub.docker.com/r/rubdos/artifact/)
[![Docker Pulls](https://img.shields.io/docker/pulls/rubdos/artifact.svg)](https://hub.docker.com/r/rubdos/artifact/)

# Artifact Docker image

This is a convenient Docker image for [artifact](https://github.com/vitiral/artifact).

## Supported tags and their Dockerfile's

Three kinds of tags are available: `latest`, `master` and specific versions:

- `latest` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/master/Dockerfile))
  represents the latest release version.
- `master` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/master/Dockerfile.git))
- `0.6.4`  ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/0.6.4/Dockerfile))
  equal to `latest`
- Older versions (unsupported):
  - `0.6.3` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/0.6.3/Dockerfile))
  - `0.6.2` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/0.6.2/Dockerfile))
  - `0.6.1` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/0.6.1/Dockerfile))
  - `0.6.0` ([Dockerfile](https://github.com/rubdos/docker-artifact/blob/0.6.0/Dockerfile))

We can reuse our `Dockerfile`'s because we use a clever
[build hook](https://github.com/rubdos/docker-artifact/blob/master/hooks/build)
that's able to dispatch between different versions based on the currently building git refspec.

## Possible use cases

This image is perfectly suited as a substitute for installing artifact on your system,
or as a tool in [GitLab's CI](https://about.gitlab.com/gitlab-ci/).
For an example on this, refer to
[this repo's `.gitlab-ci.yml` file](https://github.com/rubdos/docker-artifact/blob/master/.gitlab-ci.yml),
and [the corresponding output on GitLab](https://gitlab.com/rubdos/docker-artifact/pipelines).

You can even think about having GitLab generate artifacts of `art export`,
and have them pushed to a website, or to
[GitLab pages](https://rubdos.gitlab.io/docker-artifact/)!
For the latter, there's an example in
[this repo's `.gitlab-ci.yml` file](https://github.com/rubdos/docker-artifact/blob/master/.gitlab-ci.yml),

## Usage

`art ls` is equivalent to

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact
```

(i.e., the default command of this Docker image is `art ls`)

or

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact art ls
```

`art check` is equivalent to

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact art check
```

In general, you can use all art commands, and
`docker run -v $(pwd):/app --workdir=/app rubdos/artifact art`
serves as a substitute for `art`.
