## 1. Environment

- Python 3.14.5

## 2. Install Libraries via requirements.txt

```command
$ pip install -r requirements.txt
```

## 3. Execution

```command
$ invoke run_pr_title_printer
Provide the branch name you would like to generate a PR title for
hayat01sh1da/issue-num/category/pr-title
[category] Pr Title
```

## 4. Unit Test

```command
$ invoke
============================= test session starts ==============================
platform linux -- Python 3.14.5, pytest-9.0.3, pluggy-1.6.0
rootdir: pr-title-printers/python
configfile: pyproject.toml
collected 2 items

test/test_application.py ..                                              [100%]

============================== 2 passed in 0.21s ===============================
```

## 5. Static Code Analysis

```command
$ flake8 .
./src/application.py:10:80: E501 line too long (105 > 79 characters)
$ autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive .
$ autopep8 --in-place --aggressive --aggressive --recursive .
```

## 6. Type Checks

```command
$ mypy .
Success: no issues found in 4 source files
```
