class FreeRelic::DashboardController < FreeRelic::BaseController
  def index
    @latest_metrics       = FreeRelic::Metric.sorted.limit(5)
    @slowest_sql_metrics  = FreeRelic::Metric.sql_metrics.by_duration.limit(5)
    @slowest_http_metrics = FreeRelic::Metric.http_metrics.by_duration.limit(5)
    #there must be some error notifications
    @errors               = {}
  end

  def destroy
    destroy_metric
    redirect_to free_relic_index_path
  end
end

