# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotenv/s3/version'

Gem::Specification.new do |spec|
  spec.name          = "dotenv-s3"
  spec.version       = Dotenv::S3::VERSION
  spec.authors       = ["Masashi AKISUE"]
  spec.email         = ["masashi.akisue@aktsk.jp"]

  spec.summary       = "Load your .env file from s3"
  spec.description   = "Load your .env file from s3. Also supports AWS KMS"
  spec.homepage      = "https://github.com/the40san/dotenv-s3"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["dotenv-s3"]

  spec.require_paths = ["lib"]

  spec.add_dependency 'aws-sdk', '~> 2'
  spec.add_dependency 'thor'
  spec.add_dependency 'dotenv-rails'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
