Gem::Specification.new do |s|
  s.name = 'mtg'
  s.version = '0.0.1'
  # s.authors = []
  # s.email = ""
  # s.description = ''
  # s.homepage = ""
  s.summary = ''
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
