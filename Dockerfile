FROM registry.access.redhat.com/ubi8/ruby-27:1-65

RUN gem install listen -v 3.0.8
RUN gem install ascii_binder
RUN asciibinder --version
USER root
RUN yum install java-1.7.0-openjdk-devel && \
    yum clean all

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v `pwd`:/docs:z \
          IMAGE"

ENV JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.95-2.6.4.0.el7_2.x86_64/jre/
ENV LANG=en_US.UTF-8
WORKDIR /docs
CMD asciibinder package
