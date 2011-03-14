module FreeRelic
  class Metric
    include Mongoid::Document

    field :name
    field :duration, :type => Integer
    field :instrumenter_id
    field :payload, :type => Hash
    field :started_at, :type => DateTime
    field :created_at, :type => DateTime

    scope :sorted, desc(:created_at)
    scope :sql_metrics, where(:name => /^sql\./)
    scope :by_duration, desc(:duration)
    scope :http_metrics, where(:name => /^(start_processing|process_action)\./)

    def self.store!(args)
      metric = new
      metric.parse(args)
      metric.save!
    end

    def parse(args)
      self.name            = args[0]
      self.started_at      = args[1]
      self.duration        = (args[2] - args[1]) * 1000000
      self.instrumenter_id = args[3]
      self.payload         = args[4]
      self.created_at      = Time.new.utc
    end
  end
end

