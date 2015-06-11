require 'faraday_middleware'
require 'forwardable'

#
class Hubspot::Connection
  extend Forwardable

  DEFAULT_BASE_URL = 'https://api.hubapi.com'

  DEFAULT_INITIALIZATION = lambda do |faraday|
    faraday.request :json
    faraday.response :json
    faraday.response :logger
    faraday.adapter Faraday.default_adapter
  end

  delegate Faraday::Connection::METHODS => :@faraday

  def initialize(auth_strategy, base_url = nil, &block)
    base_url ||= DEFAULT_BASE_URL
    block ||= DEFAULT_INITIALIZATION
    @faraday = Faraday.new(base_url, auth_strategy.connection_options, &block)
  end
end
