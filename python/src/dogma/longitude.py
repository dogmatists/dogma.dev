# This is free and unencumbered software released into the public domain.

"""The dogma.Longitude class."""

from .angle import Angle

# See: https://dogma.dev/Longitude
class Longitude(Angle):
    """A longitude."""

    MIN_DEGREES = -180
    MAX_DEGREES = 180

    def __init__(self, degrees: float) -> None:
        degrees = float(degrees)
        if abs(degrees) > Longitude.MAX_DEGREES:
            raise ValueError(f"Longitude bounds are ±180°, but got {degrees}°")
        super().__init__(degrees=degrees)
