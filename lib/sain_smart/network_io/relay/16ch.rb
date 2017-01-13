
module SainSmart
  module NetworkIO
    class Relay
      class SixteenChannel
        COMMANDS = %w(
          580112000000016C 580111000000016B 580112000000026D
          580111000000026C 580112000000036E 580111000000036D 580112000000046F
          580111000000046E 5801120000000570 580111000000056F 5801120000000671
          5801110000000670 5801120000000772 5801110000000771 5801120000000873
          5801110000000872 5801120000000974 5801110000000973 5801120000000A75
          5801110000000A74 5801120000000B76 5801110000000B75 5801120000000C77
          5801110000000C76 5801120000000D78 5801110000000D77 5801120000000E79
          5801110000000E78 5801120000000F7A 5801110000000F79 580112000000107B
          580111000000107A 5801130000FFFF77 580113000000007B 5801100000000069
        ).freeze

        attr_reader :channel, :connection, :states

        def initialize(channel:, connection: nil, states: {})
          @connection = connection
          @states = states
          return @channel = channel if (1..16).cover?(channel)
          raise Exception::Relay::Channel::InvalidChannel,
                "Invalid channel given: #{channel.inspect}, (1..16) supported."
        end

        def on!
          connection.send(on_command)
        end

        def off!
          connection.send(off_command)
        end

        def on?
          raise Exception::Unsupported, 
            "Just supported for version 2" unless connection.v2?
          states[channel] || connection.states[channel]
        end

        def off?
          !on?
        end

        def on_command
          connection.v2? ? (channel*2).pred : COMMANDS[channel.pred * 2]
        end

        def off_command
          connection.v2? ? (channel.pred*2) : COMMANDS[(channel.pred * 2) + 1]
        end
      end
    end
  end
end
