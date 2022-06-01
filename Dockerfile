FROM registry.access.redhat.com/ubi8/ruby-27

USER root
RUN gem install listen -v 3.0.8
RUN gem install ascii_binder
RUN asciibinder --version
RUN yum clean all

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="Run this asciibinder container image from the local doc repo, which is mounted into the container. Pass asciibinder commands to run the build. Generated files are owned by root." \
      RUN="docker run -it --rm \
          -v `pwd`:/docs:z \
          IMAGE"

ENV LANG=en_US.UTF-8
WORKDIR /docs
RUN asciibinder build