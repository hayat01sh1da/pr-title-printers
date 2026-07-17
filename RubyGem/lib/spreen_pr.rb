# frozen_string_literal: true
# rbs_inline: enabled

require_relative 'spreen_pr/version'
require_relative 'spreen_pr/application'
require_relative 'spreen_pr/cli'

# Spreens a pull request — the falcon's stoop, then the preen: derives a PR
# title and labels from a topic branch name shaped
# `{user}/{issue}/{category}/{summary}` (with a hotfix special case) and
# prints them as plain text or JSON.
module SpreenPr
end
