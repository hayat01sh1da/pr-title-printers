import re


class Application:
    """Derives a pull request title and labels from a topic branch name
    shaped ``{user}/{issue}/{category}/{summary}``, with the hotfix special
    case ``{user}/{issue}/hotfix/{category}/{summary}``."""

    EXPECTED_SHAPE = '{user}/{issue}/{category}/{summary}'

    @classmethod
    def run(cls, branch_name: str) -> str:
        return cls(branch_name=branch_name).title

    def __init__(self, branch_name: str) -> None:
        self._branch_name = branch_name
        self._segments = branch_name.split('/')
        self._validate()

    @property
    def title(self) -> str:
        labels = ''.join(f'[{label}]' for label in self.labels)
        return f'{labels} {self.topic}'

    @property
    def labels(self) -> list[str]:
        if self._is_hotfix():
            return [self._segments[-3].capitalize(), self._segments[-2]]
        return [self._segments[-2]]

    @property
    def topic(self) -> str:
        words = re.split(r'[-_]', self._segments[-1])
        return ' '.join(word.capitalize() for word in words)

    def to_dict(self) -> dict[str, object]:
        return {'title': self.title, 'labels': self.labels}

    # private

    def _is_hotfix(self) -> bool:
        return self._segments[-3] == 'hotfix'

    def _validate(self) -> None:
        if len(self._segments) >= 3 and all(self._segments):
            return
        raise ValueError(
            f'Branch name `{self._branch_name}` does not match the expected '
            f'`{self.EXPECTED_SHAPE}` shape')
