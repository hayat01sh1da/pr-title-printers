# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).  
One repository hosts two packages, so releases are tagged per ecosystem (`ruby-vX.Y.Z` for the RubyGems gem, `python-vX.Y.Z` for the PyPI library).

## [Unreleased]

### 1. Added

- `pr-title` CLI with an optional `BRANCH_NAME` argument defaulting to the current git branch (`git branch --show-current`), a `--format text|json` flag exposing the labels separately from the title (`{"title": ..., "labels": [...]}`), plus `--version` and `--help`, replacing the interactive `rake run_pr_title_printer` / `invoke run_pr_title_printer` prompts as the packaged entry point (Ruby and Python).
- Branch-name validation: a branch that does not match `{user}/{issue}/{category}/{summary}` (hotfix: `{user}/{issue}/hotfix/{category}/{summary}`) now fails with a clear error instead of raising a bare `IndexError` (Python) or printing a broken title (Ruby).
- Ruby gem packaging: `SpreenPr` module under `rubygem/lib/`, `require 'spreen-pr'` shim, `spreen-pr.gemspec`, `exe/pr-title`, and RBS signatures shipped in the gem.
- Python packaging: `spreen_pr` package under `pypi/src/`, full PyPI metadata in `pyproject.toml`, `pr-title` console script, and the `py.typed` marker.

### 2. Changed

- Named the packages **`spreen-pr`** per the `spreen-<function>` family naming, following the repository rename from `pr-title-printers` (2026-07-17): RubyGem `spreen-pr` (`SpreenPr`), PyPI `spreen-pr` (`spreen_pr`), CLI `pr-title`.
- Renamed the ecosystem directories and workflow prefixes — `ruby/` → `rubygem/` (`Ruby - *` → `RubyGem - *` workflows) and `python/` → `pypi/` (`Python - *` → `PyPI - *`) — aligning the CI and daily-update workflows with the `rubygem--release.yml` / `pypi--release.yml` release-workflow convention.
- Hotfix detection now anchors on the third-from-last segment instead of the third-from-left, so the hotfix special case is recognised regardless of extra leading segments.
- READMEs document the branch-name convention, the opinionated title/label mapping, and the packaged installation (`gem install spreen-pr` / `pipx install spreen-pr`) in-repo instead of only the external HackMD article, and the Actions Status badges point at the renamed repository.

### 3. Removed

- Flat `rubygem/src/` and `pypi/src/application.py` script layouts and the interactive Rake/Invoke tasks (superseded by the packages and the CLI above); the `invoke` dependency is gone.
