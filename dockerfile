# Version 0.0.1
# Maintainer d4nc00per <cooper.daniel45@gmail.com>

FROM ubuntu:14.04

RUN apt-get -qq update -y && apt-get -qq install wget openjdk-7-jdk unzip -y

# Download and extract android sdk
RUN cd /usr/local/ && wget -q http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz && tar xf android-sdk_r24.3.4-linux.tgz

# Install Android tools
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a

# Install Android SDK Version 22
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-22 --no-ui --force -a

# Install Apache-Ant
RUN cd /usr/local/ && wget -q http://mirrors.muzzy.org.uk/apache//ant/binaries/apache-ant-1.9.6-bin.tar.gz && tar xf apache-ant-1.9.6-bin.tar.gz

# Install Gradle
RUN cd /usr/local/ && wget -q http://services.gradle.org/distributions/gradle-2.2-all.zip && unzip -o gradle-2.2-all.zip

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANT_HOME /usr/local/apache-ant-1.9.6
ENV GRADLE_HOME /usr/local/gradle-2.2
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin

# Clean up
RUN rm -rf /usr/local/android-sdk_r24.3-linux.tgz
RUN rm -rf /usr/local/apache-ant-1.9.6-bin.tar.gz
RUN rm -rf /usr/local/gradle-2.2-all.zip