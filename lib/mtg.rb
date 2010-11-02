$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module MTG
end

require 'mtg/card'
require 'mtg/color'
require 'mtg/set'