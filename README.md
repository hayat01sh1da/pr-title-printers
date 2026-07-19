[![Actions Status: PyPI - CI](https://github.com/hayat01sh1da/spreen-pr/workflows/PyPI%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22PyPI%20-%20CI%22)
[![Actions Status: PyPI - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-pr/workflows/PyPI%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22PyPI%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: RubyGem - CI](https://github.com/hayat01sh1da/spreen-pr/workflows/RubyGem%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22RubyGem%20-%20CI%22)
[![Actions Status: RubyGem - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-pr/workflows/RubyGem%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22RubyGem%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: CodeQL](https://github.com/hayat01sh1da/spreen-pr/workflows/CodeQL/badge.svg)](https://github.com/hayat01sh1da/spreen-pr/actions?query=workflow%3A%22CodeQL%22)

# spreen-pr

<img src="./assets/spreen-pr-icon.svg" align="center" width="300" alt="spreen-pr: an origami falcon stooping from the branch tip into the golden merge across a falcon's-eye stone, leaving it preened clean" />

Derives a pull request title and labels from a topic branch name that follows the `{user}/{issue}/{category}/{summary}` convention, ready to paste into the PR form.

The tool ships twice with identical behaviour: as the RubyGems gem **`spreen-pr`** and as the PyPI library **`spreen-pr`**.  
Both install the same `pr-title` command.

## 1. Origin of the Name

**stoop + preen = spreen** — dive on the scattered branch name, then groom it into a polished title.  
The icon tells the story: the origami falcon (隼 /hayabusa/) mid-stoop across the falcon's-eye stone, diving from the topic branch's tip commit into the golden merge, gleams of the preen sparkling in its wake — the pull request, settled and clean.

The full legend behind the `spreen` name — the falcon man, the stone in the rice field, and the falcon's-eye quartz — is told in [spreen-wiki's README](https://github.com/hayat01sh1da/spreen-wiki#1-origin-of-the-name).  
spreen-pr is part of the `spreen-*` toolchain ([spreen-wiki](https://github.com/hayat01sh1da/spreen-wiki), spreen-pr, [spreen-tracks](https://github.com/hayat01sh1da/spreen-tracks), [spreen-clean](https://github.com/hayat01sh1da/spreen-clean)): tools that take something scattered and return it settled.

## 2. Quickstart

Install one of the two implementations:

```command
$ gem install spreen-pr
```

```command
$ pipx install spreen-pr
```

(`pip install spreen-pr` works too if you prefer managing the environment yourself.)

Run it inside your topic branch — with no argument the current git branch (`git branch --show-current`) is used, which is the day-to-day case:

```command
$ git switch hayat01sh1da/issue-89/service/improve-onboarding-flow
$ pr-title
[service] Improve Onboarding Flow
```

Or pass a branch name explicitly; `--format json` prints the title and the labels separately for scripting and CI:

```command
$ pr-title hayat01sh1da/issue-90/hotfix/service/fix_login_crash --format json
{"title":"[Hotfix][service] Fix Login Crash","labels":["Hotfix","service"]}
```

Run `pr-title --help` for the full flag list; `--version` prints the version.  
Both packages also expose the logic as a library — see the per-language READMEs in § 4.

## 3. Branch-Name Convention

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

## 4. Development

- Common environment: WSL (Ubuntu 25.10)
- [Ruby implementation](./RubyGem/README.md) — gem sources under [./RubyGem/](./RubyGem/)
- [Python implementation](./PyPI/README.md) — package sources under [./PyPI/](./PyPI/)
- Release notes live in [CHANGELOG.md](./CHANGELOG.md)

## 5. Background

The story behind the tool: __[Creation of A Shorthand Command to Generate Pull Request Title with Label from a Topic Branch Name](https://hackmd.io/@hayat01sh1da/creation-of-a-shorthand-command-to-generate-pull-request-title-with-label-from-a-topic-branch-name)__
