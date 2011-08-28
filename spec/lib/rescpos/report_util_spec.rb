# coding: utf-8
require 'spec_helper'

class ReportUtilTest
  include Rescpos::ReportUtil
end

describe ReportUtilTest do
  before :each do
    @report_util = ReportUtilTest.new
  end
  it "should return a single split line" do
    @report_util.single_splitline.should ==  "-" * 42
  end

  it "should return a doubleline" do
    @report_util.double_splitline.should == "=" * 42
  end

  it "should print underline" do
    @report_util.underline(13).should == "_" * 13
  end

  it "should return chinese" do
    # TODO
    # @report_util.chinese('菜').should == '\\x{B2CB}'
  end
  
  it "should return a ascii" do 
    @report_util.ascii(4).should == "34"
  end

  it "should return a font size" do
    @report_util.fontsize(4).should == "\x1d\x2134"
  end

  it "should return a gray scale" do
    @report_util.grayscale(4).should == "\x1b\x6d34"
  end

  it "should return a formmat text" do
    @report_util.text('abc', {:font_size => 4, :gray => 4}).should == "\x1d\x2134\x1b\x6d34abc"
  end

  it "should return a formmat label:value" do
    @report_util.labelandvalue('ab', 4).should == "ab:4"
  end

  it "should return a align" do
    @report_util.align('C').should == "\x1b\x61\x01"
    @report_util.align('L').should == "\x1b\x61\x00"
    @report_util.align('R').should == "\x1b\x61\x02"
  end
end
