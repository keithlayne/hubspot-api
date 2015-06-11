RSpec.shared_examples_for 'Authentication Strategy' do
  describe '#connection_options' do
    let(:options) { subject.connection_options }

    it 'responds with a Hash' do
      expect(options).to be_a_kind_of(Hash)
    end
  end
end
