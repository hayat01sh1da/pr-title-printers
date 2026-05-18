import pytest
import glob
import os
import shutil
import sys
from collections.abc import Iterator

sys.path.append('./src')


@pytest.fixture(autouse=True)
def __cleanup_caches__() -> Iterator[None]:
    before = set(
        glob.glob(
            os.path.join(
                '.',
                '**',
                '__pycache__'),
            recursive=True))
    yield
    for pycache in before:
        if os.path.exists(pycache):
            shutil.rmtree(pycache)
