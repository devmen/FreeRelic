require 'spec_helper'

describe FreeRelic do
  before do
    FreeRelic::Metric.delete_all
    ActiveSupport::Notifications.instrument "sql.any_orm",
      payload { sleep(0.001) }
  end

  let(:metric)  { FreeRelic::Metric.first }
  let(:payload) { {"sql" => "SELECT * FROM foo" } } 

  it "should save any sql notification" do
    FreeRelic::Metric.count.should == 1
    metric.name.should == "sql.any_orm"
    metric.payload.should == payload
    metric.duration.should be
    metric.instrumenter_id.should be
    metric.started_at.should be
    metric.created_at.should be
  end
end
