FROM tensorflow/tensorflow:latest-py3
ENV PROJECT_NAME template_for_project_archival
ENV URL_TO_GIT_REPOSITORY https://github.com/Rise-group/template_for_project_archival.git
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
    pip3 install opencv-contrib-python
RUN git clone URL_TO_GIT_REPOSITORY /PROJECT_NAME
VOLUME /PROJECT_NAME/data
VOLUME /PROJECT_NAME/results


