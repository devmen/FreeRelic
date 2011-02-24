raw_config = File.read("#{FreeRelic.path}/config/free_relic.yml")
FREERELIC_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
