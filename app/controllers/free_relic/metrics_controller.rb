class FreeRelic::MetricsController < FreeRelic::BaseController
  def index
    
    if params[:type] == "sql"
      if params[:sort_by] == "duration"
	@page_title = "SQL Metrics Sorted by Duration"
        @metrics = FreeRelic::Metric.page(params[:page]).sql_only.by_duration
      else
	@page_title = "SQL Metrics"
        @metrics = FreeRelic::Metric.page(params[:page]).sql_only
      end
      
     elsif params[:type] == "http"
       if params[:sort_by] == "duration"
	 @page_title = "HTTP Metrics Sorted by Duration"
         @metrics = FreeRelic::Metric.page(params[:page]).http_only.by_duration
       else
	 @page_title = "HTTP Metrics"
         @metrics = FreeRelic::Metric.page(params[:page]).http_only
       end
       
    else
      @page_title = "All Metrics"
      @metrics = FreeRelic::Metric.page(params[:page]).sorted
    end

  end
end

