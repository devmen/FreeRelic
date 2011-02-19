module FreeRelic
  class Engine < Rails::Engine
    config.app_middleware.insert_after "ActionDispatch::Callbacks",
      "FreeRelic::MuteMiddleware"
    config.metrics = FreeRelic
  end
end
