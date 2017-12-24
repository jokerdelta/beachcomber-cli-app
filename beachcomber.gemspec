
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "beachcomber/version"

Gem::Specification.new do |spec|
  spec.name          = "beachcomber"
  spec.version       = Beachcomber::VERSION
  spec.authors       = ["'Jerry Boyce'"]
  spec.email         = ["'jokerdelta@yahoo.com'"]

  spec.summary       = %q{Beachcomber is a lightweight CLI application that allows the user to select the state, region, and beach where they want to beachcomb and it displays high and low tide predictions for that location. Happy beachcombing!}
  spec.description   = %q{Beachcomber is a gem designed to help beachcombers perfect their craft by providing the daily high and low tide preditions.}
  spec.homepage      = "https://github.com/jokerdelta/beachcomber-cli-app.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency"nokogiri"
  spec.add_development_dependency"pry"
end
