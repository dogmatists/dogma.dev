#!/usr/bin/env python3
# This is free and unencumbered software released into the public domain.

"""Test cases for the dogma.Latitude class."""

from dogma import Latitude
from pytest import raises

def test_ctor():
    assert(Latitude(0).degrees == 0)
    assert(Latitude(-90).degrees == -90)
    assert(Latitude(90).degrees == 90)
    with raises(ValueError):
        Latitude(-91)
    with raises(ValueError):
        Latitude(91)

if __name__ == '__main__':
    import pytest, sys
    sys.exit(pytest.main([__file__]))
