module MTG
  module Nameable

    def self.included(base)
      base.send(:attr_reader, :name)
      base.send(:alias_method, :to_s, :name)
    end

    def name=(name)
      check_name!(name)
      @name = name.to_s
    end

    private

    def check_name!(name)
    end

  end
end