"""Spreens a pull request — the falcon's stoop, then the preen: derives a
PR title and labels from a topic branch name shaped
``{user}/{issue}/{category}/{summary}`` (with a hotfix special case) and
prints them as plain text or JSON."""

from .application import Application

__version__ = '0.1.0'

__all__ = [
    'Application',
    '__version__',
]
