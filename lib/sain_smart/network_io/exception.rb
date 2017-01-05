
module SainSmart
  module NetworkIO
    class Exception < StandardError
      class Relay < NetworkIO::Exception
        class InvalidType < Exception::Relay; end
      end
    end
  end
end
