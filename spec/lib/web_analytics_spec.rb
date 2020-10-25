require './lib/web_analytics'

RSpec.describe WebAnalytics do
  let(:data) do
    {
      '/example' => %w[126.318.035.038 929.398.951.889],
      '/contact/1' => %w[126.318.035.038]
    }
  end
  let(:filter) do
    instance_double(Filters::Default, filter_data!: data, to_s: 'views')
  end

  subject { described_class.new(data: data, filter: filter) }

  describe '#print_stats' do
    let(:expected_output) { "/example 2 views\n/contact/1 1 views\n" }

    it 'prints page views' do
      expect { subject.print_stats }.to output(expected_output).to_stdout
    end
  end
end
