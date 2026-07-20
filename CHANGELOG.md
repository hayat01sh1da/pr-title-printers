# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).  
One repository hosts two packages, so releases are tagged per ecosystem (`ruby-vX.Y.Z` for the RubyGems gem, `python-vX.Y.Z` for the PyPI library).

## 0.1.1

The first release published through CI rather than by hand — the packaged code is unchanged from 0.1.0, so upgrading is optional.

### 1. Added

- Automated releases with Trusted Publishing (OIDC, no API keys): `RubyGem - Release` (`rubygem--release.yml`, triggered by `ruby-v*` tags, `rubygems/release-gem@v1`) and `PyPI - Release` (`pypi--release.yml`, triggered by `python-v*` tags, split into a `build` job and a `publish` job bound to the `pypi` environment holding the only `id-token: write` grant).
- Package icon (`assets/spreen-pr-icon.svg`): the origami falcon stooping from the branch tip into the golden merge across the falcon's-eye stone, now shown in the root README.
- Ecosystem-scoped toolchain version files `RubyGem/.ruby-version` (4.0.6) and `PyPI/.python-version` (3.14.6), so each package pins its own runtime rather than inheriting the repository-root files.

### 2. Changed

- Restructured the root README around the story and the quickstart — `Origin of the Name` explaining **stoop + preen = spreen**, then `Quickstart` leading with the no-argument in-branch invocation, with the branch-name convention and the per-language development guides following.
- `RubyGem/Rakefile` now requires `lib/spreen_pr` before `Bundler::GemHelper.install_tasks`, so the release tasks resolve `SpreenPr::VERSION` and `rake release` tags `ruby-vX.Y.Z` correctly.
- `.github/scripts/dependency_report.sh` labels ecosystems by registry name (`PyPI` / `RubyGems` / `npm`) instead of by package-manager binary (`pip` / `gem` / `pnpm`), matching the `RubyGem - *` / `PyPI - *` workflow naming.
- Bumped the development dependency `concurrent-ruby` 1.3.7 → 1.3.8.

## 0.1.0

### 1. Added

- `pr-title` CLI with an optional `BRANCH_NAME` argument defaulting to the current git branch (`git branch --show-current`), a `--format text|json` flag exposing the labels separately from the title (`{"title": ..., "labels": [...]}`), plus `--version` and `--help`, replacing the interactive `rake run_pr_title_printer` / `invoke run_pr_title_printer` prompts as the packaged entry point (Ruby and Python).
- Branch-name validation: a branch that does not match `{user}/{issue}/{category}/{summary}` (hotfix: `{user}/{issue}/hotfix/{category}/{summary}`) now fails with a clear error instead of raising a bare `IndexError` (Python) or printing a broken title (Ruby).
- Ruby gem packaging: `SpreenPr` module under `RubyGem/lib/`, `require 'spreen-pr'` shim, `spreen-pr.gemspec`, `exe/pr-title`, and RBS signatures shipped in the gem.
- Python packaging: `spreen_pr` package under `PyPI/src/`, full PyPI metadata in `pyproject.toml`, `pr-title` console script, and the `py.typed` marker.

### 2. Changed

- Named the packages **`spreen-pr`** per the `spreen-<function>` family naming, following the repository rename from `pr-title-printers` (2026-07-17): RubyGem `spreen-pr` (`SpreenPr`), PyPI `spreen-pr` (`spreen_pr`), CLI `pr-title`.
- Renamed the ecosystem directories and workflow prefixes — `ruby/` → `RubyGem/` (`Ruby - *` → `RubyGem - *` workflows) and `python/` → `PyPI/` (`Python - *` → `PyPI - *`) — aligning the CI and daily-update workflows with the `rubygem--release.yml` / `pypi--release.yml` release-workflow convention.
- Hotfix detection now anchors on the third-from-last segment instead of the third-from-left, so the hotfix special case is recognised regardless of extra leading segments.
- READMEs document the branch-name convention, the opinionated title/label mapping, and the packaged installation (`gem install spreen-pr` / `pipx install spreen-pr`) in-repo instead of only the external HackMD article, and the Actions Status badges point at the renamed repository.

### 3. Removed

- Flat `RubyGem/src/` and `PyPI/src/application.py` script layouts and the interactive Rake/Invoke tasks (superseded by the packages and the CLI above); the `invoke` dependency is gone.
