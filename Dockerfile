FROM ubi8/ruby-30

RUN gem install listen -v 3.0.8
RUN gem pristine ascii_binder
RUN asciibinder --version
USER root

LABEL url="http://www.asciibinder.org" \
      summary="a documentation system built on Asciidoctor" \
      description="AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root." \
      RUN="docker run -it --rm \
          -v `pwd`:/docs:z \
          IMAGE"

ENV LANG=en_US.UTF-8
WORKDIR /docs
CMD asciibinder package
