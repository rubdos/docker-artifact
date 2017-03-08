# Artifact Docker image

This is a convenient Docker image for [artifact](https://github.com/vitiral/artifact).

It is perfectly suited as a substitute for installing artifact on your system,
or as a tool in [GitLab's CI](https://about.gitlab.com/gitlab-ci/).
For an example on this, refer to
[this repo's `.gitlab-ci.yml` file](https://github.com/rubdos/docker-artifact/blob/master/.gitlab-ci.yml),
and [the corresponding output on GitLab](https://gitlab.com/rubdos/docker-artifact/pipelines).

You can even think about having GitLab generate artifacts of `art export`,
and have them pushed to a website.

## Usage

`art ls` is equivalent to

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact
```

or

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact ls
```

`art check` is equivalent to

```
docker run -v $(pwd):/app --workdir=/app rubdos/artifact check
```

In general, you can use all art commands, and
`docker run -v $(pwd):/app --workdir=/app rubdos/artifact`
serves as a substitute for `art`.
