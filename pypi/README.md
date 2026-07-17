## 1. Environment

- Python 3.14.6
- pip 26.1.2

## 2. Installation

```command
$ pipx install spreen-pr
```

(`pip install spreen-pr` works too if you prefer managing the environment yourself.)

For development, install the dependencies via requirements.txt:

```command
$ pip install -r requirements.txt
```

## 3. Execution

```command
$ pr-title hayat01sh1da/issue-89/service/improve-onboarding-flow
[service] Improve Onboarding Flow
```

With no argument, the current git branch is used:

```command
$ git switch hayat01sh1da/issue-90/hotfix/service/fix_login_crash
$ pr-title
[Hotfix][service] Fix Login Crash
```

`--format json` exposes the labels separately for scripting and CI:

```command
$ pr-title hayat01sh1da/issue-90/hotfix/service/fix_login_crash --format json
{"title": "[Hotfix][service] Fix Login Crash", "labels": ["Hotfix", "service"]}
```

As a library:

```python
from spreen_pr import Application

Application.run(branch_name='hayat01sh1da/issue-89/service/improve-onboarding-flow')
# => '[service] Improve Onboarding Flow'

application = Application(branch_name='hayat01sh1da/issue-90/hotfix/service/fix_login_crash')
application.title   # => '[Hotfix][service] Fix Login Crash'
application.labels  # => ['Hotfix', 'service']
```

## 4. Unit Test

```command
$ pytest
============================= test session starts ==============================
platform linux -- Python 3.14.6, pytest-9.1.1, pluggy-1.6.0
rootdir: spreen-pr/pypi
configfile: pyproject.toml
collected 15 items

test/test_application.py .........                                       [ 60%]
test/test_cli.py ......                                                  [100%]

============================== 15 passed in 0.12s ===============================
```

## 5. Static Code Analysis

```command
$ flake8 .
$ autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive .
$ autopep8 --in-place --aggressive --aggressive --recursive .
```

## 6. Type Checks

```command
$ mypy .
Success: no issues found in 6 source files
```

## 7. Build

```command
$ python -m build
$ pipx install ./dist/spreen_pr-0.1.0-py3-none-any.whl
```
