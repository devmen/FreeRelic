class FreeRelic::SqlmetricsController < FreeRelic::BaseController

  def index
    @sql_metrics = FreeRelic::Metric.sql_metrics#.page(params[:page]).sorted
  end

  def slowest
    @sql_metrics = FreeRelic::Metric.sql_metrics.by_duration#.page(params[:page]).sorted
    @ref = request.referer
  end

  def destroy
    destroy_metric
    redirect_to free_relic_index_path
  end
end