import re


class Application:
    """Prints a PR title derived from the current git branch name."""

    @classmethod
    def run(cls, branch_name: str = '') -> str:
        return cls(branch_name=branch_name)._run()

    def __init__(self, branch_name: str = '') -> None:
        self._branch_name = branch_name

    # private

    def _run(self) -> str:
        string_array = self._branch_name.split('/')
        tail = string_array[-3:] if string_array[2] == 'hotfix' \
            else string_array[-2:]
        *prefixes, branch_topic = tail
        return f'{self._labels(prefixes)}{self._pr_topic(branch_topic)}'

    def _labels(self, prefixes: list[str]) -> str:
        if 'hotfix' in prefixes:
            prefixes[0] = prefixes[0].capitalize()
            return f'[{"][".join(prefixes)}] '
        return f'[{prefixes[-1]}] '

    def _pr_topic(self, branch_topic: str) -> str:
        return ' '.join(word.capitalize() for word in re.split(r'[-_]', branch_topic))
