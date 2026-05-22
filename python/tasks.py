import os
import sys

from invoke import Context, task

_ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(_ROOT, 'src'))

from application import Application  # noqa: E402


@task
def run_pr_title_printer(c: Context) -> None:
    """Run PR Title Printer"""
    print('Provide the branch name you would like to generate a PR '
          'title for')
    branch_name = input().strip()

    print(Application(branch_name=branch_name).run())


@task(default=True)
def test(c: Context) -> None:
    """Run all tests"""
    c.run('pytest .')
