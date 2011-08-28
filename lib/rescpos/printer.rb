module Rescpos
  class Printer
    attr_reader :socket

    def initialize(ip, port)
      @socket = TCPSocket.open(ip, port)
      @socket.send("\x1b\x40", Socket::MSG_OOB)
    end

    def self.open(ip, port)
      printer = new(ip, port)
    end

    def close
      @socket.close
    end

    def print(content, opts={})
      if opts[:encoding]
        content = Iconv.iconv("#{opts[:encoding]}//IGNORE","UTF-8//IGNORE", content)[0]
      end
      @socket.send(content, Socket::MSG_OOB)
      cut
    end

    def print_report(report, opts={})
      print(report.render, opts)
    end

    private
    def send_command(command)
      @socket.send(command, Socket::MSG_OOB)
    end
    
    def cut
      #TODO
      send_command("\n\n\n\n\x1b\x69")
    end
  end
end
