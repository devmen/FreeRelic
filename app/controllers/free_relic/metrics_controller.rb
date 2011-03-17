class FreeRelic::MetricsController < FreeRelic::BaseController
  def index
    @metrics = FreeRelic::Metric.sorted.page(params[:page])
  end

  def destroy
      destroy_metric
      redirect_to free_relic_index_path
  end
end

