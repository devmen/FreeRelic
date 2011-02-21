Gem::Specification.new do |s|
  s.name = "free_relic"
  s.homepage = "https://github.com/devmen/FreeRelic"
  s.author = "http://devmen.com"
  s.email = "guys@devmen.com"
  s.summary = "Insert FreeRelic summary."
  s.description = "Insert FreeRelic description."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.version = "0.0.1"

  s.add_dependency "mongoid"
end

