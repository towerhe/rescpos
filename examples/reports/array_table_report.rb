# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))

require 'rescpos'

class ArrayTableReport < Rescpos::Report
  attr_reader :arry

  def initialize
    @arry = [["AAA", "BBB"], ["CCC", "DDD"]]
  end
end
