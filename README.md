[![Actions Status: PyPI - CI](https://github.com/hayat01sh1da/spreen-pr/workflows/PyPI%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22PyPI%20-%20CI%22)
[![Actions Status: PyPI - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-pr/workflows/PyPI%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22PyPI%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: RubyGem - CI](https://github.com/hayat01sh1da/spreen-pr/workflows/RubyGem%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22RubyGem%20-%20CI%22)
[![Actions Status: RubyGem - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-pr/workflows/RubyGem%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22RubyGem%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: CodeQL](https://github.com/hayat01sh1da/spreen-pr/workflows/CodeQL/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22CodeQL%22)

## 1. Overview

**spreen-pr** — the falcon's stoop, then the preen — derives a pull request title and labels from a topic branch name.  
It ships as a RubyGems gem and a PyPI library, both installing the same `pr-title` CLI.

```command
$ pr-title hayat01sh1da/issue-89/service/improve-onboarding-flow
[service] Improve Onboarding Flow
```

Part of the `spreen-*` toolchain ([spreen-wiki](https://github.com/hayat01sh1da/spreen-wiki), spreen-pr, [spreen-tracks](https://github.com/hayat01sh1da/spreen-tracks), [spreen-clean](https://github.com/hayat01sh1da/spreen-clean)): tools that take something scattered and return it settled.

## 2. Branch-Name Convention

The tool is opinionated: it assumes topic branches are named

```text
{user}/{issue}/{category}/{summary}
```

with the hotfix special case

```text
{user}/{issue}/hotfix/{category}/{summary}
```

The `{summary}` may be snake_case or kebab-case; each word is capitalised into the title.  
The `{category}` becomes the PR label verbatim; `hotfix` additionally becomes a capitalised `Hotfix` label.

|Branch Name |PR Title |Labels |
|:-|:-|:-|
|`hayat01sh1da/issue-89/service/improve-onboarding-flow` |`[service] Improve Onboarding Flow` |`service` |
|`hayat01sh1da/issue-89/service/improve_onboarding_flow` |`[service] Improve Onboarding Flow` |`service` |
|`hayat01sh1da/issue-90/hotfix/service/fix_login_crash` |`[Hotfix][service] Fix Login Crash` |`Hotfix`, `service` |

Branch names that do not match the shape fail with a clear error instead of producing a broken title.

## 3. Installation

Install from either ecosystem — the CLI is identical:

```command
$ gem install spreen-pr
```

```command
$ pipx install spreen-pr
```

(`pip install spreen-pr` works too if you prefer managing the environment yourself.)

## 4. Usage

```command
$ pr-title [BRANCH_NAME] [options]
```

- With no `BRANCH_NAME`, the current git branch (`git branch --show-current`) is used — the day-to-day case: run it inside your topic branch and paste the output.
- `--format json` prints the title and the labels separately for scripting and CI:

```command
$ pr-title hayat01sh1da/issue-90/hotfix/service/fix_login_crash --format json
{"title":"[Hotfix][service] Fix Login Crash","labels":["Hotfix","service"]}
```

- `--version` prints the version; `--help` prints the usage.

Both packages also expose the logic as a library — see the per-language READMEs below.

## 5. Development

- Common environment: WSL (Ubuntu 25.10)
- [Ruby README](./RubyGem/README.md) / [Ruby sources](./RubyGem/)
- [Python README](./PyPI/README.md) / [Python sources](./PyPI/)

## 6. Background

The story behind the tool: __[Creation of A Shorthand Command to Generate Pull Request Title with Label from a Topic Branch Name](https://hackmd.io/@hayat01sh1da/creation-of-a-shorthand-command-to-generate-pull-request-title-with-label-from-a-topic-branch-name)__
