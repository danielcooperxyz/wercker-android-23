# Version 0.0.1
# Maintainer d4nc00per <cooper.daniel45@gmail.com>

FROM ubuntu:14.04

# Update packages and install dependencies
RUN apt-get -qq update -y \
	&& apt-get -qq install -y \
		lib32stdc++6 \
		lib32z1 \
		openjdk-7-jdk \
		unzip \ 
		wget

# Download and extract android sdk
RUN cd /usr/local/ \
	&& wget -q http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz \
	&& tar xf android-sdk_r24.4.1-linux.tgz

# Install Android tools & sdk
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --force -a --filter tools,platform-tools,build-tools-23.0.2,extra-android-support,extra-android-m2repository,android-23

# Install Apache-Ant
RUN cd /usr/local/ \
	&& wget -q http://mirrors.muzzy.org.uk/apache/ant/binaries/apache-ant-1.9.7-bin.tar.gz \
	&& tar xf apache-ant-1.9.7-bin.tar.gz

# Install Gradle
RUN cd /usr/local/ \
	&& wget -q http://services.gradle.org/distributions/gradle-2.10-all.zip \
	&& unzip -o gradle-2.10-all.zip

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANT_HOME /usr/local/apache-ant-1.9.7
ENV GRADLE_HOME /usr/local/gradle-2.10
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin

# Clean up
RUN rm -rf /usr/local/android-sdk_r24.4.1-linux.tgz
RUN rm -rf /usr/local/apache-ant-1.9.7-bin.tar.gz
RUN rm -rf /usr/local/gradle-2.10-all.zip