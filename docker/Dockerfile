FROM tensorflow/tensorflow:latest-py3
WORKDIR /
RUN apt-get update                               && \
    apt-get install -y apt-utils                 && \
    apt-get install -y                              \
    unzip                                           \
    wget                                            \
    curl                                            \
    git                                             \
    libsm6                                          \
    libxrender1                                     \
    libfontconfig1                                  \
    libxext6                                     && \
    pip3 install opencv-python                   && \
    pip3 install opencv-contrib-python          
