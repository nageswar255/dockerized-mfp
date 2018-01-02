FROM sonarqube
MAINTAINER jemlifathi

RUN apt-get update && apt-get --assume-yes install -y curl wget unzip maven
# Install sonar scanner and install it
RUN cd /opt && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && unzip sonar-scanner-cli-3.0.3.778-linux.zip
ENV PATH ${PATH}:/opt/sonar-scanner-3.0.3.778-linux/bin

# Install node.js for js/ts plugin
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

# Install required plugins
RUN cd /opt/sonarqube/extensions/plugins && wget https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-4.0.0.5862.jar && wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-5.0.0.12796.jar && wget https://sonarsource.bintray.com/Distribution/sonar-typescript-plugin/sonar-typescript-plugin-1.2.0.1484.jar && wget https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-2.5.0.476.jar

#RUN /opt/sonarqube/bin/run.sh & command &
EXPOSE 9000 9092