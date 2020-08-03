#!/usr/bin/env python3
# This is free and unencumbered software released into the public domain.

"""Test cases for the dogma.Longitude class."""

from dogma import Longitude
from pytest import raises

def test_ctor():
    assert(Longitude(0).degrees == 0)
    assert(Longitude(-180).degrees == -180)
    assert(Longitude(180).degrees == 180)
    with raises(ValueError):
        Longitude(-181)
    with raises(ValueError):
        Longitude(181)

if __name__ == '__main__':
    import pytest, sys
    sys.exit(pytest.main([__file__]))
