require "spec_helper"

describe Rescpos::Configuration do
  it "could set the paths of templates" do
    Rescpos.configure do |config|
      config.template_paths << "templates"
    end

    Rescpos.configuration.template_paths.should be_include("templates")
  end
end
