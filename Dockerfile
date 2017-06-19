#Dockerfile

#Specify container OS and creator
FROM centos:centos6
MAINTAINER cmsinc04

#Set working directory to /
WORKDIR /

#Copy the current directory contents into the container at /
ADD . /

#Install Puppet to run manifest
RUN yum -y update
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum update -y && yum install -y \
    puppet \
    wget \
    cronie
RUN puppet module install puppetlabs-stdlib
RUN puppet apply manifest.pp
RUN service mysqld restart && service httpd restart

#Make port 1130 and port 80 available to the outside world from the container
EXPOSE 1130
EXPOSE 80
