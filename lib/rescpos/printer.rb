module Rescpos
  class Printer
    MSG = 0
    attr_reader :socket

    def initialize(ip, port)
      @socket = TCPSocket.open(ip, port)
      @socket.send("\x1b\x40", MSG)
    end

    def self.open(ip, port)
      printer = new(ip, port)
    end

    def close
      @socket.close
    end

    def print(content)
      @socket.send(content, MSG)
      cut
    end

    def print_report(report)
      print(report.render)
    end

    private
    def send_command(command)
      @socket.send(command, MSG)
    end
    
    def cut
      #TODO
      send_command("\n\n\n\n\x1b\x69")
    end
  end
end
