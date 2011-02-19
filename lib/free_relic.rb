require 'mongoid'
require 'free_relic/engine'
require 'active_support/notifications'

ActiveSupport::Notifications.subscribe do |*args|
  FreeRelic::Metric.store!(args)
end

module FreeRelic
end

Mongoid.configure do |config|
  name = "freerelic_#{Rails.env}"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end
