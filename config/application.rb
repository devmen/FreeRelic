require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module FreeRelic
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib/free_relic)
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
  end
end

