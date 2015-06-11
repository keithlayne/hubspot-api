require 'forwardable'
require 'hubspot-api/naming'

#
class Hubspot::Api
  extend Forwardable

  attr_reader :portal
  delegate [:connection, :portal_id] => :portal

  def self.lookup(name)
    Hubspot.const_get(name.extend(Hubspot::Naming).singular.camelize)::Api
  end

  def initialize(portal)
    @portal = portal
  end
end
