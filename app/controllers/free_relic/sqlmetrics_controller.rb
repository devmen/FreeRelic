class FreeRelic::SqlmetricsController < FreeRelic::BaseController
  def index
    @sql_metrics = FreeRelic::Metric.page(params[:page]).sql_metrics.sorted
  end

  def slowest
    @sql_metrics = FreeRelic::Metric.page(params[:page]).sql_metrics.by_duration
    render :index
  end

  def destroy
    @sql_metric = FreeRelic::Metric.find(params[:id])
    @sql_metric.destroy
    render :layout => false
  end
end

