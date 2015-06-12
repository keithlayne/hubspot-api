require 'hubspot-api'

#
class Hubspot::ContactProperty < Hubspot::Resource
  def id
    data['name']
  end

  def save
    fail if destroyed?
    path = "named/#{id}" if persisted?
    response = connection.post("/contacts/v2/properties/#{path}", data)
    handle_response(response) do
      data.replace(response.body)
      @errors.clear
      @persisted = true
      true
    end
  end

  def update(attributes)
    fail if destroyed? || !persisted?
    data.merge!(attributes)
    save
  end

  def destroy
    fail if destroyed?
    response = connection.delete("/contacts/v2/properties/named/#{id}")
    handle_response(response) do
      @destroyed = true
    end
  end

  class Api < Hubspot::Api
    def new(data = {}, persisted = false)
      Hubspot::ContactProperty.new(portal, data, persisted)
    end

    def create(data = {})
      new(data).tap(&:save)
    end

    def all
      response = connection.get('/contacts/v2/properties')
      fail(response.body['message']) unless response.success?
      response.body.map { |data| new(data, true) }
    end

    def find(id)
      response = connection.get("/contacts/v2/properties/named/#{id}")
      fail(response.body['message']) unless response.success?
      new(response.body, true)
    end
  end
end
