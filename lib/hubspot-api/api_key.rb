#
class Hubspot::ApiKey
  attr_reader :api_key

  def initialize(api_key = 'demo')
    @api_key = api_key
  end

  def connection_options
    { params: { hapikey: api_key } }
  end
end
