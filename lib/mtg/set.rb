require 'mtg/nameable'

module MTG
  class Set

    include Nameable

    # TODO: test
    def initialize(name)
      self.name = name
    end

  end
end