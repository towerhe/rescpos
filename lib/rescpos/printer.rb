module Rescpos
  class Printer
    Msg = 0
    attr_accessor :ip, :port, :socket
    
    def initialize(ip, port)
      @ip = ip
      @port = port
    end    

    def connect
      @socket = TCPSocket.open(@ip, @port)
      init
    end

    def disconnect
      @socket.close
    end


    private
    def send_command(command)
      @socket.send("#{command}", Msg)
    end
    
    def init
      send_command("\x1b\x40")
    end

    def cut
      #TODO
      send_command("\n\n\n\n\x1b\x69")
    end
  end
end
