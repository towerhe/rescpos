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
    @report_util.single_splitline.should == "\x1d\x21\x00" +  "-" * 42
  end

  it "should return a doubleline" do
    @report_util.double_splitline.should == "\x1d\x21\x00" + "=" * 42
  end

  it "should print underline" do
    @report_util.underline(13).should == "\x1d\x21\x00" + "_" * 13
  end

  it "should return chinese" do
    # TODO
    # @report_util.chinese('菜').should == '\\x{B2CB}'
  end
  
  it "should return a ascii" do 
    @report_util.ascii(4).should == "34"
  end

  it "should return a font size" do
    @report_util.fontsize(ReportUtilTest::FONT_NORMAL).should == "\x1d\x21\x00"
  end

  it "should return a gray scale" do
    @report_util.grayscale(4).should == "\x1b\x6d34"
  end

  it "should return a formmat text" do
    @report_util.text('abc', {:font_size => ReportUtilTest::FONT_BIG, :gray => 4}).should == "\x1d\x21\x11\x1b\x6d34abc"
  end

  it "should return a formatted key and value pair" do
    @report_util.key_value('ab', 4).should == "ab: 4"
  end

  it "should return a align" do
    @report_util.align('C').should == "\x1b\x61\x01"
    @report_util.align('L').should == "\x1b\x61\x00"
    @report_util.align('R').should == "\x1b\x61\x02"
  end
end
