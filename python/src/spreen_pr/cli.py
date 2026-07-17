"""Command line interface behind the `pr-title` executable:
`pr-title [BRANCH_NAME] [--format text|json]`."""

import argparse
import json
import subprocess
import sys

from . import __version__
from .application import Application


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog='pr-title',
        description='Print a pull request title with labels derived from '
                    'a topic branch name.')
    parser.add_argument(
        'branch_name', nargs='?', metavar='BRANCH_NAME',
        help='Topic branch name (default: the current git branch)')
    parser.add_argument(
        '--format', choices=('text', 'json'), default='text',
        help='Output format (default: text)')
    parser.add_argument('--version', action='version', version=__version__)
    return parser


def _current_git_branch() -> str:
    try:
        return subprocess.run(
            ['git', 'branch', '--show-current'],
            capture_output=True, text=True, check=False).stdout.strip()
    except OSError:
        return ''


def main(argv: list[str] | None = None) -> int:
    args = _build_parser().parse_args(argv)
    try:
        branch_name = args.branch_name or _current_git_branch()
        if not branch_name:
            raise ValueError('No branch name given and the current git '
                             'branch could not be detected')
        application = Application(branch_name=branch_name)
    except ValueError as error:
        print(error, file=sys.stderr)
        return 1
    if args.format == 'json':
        print(json.dumps(application.to_dict()))
    else:
        print(application.title)
    return 0


if __name__ == '__main__':
    sys.exit(main())
