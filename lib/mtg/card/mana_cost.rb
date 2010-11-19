module MTG
  module Card
    class ManaCost

      NON_ZERO_PATTERN = /^(X*)([1-9]\d*)?([BGRUW]*)$/

      def initialize(str = nil)
        str = str.to_s.strip.upcase
        if (str != '') && str != '0' && !(str =~ NON_ZERO_PATTERN)
          raise ArgumentError, "invalid mana cost"
        end
        @str = str
      end

      def to_s
        @str
      end

      def converted
        if ['', '0'].include?(@str)
          0
        else
          @str =~ NON_ZERO_PATTERN
          $2.to_i + $3.length
        end
      end

    end
  end
end