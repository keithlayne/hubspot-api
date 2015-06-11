require 'spec_helper'
require 'support/active_model'

RSpec.describe Hubspot::Portal do
  subject { Hubspot::DEMO }

  it { is_expected.to respond_to(:connection) }
  it { is_expected.to be_frozen }
end
