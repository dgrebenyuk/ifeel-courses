class NetworkDevice
  TYPES = [:router, :camera, :laptop].freeze
  $logger = 'I am logger'
  @@network = '192.168.2.0/24'

  attr_accessor :address

  def initialize(address)
    puts "My address is #{address}"
    @address = address
  end

  def ping
    system "ping -c 4 #{@address}"
  end

  def self.scan
    system "sudo arp-scan #{@@network}"
  end
end

class Camera < NetworkDevice
  attr_accessor :port

  def initialize(address, port)
    super(address)
    @port = port
  end
end
