require 'socket'

module SainSmart
  module NetworkIO
    class Relay
      require 'sain_smart/network_io/relay/16ch'

      TYPES = %w(16CH).freeze

      attr_reader :type

      def initialize(type:)
        return @type = type if TYPES.include?(type.to_s)
        raise Exception::Relay::InvalidType,
              "Invalid type given: #{type.inspect}"
      end

      def connection
        # TODO: 
        # Introduce connection handling ... (also support V2 shields)
        @tcp_socket ||= TCPSocket.new "192.168.1.4", 3000
      end

      def channels
        case type
        when '16CH'
          1.upto(16).map do |i|
            SixteenChannel.new(channel: i, connection: connection)
          end
        else []
        end
      end
    end
  end
end
