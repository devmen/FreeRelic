class FreeRelic::SqlmetricsController < FreeRelic::BaseController
  def index
    @sql_metrics = FreeRelic::Metric.sql_metrics.page(params[:page]).sorted
  end

  def slowest
    @sql_metrics = FreeRelic::Metric.sql_metrics.by_duration.page(params[:page]).sorted
    render :index
  end

  def destroy
    @sql_metric = FreeRelic::Metric.find(params[:id])
    @sql_metric.destroy
    render :layout => false
  end
end

