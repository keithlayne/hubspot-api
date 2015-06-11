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

  def initialize(portal, data)
    super(portal)
    @data = data
    @destroyed = false
    @errors = Hash.new([])
  end

  def destroyed?
    @destroyed ||= false
  end

  def persisted?
    !destroyed? && !id.to_s.strip.empty?
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
      @errors[:base] += ["HTTP #{response.status}: #{response.body['message']}"]
      false
    end
  end
end
