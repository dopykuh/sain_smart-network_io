
module SainSmart
  module NetworkIO
    class Exception < StandardError
      class Connection < NetworkIO::Exception
        class InvalidVersion < Exception::Connection; end
      end
      class Relay < NetworkIO::Exception
        class InvalidType < Exception::Relay; end
        class Unsupported < Exception::Relay; end
        class Channel < Exception::Relay
          class InvalidChannel < Relay::Channel; end
        end
      end
    end
  end
end
