require 'forwardable'

require 'hubspot-api/version'

require 'hubspot-api/api_key'
require 'hubspot-api/portal'
require 'hubspot-api/resource'
require 'hubspot-api/form'

# Top-level namespace for the library
module Hubspot
  APIS = %w(
    forms
  )

  DEMO = Portal.new('Hubspot Demo Portal', 62515, ApiKey.new)
end

