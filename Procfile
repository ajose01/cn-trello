web: bundle exec rackup config.ru -p $PORT
sidekiq: bundle exec sidekiq -r ./workers/trello_worker.rb
redis: redis-server
