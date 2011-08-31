# coding: utf-8
require 'spec_helper'

class ReportUtilTest
  include Rescpos::ReportUtil
end

class BillItemTest
  attr_accessor :name, :quantity 
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
    @report_util.text('abc', {:font_size => ReportUtilTest::FONT_BIG, :gray => 4, :align_type => ReportUtilTest::ALIGN_C}).should == "\x1d\x21\x11\x1b\x6d34\x1b\x61\x01abc"
  end

  it "should return a formatted key and value pair" do
    @report_util.key_value('ab', 4).should == "ab: 4"
  end

  it "should return a align" do
    @report_util.align(ReportUtilTest::ALIGN_C).should == "\x1b\x61\x01"
    @report_util.align(ReportUtilTest::ALIGN_L).should == "\x1b\x61\x00"
    @report_util.align(ReportUtilTest::ALIGN_R).should == "\x1b\x61\x02"
  end

  it "give a hash should return a table" do
    bill_item = {
      :name => 'a',
      :quantity => 2,
    }
    table = @report_util.table([bill_item]) do |t|
      t.config([9])
      t.td([:name, :quantity])
    end
    table.should == "\x1b\x44#{9.chr}\x00a\x092\x09\n"
  end

  it "give a object should return a table" do
    bill_item = BillItemTest.new 
    bill_item.name = 'a'
    bill_item.quantity = 2
    table = @report_util.table([bill_item]) do |t|
      t.config([9])
      t.td([:name, :quantity])
    end
    table.should == "\x1b\x44#{9.chr}\x00a\x092\x09\n"
  end
end
