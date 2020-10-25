require './lib/parser'

RSpec.describe Parser do
  subject { described_class.new }

  describe '#parse_file' do
    let(:path) { 'spec/fixtures/webserver.log' }
    let(:data) do
      {
        '/contact/1' => %w[184.123.665.067],
        '/example' => %w[184.123.665.067 184.123.665.067]
      }
    end

    it 'parses file' do
      expect(subject.parse_file(path)).to eq(data)
    end

    context 'when a path is invalid' do
      let(:path) { 'invalid' }

      it 'raises an argument error' do
        expect { subject.parse_file(path) }.to raise_error(ArgumentError)
      end
    end
  end
end
