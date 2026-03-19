## Supported Versions

- Only the latest workflow on `master` receives security updates. Regenerate your CLI helper from HEAD before filing reports.
- Legacy templates or forks are unsupported unless the issue reproduces on the stack described below.

## Ecosystem & Compatibility

| Component            | Version(s) / Tooling                | Notes |
| -------------------- | ---------------------------------- | ----- |
| OS baseline          | WSL (Ubuntu 24.04.3 LTS)           | Matches the documented development environment. |
| Ruby automation      | Ruby 4.0.2 (`.ruby-version`)       | Depends on Ruby stdlib plus any gems declared inside `ruby/`. |
| Python automation    | CPython 3.14.3 (`.python-version`) | Uses Python stdlib; introduce `requirements.txt` if third-party libs are added. |

## Backward Compatibility

- CLI flags and branch-name parsing helpers strive to remain backward compatible within a release line (Ruby 4.0.x / Python 3.14.x). If a breaking change is required, it will be documented in the changelog before release.
- Interpreter versions older than those listed in the Ecosystem table above (for example, prior major releases) are **not supported**, and security fixes are not backported to them.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
