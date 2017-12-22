FROM java:8
MAINTAINER jemlifathi

# Update and Install Git and Maven
RUN apt-get update && apt-get --assume-yes install -y zip unzip apt-utils wget git maven

# Install node 6
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

# Install cordova and mfpdevcli
RUN npm -v && node -v
RUN npm i -g cordova@6.4.0 && npm install -g mfpdev-cli

ADD ./tools /opt

# Install android
ENV ANDROID_COMPILE_SDK=25
ENV ANDROID_BUILD_TOOLS=24.0.0
ENV ANDROID_SDK_TOOLS=24.4.1
RUN apt-get --quiet update --yes && apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1
RUN wget --quiet --output-document=android-sdk-linux.tgz https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz
RUN tar --extract --gzip --file=android-sdk-linux.tgz
RUN chown -R root.root android-sdk-linux && \
  /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools" && \
  /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-21.0.0,build-tools-21.0.1,build-tools-21.0.2,build-tools-21.1.0,build-tools-21.1.1,build-tools-21.1.2,build-tools-22.0.0,build-tools-22.0.1,build-tools-23.0.0,build-tools-23.0.3,build-tools-24.0.0,build-tools-24.0.1,build-tools-24.0.2,build-tools-24.0.3,build-tools-25.0.0,android-21,android-22,android-23,android-24,android-25,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-24"
#RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK} && echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools && echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS} && echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository && echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services && echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV PATH=$PATH:/opt/android-sdk-linux/platform-tools/

WORKDIR /home
# Download dev kit
#RUN curl http://public.dhe.ibm.com/ibmdl/export/pub/software/products/en/MobileFirstPlatform/mobilefirst-deved-devkit-linux-8.0.0.0.bin
# Or just copy it from current folder
COPY ./mobilefirst-deved-devkit-linux-8.0.0.0.bin /home
COPY ./installation.properties /home

# Install Mobile First Platform
RUN chmod +x mobilefirst-deved-devkit-linux-8.0.0.0.bin
#Run devkit installer in silent mode using an installation file
RUN ./mobilefirst-deved-devkit-linux-8.0.0.0.bin -i silent -f installation.properties

EXPOSE 9080