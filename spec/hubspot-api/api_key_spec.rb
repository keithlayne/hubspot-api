require 'spec_helper'
require 'support/auth_strategy'

RSpec.describe Hubspot::ApiKey do
  it_behaves_like 'Authentication Strategy'

  it 'defaults to "demo"' do
    expect(subject.api_key).to eq 'demo'
  end

  describe '#connection_options' do
    subject { Hubspot::ApiKey.new('thisisanawesomekey').connection_options }

    it { is_expected.to have_key(:params) }

    it 'has a nested key :hapikey' do
      expect(subject[:params]).to have_key(:hapikey)
    end

    it 'sets the :hapikey value to the given key' do
      expect(subject[:params][:hapikey]).to eq 'thisisanawesomekey'
    end
  end
end
