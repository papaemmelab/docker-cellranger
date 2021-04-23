FROM centos:7

LABEL maintainers="Georgios Asimomitis <https://github.com/gasimomitis>"

# Install some utilities
RUN yum install -y \
    wget \
    unzip \
    which \
    bsdtar

# Install cellranger
ARG VERSION="6.0.1"
ARG DOWNLOAD_LINK="https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.0.1.tar.gz?Expires=1619250483&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjAuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MTkyNTA0ODN9fX1dfQ__&Signature=hCcyhxPsHCvLGVnGP~n9fCN-MQzYfxgF8TkMvOATWDEWhDmbZliczBzJ7j4dhJMjRV-5zYoJ1sfCWoDMTOCs3xyd9uHr2TastxW17HCirsUemnSVaZ0xtGcCZtp3u3iPYo~9r4377b93WGmqPCS2ldwklQwudlcqXcp5l55lJMUDZYb4BVpDD3mwhvq8Ahb8E17nDSwFXvPbYBYtH69nW-LgolME3Qw2LG4GeyqLJTlpEBGhZg4cU~on1BJUsgiIGfpY4L1CmcTrcNjrwjnX1IfqB2G4xfHUm13SAXyv9qW70XTbhSoJkGwFDw~4Ibju4pxN2YvN5golsMxtIvlKgA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

RUN cd /opt/ && \
    wget -O cellranger-$VERSION.tar.gz ${DOWNLOAD_LINK} &> /dev/null && \
    tar -xzf cellranger-$VERSION.tar.gz && \
    rm -f cellranger-$VERSION.tar.gz

# Set locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH /opt/cellranger-$VERSION:$PATH

# For MSK users
VOLUME /gpfs
VOLUME /data

ENTRYPOINT ["cellranger"]
