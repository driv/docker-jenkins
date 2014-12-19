FROM jenkins:latest

USER root

RUN wget --no-verbose -O /tmp/apache-maven-2.2.1.tar.gz http://archive.apache.org/dist/maven/maven-2/2.2.1/binaries/apache-maven-2.2.1-bin.tar.gz
RUN tar xzf /tmp/apache-maven-2.2.1.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-2.2.1 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-2.2.1.tar.gz
ENV MAVEN_HOME /opt/maven

RUN apt-get update
RUN apt-get -y install mercurial
RUN apt-get clean

USER jenkins
