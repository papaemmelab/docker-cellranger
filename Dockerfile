FROM centos:7

LABEL maintainers="Georgios Asimomitis <https://github.com/gasimomitis>"

# Install some utilities
RUN yum install -y \
    wget \
    unzip \
    which \
    bsdtar

# Install cellranger
ARG VERSION="3.1.0"
ARG DOWNLOAD_LINK="https://cf.10xgenomics.com/releases/cell-exp/cellranger-3.1.0.tar.gz?Expires=1619247757&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci0zLjEuMC50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MTkyNDc3NTd9fX1dfQ__&Signature=Kh9fGiXpfyN6qQDGn3OvLPKxnMaD9anN8o3DssgXwoJ5xMXDMr4YGLKNaeWOCw7x~akK53kacxS0Fh0~C6zOI1Zg9hBQjhY9jFzkztQI0Cs4UMRk1E~-i4r64NKwXq~fAzMCp6TNoPeRqdfMxLno7ZOBGcN8fw4xOt4Y19yyplRYIdF4o4hUF8AyfS46DyRYwU3A27jHeOmVeVrXTYdoiAIj7wSfJwc3T6-A532EMqd1tmW~mh9ljc15ULYzrz0nrsgvvqlbrvqgdRhhZ70RwMyu8V5NxLMRqLwuj5Qj96XBbsdEYUyHMjKnb6qKRCNdPKknKzye~xSDlgTFLQDk0A__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

RUN cd /opt/ && \
    wget -O cellranger-$VERSION.tar.gz ${DOWNLOAD_LINK} &> /dev/null && \
    bsdtar -xzf cellranger-$VERSION.tar.gz && \
    rm -f cellranger-$VERSION.tar.gz

# Set locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH /opt/cellranger-$VERSION:$PATH

# For MSK users
VOLUME /gpfs
VOLUME /data

ENTRYPOINT ["cellranger"]
