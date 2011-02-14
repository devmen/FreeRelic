module FreeRelic
  require 'free_relic/engine' if defined?(Rails)
end

#ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
#  Rails.logger.debug(["notification:", name, start, finish, id, payload.inspect].join(" "))
#nd

