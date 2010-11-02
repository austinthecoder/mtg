module MTG
  class Color

    # TODO: test
    NAMES = {
      'B' => 'black',
      'G' => 'green',
      'R' => 'red',
      'U' => 'blue',
      'W' => 'white'
    }

    # TODO: test
    def initialize(name)
      self.name = name
    end

    attr_reader :name
    alias_method :to_s, :name

    # TODO: test
    def abbr
      NAMES.key(name)
    end

    private

    # TODO: test
    def name=(name)
      name = name.to_s.strip
      @name = case name
      when /^(#{NAMES.keys.join('|')})$/i
        NAMES[name.upcase]
      when /^(#{NAMES.values.join('|')})$/i
        name.downcase
      else
        raise ArgumentError, "name is not one of: #{(NAMES.values + NAMES.keys).inspect}"
      end
    end

  end
end