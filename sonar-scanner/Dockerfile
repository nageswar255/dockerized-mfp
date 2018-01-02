FROM java:8
maintainer jemlifathi


RUN apt-get update && apt-get --assume-yes install -y wget unzip maven
# Install sonar scanner and install it
RUN cd /opt && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && unzip sonar-scanner-cli-3.0.3.778-linux.zip
ENV PATH ${PATH}:/opt/sonar-scanner-3.0.3.778-linux/bin

# Install node.js for js/ts plugin
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs