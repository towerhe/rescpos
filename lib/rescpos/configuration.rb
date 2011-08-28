module Rescpos
  class Configuration
    attr_accessor :template_path

    def initialize
      if Object.const_defined?(:Rails)
        @template_path = File.join(Rails.root, "app/escposes")
      end
    end
  end
end
