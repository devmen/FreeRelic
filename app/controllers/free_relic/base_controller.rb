class FreeRelic::BaseController < ApplicationController
  prepend_around_filter :mute_notifications

  layout "free_relic"

  def initialize
    super

    # disable Footnotes for all freerelic controllers
    filters = FreeRelic::BaseController._process_action_callbacks.select{|f| f.raw_filter.to_s.include?("Footnotes")}.map(&:filter)
    filters.each{ |filter| FreeRelic::BaseController.send(:skip_filter, filter) }
  end

  protected

  def mute_notifications
    FreeRelic.mute! { yield }
  end
end

