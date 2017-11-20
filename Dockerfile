#FROM ubuntu:14.04
FROM java:8
MAINTAINER jemlifathi
RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
# Install Java

#RUN apt-get update && \
#    apt-get upgrade -y && \
#    apt-get install -y  software-properties-common && \
#    add-apt-repository ppa:webupd8team/java -y && \
#    apt-get update && \
#    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections #&& \
#    apt-get install -y oracle-java8-installer && \
#    apt-get clean

# Define commonly used JAVA_HOME variable
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

WORKDIR /opt

#Download dev kit
#RUN curl http://public.dhe.ibm.com/ibmdl/export/pub/software/products/en/MobileFirstPlatform/mobilefirst-deved-devkit-linux-8.0.0.0.bin
#Or just copy it from current folder
COPY ./mobilefirst-deved-devkit-linux-8.0.0.0.bin /opt
COPY ./installation.properties /opt

RUN apt-get --assume-yes install -y zip unzip wget

RUN ls -al

RUN chmod +x mobilefirst-deved-devkit-linux-8.0.0.0.bin
#Run devkit installer in silent mode using an installation file
RUN ./mobilefirst-deved-devkit-linux-8.0.0.0.bin -i silent -f installation.properties

EXPOSE 9080