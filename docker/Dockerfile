FROM tensorflow/tensorflow:latest-py3
ENV PROJECT_NAME template_for_project_archival
WORKDIR /
RUN apt-get update && apt-get install -y            \
    apt-utils                                       \
    unzip                                           \
    wget                                            \
    curl                                            \
    git                                             \
    libsm6                                          \
    libxrender1                                     \
    libfontconfig1                                  \
    libxext6                                     && \
    pip3 install opencv-python                   && \
    pip3 install opencv-contrib-python           && \
    mkdir PROJECT_NAME                           && \
    cd PROJECT_NAME                              
VOLUME /PROJECT_NAME
