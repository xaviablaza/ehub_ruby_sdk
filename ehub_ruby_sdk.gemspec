# frozen_string_literal: true

require_relative "lib/ehub_ruby_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "ehub_ruby_sdk"
  spec.version       = EhubRubySdk::VERSION
  spec.authors       = ["Xavier Luis Ablaza"]
  spec.email         = ["25378966+xaviablaza@users.noreply.github.com"]

  spec.summary       = "Ruby wrapper for Ehub API"
  spec.homepage      = "https://github.com/xaviablaza/ehub_ruby_sdk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/xaviablaza/ehub_ruby_sdk"
  spec.metadata["changelog_uri"] = "https://github.com/xaviablaza/ehub_ruby_sdk/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', "~> 5.0.7.2"
  spec.add_dependency 'gem_config'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "prettier"
end
