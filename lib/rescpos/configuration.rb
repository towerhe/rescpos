module Rescpos
  class Configuration
    attr_accessor :template_paths

    def initialize
      @template_paths = []
    end
  end
end
