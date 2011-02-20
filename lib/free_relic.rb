require 'active_support/notifications'
require 'mongoid'
require 'free_relic/mute_middleware'
require 'free_relic/engine'

module FreeRelic
  def self.queue
    @queue ||= Queue.new
  end

  def self.thread
    @thread ||= Thread.new do
      while args = queue.pop
        FreeRelic::Metric.store!(args)
      end
    end
  end

  def self.finish!
    queue << nil
    thread.join
    @thread = nil
    thread
  end
end

FreeRelic.queue
FreeRelic.thread

ActiveSupport::Notifications.subscribe do |*args|
  FreeRelic.queue << args unless FreeRelic.mute?
end

Mongoid.configure do |config|
  name = "freerelic_#{Rails.env}"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end
