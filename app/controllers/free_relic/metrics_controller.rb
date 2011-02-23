class FreeRelic::MetricsController < FreeRelic::BaseController
  def index
    @metrics = FreeRelic::Metric.all
  end

  def destroy
    @metric = FreeRelic::Metric.find(params[:id])
    @metric.destroy redirect_to free_relic_index_path
  end
end

