module MTG
  module Card
    class Rarity

      include Comparable

      NAMES = %w(common uncommon rare mythic\ rare)

      def initialize(name)
        unless NAMES.include?(name)
          raise ArgumentError, "#{name.inspect} is not one of: #{NAMES.inspect}"
        end
        @name = name.to_s
      end

      attr_reader :name
      alias_method :to_s, :name

      def <=>(rarity)
        NAMES.index(name) <=> NAMES.index(rarity.name)
      end

      def eql?(rarity)
        self.class == rarity.class && self == rarity
      end

      def hash
        name.hash
      end

      NAMES.each do |name|
        define_method(name.gsub(/\s/, '_') + '?') do
          self.name == name
        end
      end

    end
  end
end