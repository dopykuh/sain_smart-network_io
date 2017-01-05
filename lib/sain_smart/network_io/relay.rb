
module SainSmart
  module NetworkIO
    class Relay
      TYPES = %w(16CH).freeze

      attr_accessor :type

      def initialize(type:)
        return self.type = type if TYPES.include?(type.to_s)
        raise Exception::Relay::InvalidType,
              "Invalid type given: #{type.inspect}"
      end

      def channels
        case type
        when '16CH'
          # do stuff
        else []
        end
      end
    end
  end
end
