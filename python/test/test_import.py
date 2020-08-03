#!/usr/bin/env python3
# This is free and unencumbered software released into the public domain.

"""Test cases for the dogma module."""

from dogma import *  # NOQA: F401, F403

if __name__ == '__main__':
    import pytest, sys
    sys.exit(pytest.main([__file__]))
