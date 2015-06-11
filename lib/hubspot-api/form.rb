require 'hubspot-api'

#
class Hubspot::Form < Hubspot::Resource
  def id
    data['guid']
  end

  def save
    fail if destroyed?
    response = connection.post("/contacts/v1/forms/#{id if persisted?}", data)
    handle_response(response) do
      data.replace(response.body)
      @errors.clear
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
    response = connection.delete("/contacts/v1/forms/#{id}")
    handle_response(response) do
      @destroyed = true
    end
  end

  class Api < Hubspot::Api
    def new(data = {})
      Hubspot::Form.new(portal, data)
    end

    def create(data = {})
      new(data).tap(&:save)
    end

    def all
      response = connection.get('/contacts/v1/forms')
      fail(response.body['message']) unless response.success?
      response.body.map(&method(:new))
    end

    def find(id)
      response = connection.get("/contacts/v1/forms/#{id}")
      fail(response.body['message']) unless response.success?
      new(response.body)
    end
  end
end
