import pytest

from application import Application


@pytest.mark.parametrize(
    ('branch_name', 'expected'),
    [
        (
            'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch',
            '[service] This Is A Test Branch',
        ),
        (
            'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch',
            '[Hotfix][service] This Is A Test Branch',
        ),
    ],
)
def test_run(branch_name: str, expected: str) -> None:
    assert Application(branch_name=branch_name).run() == expected
