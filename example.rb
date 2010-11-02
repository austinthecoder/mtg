require File.expand_path('lib/mtg')

a1 = MTG::Card::ManaCost.new("5 r r")

p a1.to_s