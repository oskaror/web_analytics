module Filters
  class Unique
    def filter_data!(data)
      data.transform_values(&:uniq!)
    end

    def to_s
      'unique views'
    end
  end
end
