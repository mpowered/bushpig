ARG  RUBY_GENERAL_VERSION
ARG  RUBY_VERSION
FROM ruby:${RUBY_VERSION}

LABEL maintainer="gabriel@zero-one.io"

RUN apt-get update  --quiet=2 \
    && apt-get install --quiet=2 --no-install-recommends git make gcc \
    && rm --recursive --force /var/lib/cache/

RUN addgroup app \
    && useradd --gid app --home-dir /app --shell /bin/bash app \
    && mkdir /app /gems \
    && chown --recursive app:app /app /gems

USER    app
WORKDIR /app
COPY    --chown=app:app Gemfile* ./
COPY    --chown=app:app *.gemspec ./
ENV     BUNDLE_PATH /gems

ARG BUNDLE_VERSION

RUN  gem install bundler --version $BUNDLE_VERSION
RUN  mkdir --parents lib/bushpig
COPY --chown=app:app lib/bushpig/version.rb lib/bushpig/
RUN  bundle install --jobs=$(nproc) \
     && rm --recursive --force ${BUNDLE_PATH}/ruby/${RUBY_GENERAL_VERSION}/cache \
     && chown --recursive app:app /gems/

COPY --chown=app:app . /app/

RUN chown --recursive app:app /app \
    && rm --recursive --force /app/tmp \
    && rm --recursive --force /app/log \
    && mkdir --parents /app/tmp \
    && mkdir --parents /app/log

CMD ["tail", "--follow", "/dev/null"]
