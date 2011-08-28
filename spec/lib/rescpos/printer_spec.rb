# coding: utf-8
require 'spec_helper'
describe Rescpos::Printer do
  before :each do
    @printer = Rescpos::Printer.new('192.168.1.3', '9100')
  end

  it "should initially have a ip: 192.168.1.3" do
    @printer.ip == '192.168.1.3'
  end

  it "should initially have a port: 9100" do
    @printer.port == '9100'
  end

  it "should connected" do
    TCPSocket.should_receive(:open).with(@printer.ip, @printer.port) 
    @printer.should_receive(:init)
    @printer.connect
  end
end
