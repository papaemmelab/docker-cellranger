# docker-cellranger

[![travis badge][travis_badge]][travis_base]
[![docker badge][docker_badge]][docker_base]
[![docker badge][automated_badge]][docker_base]

A Dockerfile to build a docker container for [10X Genomics CellRanger] installation. By default, the container runs the `cellranger` main command as entrypoint:

    docker run papaemmelab/docker-cellranger --help

[docker_base]: https://hub.docker.com/r/papaemmelab/docker-cellranger
[docker_badge]: https://img.shields.io/docker/build/papaemmelab/docker-cellranger.svg
[automated_badge]: https://img.shields.io/docker/automated/papaemmelab/docker-cellranger.svg
[travis_badge]: https://img.shields.io/travis/papaemmelab/docker-cellranger.svg
[travis_base]: https://travis-ci.com/papaemmelab/docker-cellranger
[10X Genomics CellRanger]: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger
