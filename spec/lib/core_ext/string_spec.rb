require 'spec_helper'

describe String do
  it 'underscores the camelized string' do
    "SimpleTitled".underscore.should == 'simple_titled'
  end
end
