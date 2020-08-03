#!/usr/bin/env python3
# This is free and unencumbered software released into the public domain.

"""Test cases for the dogma.Angle class."""

from dogma import Angle
from math import pi
from pytest import raises

def test_ctor():
    with raises(ValueError):
        Angle()

def test_degrees():
    assert(Angle(degrees=0).degrees == 0)
    assert(Angle(degrees=90).degrees == 90)
    assert(Angle(degrees=180).degrees == 180)
    assert(Angle(degrees=360).degrees == 360)

def test_radians():
    assert(Angle(radians=0).radians == 0)
    assert(Angle(radians=0.5*pi).radians == 0.5*pi)
    assert(Angle(radians=pi).radians == pi)
    assert(Angle(radians=2*pi).radians == 2*pi)

def test_turns():
    assert(Angle(turns=0).turns == 0)
    assert(Angle(turns=0.25).turns == 0.25)
    assert(Angle(turns=0.5).turns == 0.5)
    assert(Angle(turns=1).turns == 1)

if __name__ == '__main__':
    import pytest, sys
    sys.exit(pytest.main([__file__]))
