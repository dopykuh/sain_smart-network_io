require 'socket'
require 'net/http'

module SainSmart
  module NetworkIO
    class Relay
      require 'sain_smart/network_io/relay/16ch'

      TYPES = %w(16CH).freeze

      attr_reader :type, :version

      def initialize(type:, version: 2)
        @type = type if TYPES.include?(type.to_s)
        @version = version
        raise Exception::Relay::InvalidType,
              "Invalid type given: #{type.inspect}" unless @type
      end

      def connection
        @connection ||= NetworkIO::Connection.new(version: version)
      end

      def channel(i)
        case type
        when '16CH'
          SixteenChannel.new(
            channel: i, 
            connection: connection 
          )
        end
      end

      def channels(with_states: false)
        case type
        when '16CH'
          1.upto(16).map do |i|
            SixteenChannel.new(
              channel: i, 
              connection: connection, 
              states: (with_states ? connection.states : {})
            )
          end
        else []
        end
      end
    end
  end
end
