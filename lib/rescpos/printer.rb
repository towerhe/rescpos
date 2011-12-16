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

    def print(content, opts = { :encoding => 'GBK', :cut_mode => :partial_cut })
      content = Iconv.iconv("#{ opts[:encoding] || 'GBK' }//IGNORE","UTF-8//IGNORE", content)[0]
      @socket.send(content, SOCK_FLAG)
      send(opts[:cut_mode] || :partial_cut)
    end

    def print_report(report, opts={})
      print(report.render, opts)
    end

    private
    def send_command(command)
      @socket.send(command, SOCK_FLAG)
    end
    
    def partial_cut
      send_command("\n\n\n\n\x1d\x561\x0c")
    end

    def full_cut
      send_command("\n\n\n\n\x1b\x69\x0c")
    end
  end
end
