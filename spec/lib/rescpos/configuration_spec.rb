require "spec_helper"

describe Rescpos::Configuration do
  it "could set the paths of templates" do
    Rescpos.configure do |config|
      config.template_path = "templates"
    end

    Rescpos.configuration.template_path.should == "templates"
  end
end
