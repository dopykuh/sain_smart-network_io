
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

        attr_reader :channel, :connection

        def initialize(channel:, connection: nil)
          # TODO: handle connection
          @connection = connection
          return @channel = channel if (1..16).cover?(channel)
          raise Exception::Relay::Channel::InvalidChannel,
                "Invalid channel given: #{channel.inspect}, (1..16) supported."
        end

        def on!
          connection.write(on_command)
        end

        def off!
          connection.write(off_command)
        end

        def on_command
          [COMMANDS[(channel - 1) * 2]].pack('H*')
        end

        def off_command
          [COMMANDS[((channel - 1) * 2) + 1]].pack('H*')
        end
      end
    end
  end
end
