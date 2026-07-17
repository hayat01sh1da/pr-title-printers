import json

import pytest

from spreen_pr import __version__
from spreen_pr.cli import main


def test_text_format(capsys: pytest.CaptureFixture[str]) -> None:
    status = main(['hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'])

    assert status == 0
    assert capsys.readouterr().out == '[service] This Is A Test Branch\n'


def test_json_format(capsys: pytest.CaptureFixture[str]) -> None:
    status = main([
        'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch',
        '--format', 'json',
    ])

    assert status == 0
    assert json.loads(capsys.readouterr().out) == {
        'title': '[Hotfix][service] This Is A Test Branch',
        'labels': ['Hotfix', 'service'],
    }


def test_invalid_branch_name(capsys: pytest.CaptureFixture[str]) -> None:
    status = main(['main'])

    assert status == 1
    assert 'does not match the expected' in capsys.readouterr().err


def test_invalid_format() -> None:
    with pytest.raises(SystemExit):
        main(['hayat01sh1da/issue-xxxxx/service/topic', '--format', 'yaml'])


def test_version(capsys: pytest.CaptureFixture[str]) -> None:
    with pytest.raises(SystemExit) as excinfo:
        main(['--version'])

    assert excinfo.value.code == 0
    assert capsys.readouterr().out == f'{__version__}\n'
