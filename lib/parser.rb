require 'csv'

class Parser
  COL_SEP = ' '.freeze

  def parse_file(path)
    raise_error if path.nil? || !File.exists?(path)

    data = CSV.read(path, { col_sep: COL_SEP })
    data.group_by(&:shift).transform_values(&:flatten)
  end

  private

  attr_reader :path

  def raise_error
    fail ArgumentError, 'Invalid path'
  end
end
