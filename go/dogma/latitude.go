// This is free and unencumbered software released into the public domain.

package dogma

import "errors"

// Latitude is a geographic coordinate.
//
// See: https://dogma.dev/Latitude
type Latitude struct {
	Angle Angle
}

const (
	MinLatitudeDegrees = -90
	MaxLatitudeDegrees = 90
)

// NewLatitude constructs a new latitude.
func NewLatitude(degrees float64) (Latitude, error) {
	if degrees < MinLatitudeDegrees {
		return Latitude{}, errors.New("Latitude bounds are ±90°")
	}
	if degrees > MaxLatitudeDegrees {
		return Latitude{}, errors.New("Latitude bounds are ±90°")
	}
	return Latitude{Angle: AngleFromDegrees(degrees)}, nil
}

// Degrees returns the latitude angle in degrees.
func (latitude Latitude) Degrees() float64 {
	return latitude.Angle.Degrees()
}
