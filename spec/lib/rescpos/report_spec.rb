require 'spec_helper'

class TitledReport < Rescpos::Report
  attr_reader :title

  def initialize(title = '')
    @title = title
  end
end

describe Rescpos::Report do
  it 'renders the report' do
    report = TitledReport.new('A title')
    report.render(:template => '<%= @title %>').should == 'A title'
  end
end
