require 'hubspot-api/api'

#
class Hubspot::Resource < Hubspot::Api
  extend Forwardable

  attr_accessor :data, :model_name, :errors

  delegate [:[], :[]=] => :data
  delegate model_name: 'self.class'

  class << self
    def model_name
      @model_name ||= name.extend(Hubspot::Naming)
    end
  end

  def initialize(portal, data, persisted = false)
    super(portal)
    @data = data
    @destroyed = false
    @persisted = persisted
    @errors = Hash.new([])
  end

  def destroyed?
    @destroyed ||= false
  end

  def persisted?
    !destroyed? && @persisted
  end

  def to_key
    [id] if persisted?
  end

  def to_param
    id.to_s if persisted?
  end

  def to_partial_path
    "hubspot/#{model_name.plural}/#{model_name.singular}"
  end

  private

  def handle_response(response, &block)
    if response.success?
      block ? block.call : true
    else
      message = "HTTP #{response.status}"
      message += ": #{response.body['message']}" if response.body
      @errors[:base] += [message]
      false
    end
  end
end
