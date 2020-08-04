// This is free and unencumbered software released into the public domain.

package dogma

import "testing"
import "github.com/stretchr/testify/assert"

func TestNewLongitude(t *testing.T) {
	lat, err := NewLongitude(0)
	if assert.Nil(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}

	lat, err = NewLongitude(-180)
	if assert.Nil(t, err) {
		assert.Equal(t, -180.0, lat.Degrees())
	}

	lat, err = NewLongitude(180)
	if assert.Nil(t, err) {
		assert.Equal(t, 180.0, lat.Degrees())
	}
}

func TestNewLongitudeUnderflow(t *testing.T) {
	lat, err := NewLongitude(-181)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}
}

func TestNewLongitudeOverflow(t *testing.T) {
	lat, err := NewLongitude(181)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}
}
