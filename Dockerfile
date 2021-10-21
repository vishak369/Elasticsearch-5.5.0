FROM centos:7
MAINTAINER vishakkv954@gmail.com
RUN useradd -ms /bin/bash elasticsearch
RUN yum -y install java-1.8.0-openjdk-devel
RUN yum -y install wget
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.rpm
RUN rpm -ivh elasticsearch-5.5.0.rpm
RUN mkdir /usr/share/elasticsearch/config
RUN cp -R /usr/share/elasticsearch/* /home/elasticsearch/
COPY elasticsearch.yml /home/elasticsearch/config/
COPY log4j2.properties /home/elasticsearch/config/
RUN chown -R elasticsearch:elasticsearch /home/elasticsearch/*
WORKDIR /home/elasticsearch
USER elasticsearch
EXPOSE 9200
EXPOSE 9300
CMD ["/home/elasticsearch/bin/elasticsearch"]
