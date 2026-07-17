import pytest

from spreen_pr import Application


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
        (
            'hayat01sh1da/issue-xxxxx/service/this-is-a-test-branch',
            '[service] This Is A Test Branch',
        ),
    ],
)
def test_run(branch_name: str, expected: str) -> None:
    assert Application.run(branch_name=branch_name) == expected


@pytest.mark.parametrize(
    ('branch_name', 'expected'),
    [
        (
            'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch',
            ['service'],
        ),
        (
            'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch',
            ['Hotfix', 'service'],
        ),
    ],
)
def test_labels(branch_name: str, expected: list[str]) -> None:
    assert Application(branch_name=branch_name).labels == expected


def test_to_dict() -> None:
    branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'

    assert Application(branch_name=branch_name).to_dict() == {
        'title': '[Hotfix][service] This Is A Test Branch',
        'labels': ['Hotfix', 'service'],
    }


@pytest.mark.parametrize(
    'branch_name',
    [
        'main',
        'fix/typo',
        'hayat01sh1da//service/this_is_a_test_branch',
        '',
    ],
)
def test_run_raises_on_an_unexpected_branch_name(branch_name: str) -> None:
    with pytest.raises(ValueError, match='does not match the expected'):
        Application.run(branch_name=branch_name)
