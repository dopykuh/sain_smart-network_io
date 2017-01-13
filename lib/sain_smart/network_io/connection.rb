
module SainSmart
  module NetworkIO
    class Connection
      attr_reader :version, :port, :ip

      def initialize(version:, ip: '192.168.1.4', port: 3000)
        @ip = ip
        @port = port
        return @version = version if [1, 2].include? version
        raise Exception::Connection::InvalidVersion,
              "Invalid version given. (1 and 2 supported, #{version.inspect} given)"
      end

      def send(command)
        case version
        when 1
          tcp_connection.write([command].pack('H*'))
        when 2
          http_connection(input: command)
        end
      end

      def v1?
        version == 1
      end

      def v2?
        version == 2
      end

      def states
        x = {}
        return x unless v2?
        4.times do
          ret = Net::HTTP.get('192.168.1.4', '/30000/42')
          x.merge!(
            ret.scan(/Relay-(\d+):\s.*?(ON|OFF)/).to_h
          )
        end
        x.inject({}) do |r, (k, v)|
          r.merge(k.to_i => v == 'ON')
        end
      end

      private

      def tcp_connection
        @tcp_socket ||= TCPSocket.new '192.168.1.4', 3000
      end

      def http_connection(input:)
        Net::HTTP.get(ip.to_s, p("/30000/#{'%02d' % input}"))
      end
    end
  end
end
