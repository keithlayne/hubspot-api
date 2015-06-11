require 'spec_helper'
require 'support/active_model'

RSpec.describe Hubspot::Form do
  subject { Hubspot::DEMO.forms.new }

  it_behaves_like ActiveModel

  let(:portal) { Hubspot::DEMO }

  describe '.all' do
    let!(:all) { portal.forms.all }

    VCR.use_cassette 'Form.all' do
      it 'makes a request to the correct endpoint'
    end
  end

  describe '.find' do
    it 'makes a request to the correct endpoint'
  end

  describe '.new' do
  end

  describe '.create' do
    it 'makes a request to the correct endpoint'
  end

  describe '#save' do
    it 'makes a request to the correct endpoint'
  end

  describe '#update' do
    it 'makes a request to the correct endpoint'
  end

  describe '#delete' do
    it 'makes a request to the correct endpoint'
  end

  describe '#form_fields' do
  end

  describe '#form_field' do
  end
end
