module MTG
  module Card
    class Rarity

      include Comparable

      NAMES = %w(common uncommon rare mythic\ rare)

      def initialize(name)
        name = name.to_s.strip.downcase
        unless NAMES.include?(name)
          raise ArgumentError, "name is not one of: #{NAMES.inspect}"
        end
        @name = name
      end

      def to_s(format = nil)
        if format == :short
          {'common' => 'C', 'uncommon' => 'U', 'rare' => 'R', 'mythic rare' => 'MR'}[@name]
        else
          @name
        end
      end

      def <=>(rarity)
        NAMES.index(to_s) <=> NAMES.index(rarity.to_s)
      end

      def eql?(rarity)
        self.class == rarity.class && self == rarity
      end

      def hash
        @name.hash
      end

      NAMES.each do |name|
        define_method(name.gsub(/\s/, '_') + '?') do
          @name == name
        end
      end

    end
  end
end