ARG TAG=11.8.0-cudnn8-devel-ubuntu22.04

FROM nvidia/cuda:${TAG}

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  \
    && apt-get install -y wget \
        git \
        python3 \
        python3-venv \
        python3-dev \
        python3-pip \
        less \
        build-essential \
        gfortran \
        libibverbs-dev \
        ca-certificates \
        bzip2 \
        ca-certificates \
        curl \
        libgl1-mesa-glx \
        openssh-client \
        zip \
        libxi6 \
        libglib2.0-0 \
        ffmpeg \
        libcairo2 \
        libcairo2-dev \
        cmake


RUN pip3 install -U pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 100
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 100

COPY ./requirements.txt /opt/requirements.txt
COPY ./requirements_others.txt /opt/requirements_others.txt

RUN pip3 install -r /opt/requirements.txt
RUN pip3 install -r /opt/requirements_others.txt

RUN pip3 install -U torch torchvision torchaudio \
    --index-url https://download.pytorch.org/whl/cu118
RUN pip3 install "git+https://github.com/facebookresearch/pytorch3d.git@stable"

# More library dependency from https://github.com/NVlabs/instant-ngp/blob/master/.devcontainer/Dockerfile
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y ffmpeg
RUN apt-get install -y tk-dev
RUN apt-get install -y libxi-dev
RUN apt-get install -y libc6-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libomp-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libcgal-dev
RUN apt-get install -y libgdbm-dev
RUN apt-get install -y libglew-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y qtbase5-dev
RUN apt-get install -y checkinstall
RUN apt-get install -y libglfw3-dev
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libgflags-dev
RUN apt-get install -y libxrandr-dev
RUN apt-get install -y libopenexr-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libxcursor-dev
RUN apt-get install -y build-essential
RUN apt-get install -y libcgal-qt5-dev
RUN apt-get install -y libxinerama-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libfreeimage-dev
RUN apt-get install -y libncursesw5-dev
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y libqt5opengl5-dev
RUN apt-get install -y libgoogle-glog-dev
RUN apt-get install -y libsuitesparse-dev
RUN apt-get install -y python3-setuptools
# RUN apt-get install -y libreadline-gplv2-dev