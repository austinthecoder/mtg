Gem::Specification.new do |s|
  s.name = 'mtg'
  s.version = '0.0.1'
  s.authors = ['Austin Schneider']
  s.email = "soccer022483@gmail.com"
  s.description = 'Objects such as cards, colors, mana costs, etc relating to the Magic, The Gathering trading card game.'
  s.homepage = "http://github.com/soccer022483/mtg"
  s.summary = 'An MTG gem'
  # s.post_install_message "Thanks for installing!"
  s.files = Dir[
    '[a-zA-Z]*',
    'lib/**/*',
    'spec/**/*'
  ].to_a
  s.test_files = []
  s.require_paths = ["lib"]
  s.extra_rdoc_files = ["README"]
  s.has_rdoc = false

  # s.add_dependency 'msgpack', '0.4.3'
  s.add_development_dependency 'rspec', '2.0.1'
end
