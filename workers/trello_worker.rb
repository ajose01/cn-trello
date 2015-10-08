require 'sidekiq'
require 'trello_newsletter'

Sidekiq.configure_client do |config|
  config.redis = { :url => ENV['REDIS_PROVIDER'], :namespace => 'CN', :size => 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { :url => ENV['REDIS_PROVIDER'], :namespace => 'CN' }
end

class TrelloWorker
  include Sidekiq::Worker

  def perform(msg)
    TrelloNewsletter.new.run
    puts "Processed #{msg}"
  end

end

