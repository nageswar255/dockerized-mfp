FROM java:8
MAINTAINER jemlifathi

# Update and Install Git and Maven
RUN apt-get update && apt-get --assume-yes install -y zip unzip apt-utils wget git maven

# Install node 6
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

# Install cordova and mfpdevcli
RUN npm -v && node -v
RUN npm i -g cordova@6.4.0 && npm install -g mfpdev-cli

# Download sonar scanner
RUN cd /opt && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && unzip sonar-scanner-cli-3.0.3.778-linux.zip
# Add sonar scanner to PATH
ENV PATH ${PATH}:/opt/sonar-scanner-3.0.3.778-linux/bin

WORKDIR /home
# Download dev kit
RUN wget http://public.dhe.ibm.com/ibmdl/export/pub/software/products/en/MobileFirstPlatform/mobilefirst-deved-devkit-linux-8.0.0.0.bin
# Or just copy it from current folder
#COPY ./mobilefirst-deved-devkit-linux-8.0.0.0.bin /home
COPY ./installation.properties /home

# Install Mobile First Platform
RUN chmod +x mobilefirst-deved-devkit-linux-8.0.0.0.bin
#Run devkit installer in silent mode using an installation file
RUN ./mobilefirst-deved-devkit-linux-8.0.0.0.bin -i silent -f installation.properties

ENTRYPOINT /root/MobileFirst-8.0.0.0/run.sh
EXPOSE 9080