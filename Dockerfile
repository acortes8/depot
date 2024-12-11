FROM phusion/passenger-full:2.5.1

RUN rm etc/nginx/sites-enabled/default
RUN rm -f /etc/service/nginx/down
RUN rm -f /etc/service/redis/down

ADD config/nginx.conf /etc/nginx/sites-enabled/depot.conf

USER app
RUN mkdir /home/app/depot
WORKDIR /home/app/depot

RUN bash -lc 'rvm --default use ruby-3.2.2'
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT="development test"
COPY --chown=app:app Gemfile Gemfile.lock .
RUN bundle install
COPY --chown=app:app . .

RUN SECRET_KEY_BASE='bin/rails secret' \
  bin/rails assets:precompile

USER root
CMD ["/sbin/my_init"]