require "spec_helper"

class Rails
  def self.root
    '/path/to/rails'
  end
end

describe Rescpos::Configuration do
  it "has a default template path app/escposes" do
    Rescpos.configuration.template_path.should == File.join(Rails.root, "app/escposes")
  end

  it "could set the path of templates" do
    Rescpos.configure do |config|
      config.template_path = "templates"
    end

    Rescpos.configuration.template_path.should == "templates"
  end
end
