require 'spec_helper'

describe FreeRelic do
  def notify_sql
    ActiveSupport::Notifications.instrument "sql.any_orm",
      payload { sleep(0.001) }
  end

  before { FreeRelic::Metric.delete_all }

  let(:metric)  { FreeRelic::Metric.first }
  let(:payload) { {"sql" => "SELECT * FROM foo" } } 

  it "should save any sql notification" do
    notify_sql
    FreeRelic::Metric.count.should == 1
    metric.name.should == "sql.any_orm"
    metric.payload.should == payload
    metric.duration.should be
    metric.instrumenter_id.should be
    metric.started_at.should be
    metric.created_at.should be
  end

  it "can ignore notifications when specified" do
    FreeRelic.mute! do
      FreeRelic.mute?.should be_true
      notify_sql
    end
    
    FreeRelic.mute?.should be_false
    FreeRelic::Metric.count.should == 0
  end

  it "mute should be set to false if error happened" do
    expect { FreeRelic.mute! }.to raise_error
    FreeRelic.mute?.should be_false
  end
end
