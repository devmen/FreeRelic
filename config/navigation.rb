SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :dashboard,    'Dashboard',    "#{free_relic_index_path}"
    primary.item :all_metrics,  'All Metrics',  "#{free_relic_index_path}/metrics/"
    primary.item :sql_metrics,  'SQL Metrics',  "#{free_relic_index_path}/metrics/sql"
    primary.item :http_metrics, 'HTTP Metrics', "#{free_relic_index_path}/metrics/http"
  end
end
"#{free_relic_index_path}/metrics/sql"