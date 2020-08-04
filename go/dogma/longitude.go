// This is free and unencumbered software released into the public domain.

package dogma

import "errors"

// Longitude is a geographic coordinate.
//
// See: https://dogma.dev/Longitude
type Longitude struct {
	Angle Angle
}

const (
	MinLongitudeDegrees = -180
	MaxLongitudeDegrees = 180
)

// NewLongitude constructs a new longitude.
func NewLongitude(degrees float64) (Longitude, error) {
	if degrees < MinLongitudeDegrees {
		return Longitude{}, errors.New("Longitude bounds are ±180°")
	}
	if degrees > MaxLongitudeDegrees {
		return Longitude{}, errors.New("Longitude bounds are ±180°")
	}
	return Longitude{Angle: AngleFromDegrees(degrees)}, nil
}

// Degrees returns the longitude angle in degrees.
func (longitude Longitude) Degrees() float64 {
	return longitude.Angle.Degrees()
}
