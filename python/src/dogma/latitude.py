# This is free and unencumbered software released into the public domain.

"""The dogma.Latitude class."""

from .angle import Angle

# See: https://dogma.dev/Latitude
class Latitude(Angle):
    """A latitude."""

    MIN_DEGREES = -90
    MAX_DEGREES = 90

    def __init__(self, degrees: float) -> None:
        degrees = float(degrees)
        if abs(degrees) > Latitude.MAX_DEGREES:
            raise ValueError(f"Latitude bounds are ±90°, but got {degrees}°")
        super().__init__(degrees=degrees)
