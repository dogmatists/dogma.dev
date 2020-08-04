// This is free and unencumbered software released into the public domain.

package dogma

import "math"

// Angle represents an angle.
//
// See: https://dogma.dev/Angle
type Angle struct {
	radians float64
}

// AngleFromDegrees constructs an angle from degrees.
func AngleFromDegrees(degrees float64) Angle {
	return Angle{radians: degrees / 180.0 * math.Pi}
}

// AngleFromRadians constructs an angle from radians.
func AngleFromRadians(radians float64) Angle {
	return Angle{radians: radians}
}

// AngleFromTurns constructs an angle from turns.
func AngleFromTurns(turns float64) Angle {
	return Angle{radians: turns * 2 * math.Pi}
}

// Degrees returns the angle in degrees.
func (angle Angle) Degrees() float64 {
	return angle.radians / math.Pi * 180.0
}

// Radians returns the angle in radians.
func (angle Angle) Radians() float64 {
	return angle.radians
}

// Turns returns the angle in turns.
func (angle Angle) Turns() float64 {
	return angle.radians / (2 * math.Pi)
}
