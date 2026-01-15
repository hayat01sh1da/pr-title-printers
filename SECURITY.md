# Security Policy

## Supported Versions

- Only the latest workflow on `master` receives security updates. Regenerate
	your CLI helper from HEAD before filing reports.
- Legacy templates or forks are unsupported unless the issue reproduces on the
	stack described below.

## Ecosystem & Compatibility

| Component            | Version(s) / Tooling                | Notes |
| -------------------- | ---------------------------------- | ----- |
| OS baseline          | WSL (Ubuntu 24.04.3 LTS)           | Matches the documented development environment. |
| Ruby automation      | Ruby 4.0.1 (`.ruby-version`)       | Depends on Ruby stdlib plus any gems declared inside `ruby/`. |
| Python automation    | CPython 3.14.2 (`.python-version`) | Uses Python stdlib; introduce `requirements.txt` if third-party libs are added. |

## Backward Compatibility

- CLI flags and branch-name parsing helpers strive to remain backward
	compatible within a release line (Ruby 4.0.x / Python 3.14.x). If a breaking
	change is required, it will be documented in the changelog before release.
- Older major interpreter versions (Ruby 3.x, Python 3.13 and below) are **not
	supported**, and security fixes are not backported to them.

## Reporting a Vulnerability

Report vulnerabilities privately via:

1. GitHub Security Advisories (**Security → Report a vulnerability**) —
	 preferred.
2. Email `security@project.org` with the failing branch naming convention, CLI
	 parameters, and reproduction steps.

Acknowledgement occurs within **3 business days**; updates are provided at
least every **7 business days** until resolution.
