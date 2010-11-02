require 'mtg/nameable'

module MTG
  module Card
    class Base

      include Nameable

      def initialize(name, attrs = {})
        self.name = name
        attrs.each { |k, v| send("#{k}=", v) }
      end

      attr_reader :set, :rarity, :number, :mana_cost

      def converted_mana_cost
        mana_cost.converted
      end

      def set=(set_name)
        @set = Set.new(set_name)
      end

      def rarity=(rarity_name)
        @rarity = Rarity.new(rarity_name)
      end

      def number=(number)
        @number = number.to_i
      end

      def mana_cost=(str)
        @mana_cost = ManaCost.new(str)
      end

    end
  end
end