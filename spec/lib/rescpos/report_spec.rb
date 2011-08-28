require 'spec_helper'

class TitledReport < Rescpos::Report
  attr_reader :title

  def initialize(title = '')
    @title = title
  end
end

describe Rescpos::Report do
  before(:all) do
    Rescpos.configure do |config|
      config.template_path = File.join(File.dirname(__FILE__), "../../reports")
    end
  end

  let(:report) { report = TitledReport.new('A title') }

  it 'renders the report with a string template' do
    report.render(:template => '<%= @title %>').should == 'A title'
  end

  it 'renders the report using default template file' do
    report.render.should == 'A title'
  end
end
