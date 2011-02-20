require 'spec_helper'

describe "Navigation" do
  include Capybara

  it "should store notifications" do
    expect do
      visit "/users"
      FreeRelic.finish!
    end.to change{ FreeRelic::Metric.count }
  end

  it "should not store notifications if path muted by regexp" do
    FreeRelic.mute_regexp = %r{^/users}
    expect do
      visit "/users"
      FreeRelic.finish!
    end.not_to change{ FreeRelic::Metric.count }
    FreeRelic.mute_regexp = nil
  end

end
