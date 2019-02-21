FROM ruby:2.6

WORKDIR /src

COPY Gemfile Gemfile.lock /src/
RUN gem install bundler && bundle -j4

COPY . /src

CMD ["rackup"]
