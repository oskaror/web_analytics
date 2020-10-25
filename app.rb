require './lib/parser'
require './lib/web_analytics'

data = Parser.new.parse_file(ARGV[0])
WebAnalytics.new(data: data).print_stats
WebAnalytics.new(data: data, filter: Filters::Unique.new).print_stats
