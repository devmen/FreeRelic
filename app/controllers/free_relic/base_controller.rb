class FreeRelic::BaseController < ApplicationController
  prepend_around_filter :mute_notifications

  layout "free_relic"

  def initialize
    super

    # disable Footnotes for all freerelic controllers
    filters = FreeRelic::BaseController._process_action_callbacks.select{|f| f.raw_filter.to_s.include?("Footnotes")}.map(&:filter)
    filters.each{ |filter| FreeRelic::BaseController.send(:skip_filter, filter) }
  end

  def authenticate
    authenticate_or_request_with_http_basic do |l, p|
      if FREERELIC_CONFIG[:auth][:active]
        (l == FREERELIC_CONFIG[:auth][:login] && p == FREERELIC_CONFIG[:auth][:password]) ? true : false

      else
        true
      end
    end
  end

  protected

  def mute_notifications
    FreeRelic.mute! { yield }
  end
end

