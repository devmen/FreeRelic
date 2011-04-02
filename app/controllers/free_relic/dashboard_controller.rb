class FreeRelic::DashboardController < FreeRelic::BaseController
  def index
    @latest_metrics       = FreeRelic::Metric.page(params[:page]).sorted.limit(5)
    @slowest_sql_metrics  = FreeRelic::Metric.page(params[:page]).sql_only.by_duration.limit(5)
    @slowest_http_metrics = FreeRelic::Metric.page(params[:page]).http_only.by_duration.limit(5)
    #there should be some notifications about errors
    @errors               = {}
  end
end

