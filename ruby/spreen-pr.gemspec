# frozen_string_literal: true

require_relative 'lib/spreen_pr/version'

Gem::Specification.new do |spec|
  spec.name    = 'spreen-pr'
  spec.version = SpreenPr::VERSION
  spec.authors = ['hayat01sh1da']

  spec.summary     = 'Spreen your pull request: print a PR title with labels derived from the topic branch name.'
  spec.description = "Spreen — the falcon's stoop, then the preen. Derives a pull request title and labels " \
                     'from a topic branch name shaped {user}/{issue}/{category}/{summary} (with a hotfix ' \
                     'special case) and prints them as plain text or JSON via the pr-title CLI, defaulting ' \
                     'to the current git branch.'
  spec.homepage = 'https://github.com/hayat01sh1da/spreen-pr'
  spec.license  = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = spec.homepage
  spec.metadata['changelog_uri']         = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata['bug_tracker_uri']       = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['exe/*', 'lib/**/*.rb', 'sig/**/*.rbs', 'README.md', 'LICENSE.txt']
  spec.bindir        = 'exe'
  spec.executables   = ['pr-title']
  spec.require_paths = ['lib']
end
