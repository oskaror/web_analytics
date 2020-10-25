require './filters/default'
require './filters/unique'

class WebAnalytics
  def initialize(data:, filter: Filters::Default.new)
    @data = data
    @filter = filter
  end

  def print_stats
    filter.filter_data!(data)
    sorted_data = data.sort_by { |_, e| -e.size }
    sorted_data.each { |p, e| puts "#{p} #{e.size} #{filter.to_s}" }
  end

  private

  attr_reader :data
  attr_reader :filter
end
