module Rescpos
  class Table
    attr_reader :data, :positions, :keys
    def initialize(data)
      @data = data
    end

    def config(positions)
      @positions = positions
    end

    def td(keys)
      @keys = keys
    end
  end
end
