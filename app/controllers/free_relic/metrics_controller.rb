class FreeRelic::MetricsController < FreeRelic::BaseController
  def index
    # Need to swap page and scope when bug https://github.com/amatsuda/kaminari/issues#issue/26 will be fixed
    @metrics = FreeRelic::Metric.page(params[:page]).sorted
  end

  def destroy
    @metric = FreeRelic::Metric.find(params[:id])
    @metric.destroy
    redirect_to free_relic_index_path
  end
end

