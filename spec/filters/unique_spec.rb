require './filters/unique'

RSpec.describe Filters::Unique do
  subject { described_class.new }

  describe '#filter_data!' do
    let(:data) do
      {
        '/example' => %w[126.318.035.038 543.910.244.929],
        '/example/uniq' => %w[126.318.035.038 126.318.035.038]
      }
    end

    let(:filtered_data) do
      {
        '/example' => %w[126.318.035.038 543.910.244.929],
        '/example/uniq' => %w[126.318.035.038]
      }
    end

    it 'filters data' do
      expect { subject.filter_data!(data) }.to change { data }.to(filtered_data)
    end
  end

  describe '#to_s' do
    it 'returns a filter description' do
      expect(subject.to_s).to eq('unique views')
    end
  end
end
