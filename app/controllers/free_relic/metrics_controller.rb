class FreeRelic::MetricsController < ApplicationController
  prepend_around_filter :mute_notifications

  def index
    @metrics = FreeRelic::Metric.all
  end

  def destroy
    @metric = FreeRelic::Metric.find(params[:id])
    @metric.destroy redirect_to free_relic_index_path
  end

  protected

  def mute_notifications
    FreeRelic.mute! { yield }
  end
end
