#----------------------------------------------------------------------------------------------------------
#Description:      Steps required to store and load projects developed by RiSE students - EAFIT. 
#Last modified on: 25th November 2018



#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#STEP 0: Configuring a docker file for your project.
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------
#Install a STABLE version of Docker Community Edition (CE)
#----------------------------------------------------------------------------------------------------------
#For Mac:
#https://docs.docker.com/docker-for-mac/install/

#For Windows 10:
#https://docs.docker.com/docker-for-windows/install/

#For Ubuntu:
#https://docs.docker.com/install/linux/docker-ce/ubuntu/

#----------------------------------------------------------------------------------------------------------
#Create a docker account (it is free)
#----------------------------------------------------------------------------------------------------------

#Go to:
#https://hub.docker.com/


#----------------------------------------------------------------------------------------------------------
#Identify an appropriate Docker image
#----------------------------------------------------------------------------------------------------------

#Browse https://hub.docker.com/
#and search an "image" file which has 
#most of what you need (to save you time).
#For instance search:
#ubuntu 
#or
#opencv + python3 + tensorflow 
#or 
#R

#----------------------------------------------------------------------------------------------------------
#Using the image as a starting point, write a Dockerfile that configures your environment.
#----------------------------------------------------------------------------------------------------------

#You can use as reference the Dockerfile available in: 
#https://github.com/Rise-group/template_for_project_archival/tree/master/docker







#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#STEP 1: Prepare your project for deployment.
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------

#Organize a folder for your project with the following structure:
#LICENSE.md: a plain file with your project's license (e.g: the MIT license).
#README.md:  a mark-down file describing the project, how to install it, how to use it, what are the dependencies,  
#            (i.e: libraries with versions that were used and which are known to work).
#.gitignore: File that tells github which files shouldn't be synchronized.
#/src:       Folder with the actual code that you developed (your libraries, scripts, notebooks, etc.).
#/docker:    Folder containing the Dockerfile required to build the image for your project (see step 0).
#/doc:       Folder with documentation explaining your code (description, inputs/outputs for each function, class variables and class functions).
#/academic:  Folder with the technical documentation derived from your work both in Latex and in pdf.
#            (final report, poster, paper, etc.), as well as the citation details of your work (e.g: .bib files). 
#/data:      Folder with input data required to use your project.
#/results:   Folder with output data produced by your code .


#Upload your folder /data to RiSE's unlimited Dropbox account.
#Note: Make sure that the public link only allows other users to READ and not to EDIT !!!.


#Upload everything except the /data folder in your project to a private repository in RiSE's github. i.e:
#https://github.com/Rise-group
#Camilo can help you with this step.






#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#STEP 2: Using the project
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------
# How to get the code, docs, and Dockerfile?
#----------------------------------------------------------------------------------------------------------
#Clone the github repository for the project:
git clone https://github.com/Rise-group/template_for_project_archival.git

#Go to the project directory:
cd template_for_project_archival

#Download the data from dropbox. Remember to change dl=0 to dl=1 in the URL:
curl -L -o data.zip https://www.dropbox.com/sh/8gc3a1ce5w3pqez/AACK2YhAyPlgylmYDD2tevrVa?dl=1
unzip data.zip -d $(pwd)/data
rm data.zip

#----------------------------------------------------------------------------------------------------------
#How to build the docker image?
#----------------------------------------------------------------------------------------------------------
#Option 1: Build your docker image (python3-tensorflow-opencv) from a Dockerfile available in YOUR_PROJECT/docker/.
cd docker
sudo docker build $(pwd) -t python3-tensorflow-opencv
cd ..

#Option 2: Load your docker image from a .tar (previously created by someone else).
#cd docker
#sudo docker load --input python3-tensorflow-opencv.tar
#cd ..

#----------------------------------------------------------------------------------------------------------
#How to run the docker container?
#----------------------------------------------------------------------------------------------------------

#Option 1: Run the container, attach the volume with the project folder, and use it from the console.
sudo docker run -it --rm -e PROJECT_NAME=template_for_project_archival --name "container_tensorflow_opencv_py3" -v $(pwd)/:/template_for_project_archival/:rw python3-tensorflow-opencv /bin/bash


#Option 2: Run the container, attach the volume with the project folder, and use it from a Jupyter notebook through a web browser (local host - port 8888).
#sudo docker run -it --rm -e PROJECT_NAME=template_for_project_archival --name "container_tensorflow_opencv_py3" -p 8888:8888 -v $(pwd)/:/template_for_project_archival/:rw python3-tensorflow-opencv

#Note: to quit the container type exit and press enter.

#----------------------------------------------------------------------------------------------------------
#How to create a docker image from a docker container, and how to save it into a .tar file for future use?
#----------------------------------------------------------------------------------------------------------

cd docker

#List the containers.
sudo docker ps -a

#Create an image from a container identified with the container ID (for instance: de79fba0947b), and name it as you want (for instance tensorflow_1_12_opencv_3_4_3_python3)
sudo docker commit CONTAINER_ID tensorflow_1_12_opencv_3_4_3_python3

#Create a compressed .tar image, and modify it so that it can be read and written by all users and not only sudo.
sudo docker save --output python3-tensorflow-opencv.tar python3-tensorflow-opencv
sudo chmod a+rw python3-tensorflow-opencv.tar

#----------------------------------------------------------------------------------------------------------
#How to remove a docker container?
#----------------------------------------------------------------------------------------------------------
sudo docker ps -a
sudo docker rm --force CONTAINER_ID

#----------------------------------------------------------------------------------------------------------
#How to remove a docker image?
#----------------------------------------------------------------------------------------------------------

sudo docker images -a 
sudo docker rmi IMAGE_ID

#----------------------------------------------------------------------------------------------------------
# End.
#----------------------------------------------------------------------------------------------------------
