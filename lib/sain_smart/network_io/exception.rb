
module SainSmart
  module NetworkIO
    class Exception < StandardError
      class Relay < NetworkIO::Exception
        class InvalidType < Exception::Relay; end
        class Channel < Exception::Relay
          class InvalidChannel < Relay::Channel; end
        end
      end
    end
  end
end
