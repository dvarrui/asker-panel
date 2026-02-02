# frozen_string_literal: true

require_relative "lib/asker/panel/version"

Gem::Specification.new do |s|
  s.name = "asker-panel"
  s.version = Asker::Panel::VERSION
  s.summary = "AskerPanel is the graphical frontend for Asker"
  s.description = "AskerPanel is the graphical frontend for Asker"

  s.extra_rdoc_files = ["README.md", "LICENSE"] + Dir.glob(File.join("docs", "**", "*.md"))

  s.license = "GPL-3.0"
  s.authors = ["David Vargas Ruiz"]
  s.email = "teuton.software@protonmail.com"
  s.homepage = "https://github.com/dvarrui/asker-panel"

  s.executables << "asker-panel"
  s.files = Dir.glob(File.join("lib", "**", "*.*"))
  s.required_ruby_version = ">= 3.0.0" # 3.2.0

  # Uncomment to register a new dependency of your gem
  s.add_dependency "libui", "~> 0.1"
  # s.add_runtime_dependency "libui", "~> 0.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
