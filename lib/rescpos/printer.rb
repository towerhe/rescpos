module Rescpos
  class Printer
    attr_reader :socket
    SOCK_FLAG = 0

    def initialize(ip, port)
      @socket = TCPSocket.open(ip, port)
      @socket.send("\x1b\x40", SOCK_FLAG)
    end

    def self.open(ip, port)
      printer = new(ip, port)
    end

    def close
      @socket.close
    end

    def print(content, opts={:encoding => 'GBK'})
      content = Iconv.iconv("#{opts[:encoding]}//IGNORE","UTF-8//IGNORE", content)[0]
      @socket.send(content, SOCK_FLAG)
      cut
    end

    def print_report(report, opts={})
      print(report.render, opts)
    end

    private
    def send_command(command)
      @socket.send(command, SOCK_FLAG)
    end
    
    def cut
      #TODO
      send_command("\n\n\n\n\x1b\x69")
    end
  end
end
