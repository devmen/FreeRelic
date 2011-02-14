require "free_relic"
require "rails"

module FreeRelic
  class Engine < Rails::Engine
    engine_name :free_relic
  end
end

