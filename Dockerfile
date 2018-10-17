FROM ruby:2.5

WORKDIR /src

COPY Gemfile Gemfile.lock /src/
RUN gem install bundler && bundle -j4

COPY . /src
