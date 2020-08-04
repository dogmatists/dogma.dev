// This is free and unencumbered software released into the public domain.

package dogma

import "math"
import "testing"
import "github.com/stretchr/testify/assert"

func TestAngleFromDegrees(t *testing.T) {
	assert.Equal(t, 0.0, AngleFromDegrees(0).Degrees())
	assert.Equal(t, 90.0, AngleFromDegrees(90).Degrees())
	assert.Equal(t, 180.0, AngleFromDegrees(180).Degrees())
	assert.Equal(t, 360.0, AngleFromDegrees(360).Degrees())
}

func TestAngleFromRadians(t *testing.T) {
	assert.Equal(t, 0.0, AngleFromRadians(0).Radians())
	assert.Equal(t, 0.5*math.Pi, AngleFromRadians(0.5*math.Pi).Radians())
	assert.Equal(t, 1*math.Pi, AngleFromRadians(1*math.Pi).Radians())
	assert.Equal(t, 2*math.Pi, AngleFromRadians(2*math.Pi).Radians())
}

func TestAngleFromTurns(t *testing.T) {
	assert.Equal(t, 0.0, AngleFromTurns(0).Turns())
	assert.Equal(t, 0.25, AngleFromTurns(0.25).Turns())
	assert.Equal(t, 0.5, AngleFromTurns(0.5).Turns())
	assert.Equal(t, 1.0, AngleFromTurns(1).Turns())
}
