# redcap-docker
Vagrant virtualization software builds a Docker container on a VM to run REDCap. Docker container can be redistributed as needed.

##### *Note: Because of REDCap's licensing policies, the Docker container cannot be uploaded to Docker Hub. Thus, a Vagrant VM will construct a container for you to use with a REDCap installation provided by the user.*

##### *Note: Ignore the circle.yml file, as that is for Continuous Integration testing purposes by the developer.*

### Installation Instructions

1. Download the REDCap-Docker master file and extract it on to your computer.

2. Move your REDCap installation zip folder inside of the newly-extracted redcap-docker folder.

3. Navigate to the directory through your terminal or command prompt and run `vagrant up`.

4. Since Vagrant won't let you send commands from your local machine to the virtual machine via SSH, then to a Docker container that is connected to the virtual machine through SSH, you will have to manually remote in to your Vagrant machine. To do this, run `vagrant ssh` and then run the container through `cd /vagrant && sudo docker run -it -p 1130:80 redcap-docker`. 

5. Now, the container has been built, it is running, and you are connected to the container terminal through SSH. There is a possilbity that you will have to run `service mysqld restart && service httpd restart` inside of the container to reload the REDCap configurations.

6. Navigate your browswer to http://localhost:1130/redcap to see the newly-created REDCap instance. Now you can use this container as you please throughout your organization.
