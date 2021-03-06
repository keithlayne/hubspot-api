require 'active_model/lint'
require 'minitest'

RSpec.shared_examples_for ActiveModel do
  include ActiveModel::Lint::Tests
  include Minitest::Assertions

  alias_method :model, :subject

  attr_accessor :assertions

  before(:each) { self.assertions = 0 }

  ActiveModel::Lint::Tests.public_instance_methods.map(&:to_s).grep(/^test/).each do |m|
    it("passes ActiveModel::Lint::Tests##{m}") { send m }
  end
end
