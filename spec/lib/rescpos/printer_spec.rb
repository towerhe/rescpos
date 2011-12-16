# coding: utf-8
require 'spec_helper'

class TitledReport < Rescpos::Report
  attr_reader :title

  def initialize(title = "")
    @title = title
  end
end

module Rescpos
  describe Printer do
    before(:each) do
      TCPSocket.should_receive(:open).with("192.168.1.3", 9100).and_return(socket)
      socket.should_receive(:send).with("\x1b\x40", 0)
    end

    let(:socket) { Object.new }

    it "prints the a rendered report" do
      printer = Printer.open("192.168.1.3", 9100)

      socket.should_receive(:send).with("A title", 0)
      printer.should_receive(:send).with(:partial_cut)
      printer.print(TitledReport.new("A title").render(template: "<%= @title %>"))
    end

    it "prints the report" do
      Rescpos.configure do |config|
        config.template_path = File.join(File.dirname(__FILE__), "../../reports")
      end
      printer = Printer.open("192.168.1.3", 9100)

      socket.should_receive(:send).with("A title\n", 0)
      printer.should_receive(:send).with(:full_cut)
      printer.print_report(TitledReport.new("A title"), cut_mode: :full_cut)
    end
  end
end
