# This is free and unencumbered software released into the public domain.

"""The dogma.Angle class."""

import math

from typing import Optional

# See: https://dogma.dev/Angle
class Angle:
    """An angle."""

    _radians: float

    def __init__(
            self,
            degrees: Optional[float] = None,
            radians: Optional[float] = None,
            turns: Optional[float] = None,
    ) -> None:
        if radians is not None:
            self._radians = float(radians)
        elif degrees is not None:
            self._radians = float(degrees)/180 * math.pi
        elif turns is not None:
            self._radians = float(turns) * 2*math.pi
        else:
            raise ValueError("Angle() requires one of the keywords: degrees, radians, turns")

    @property
    def degrees(self) -> float:
        "Returns the angle in degrees."
        return self._radians/math.pi * 180

    @property
    def radians(self) -> float:
        "Returns the angle in radians."
        return self._radians

    @property
    def turns(self) -> float:
        "Returns the angle in turns."
        return self._radians / (2*math.pi)
