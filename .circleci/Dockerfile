FROM circleci/ruby:2.6.1-node-browsers

LABEL maintainer "phuonglh0420@gmail.com"
LABEL description "Base image for CircleCI"
LABEL manual "Docker base image for CircleCI in Ruby 2.6.1 \
To build this image, run \
    export DOCKER_TAG=yeuem1vannam/circleci-ruby:2.6.1-node-browsers \
    docker build -f ./Dockerfile -t $DOCKER_TAG --no-cache . \
Then push the image to Docker Hub \
    docker push $DOCKER_TAG \
"

ENV DEBIAN_FRONTEND noninteractive
USER circleci

RUN sudo apt-get update -qq && sudo apt-get install -y \
  vim \
  mysql-client \
  cmake \
  --fix-missing --no-install-recommends \
  # Keep image size down
  && sudo rm -rf /var/lib/apt/lists/*

RUN echo "gem: --no-document --no-rdoc --no-ri" >> ~/.gemrc
RUN gem install bundler --no-document
RUN gem install pronto pronto-github rubocop-github rubocop-rspec pronto-rails_best_practices

# NOTE: CircleCI has its caching system, so it is not necessary to pre-install
# the common gems

CMD ["/bin/sh"]
