// This is free and unencumbered software released into the public domain.

package dogma

import "testing"
import "github.com/stretchr/testify/assert"

func TestNewLocation(t *testing.T) {
	loc, err := NewLocation(0, 0)
	if assert.Nil(t, err) {
		assert.Equal(t, 0.0, loc.Latitude.Degrees())
		assert.Equal(t, 0.0, loc.Longitude.Degrees())
	}

	loc, err = NewLocation(-90, -180)
	if assert.Nil(t, err) {
		assert.Equal(t, -90.0, loc.Latitude.Degrees())
		assert.Equal(t, -180.0, loc.Longitude.Degrees())
	}

	loc, err = NewLocation(90, 180)
	if assert.Nil(t, err) {
		assert.Equal(t, 90.0, loc.Latitude.Degrees())
		assert.Equal(t, 180.0, loc.Longitude.Degrees())
	}
}

func TestNewLocationUnderflow(t *testing.T) {
	loc, err := NewLocation(-91, -180)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, loc.Latitude.Degrees())
		assert.Equal(t, 0.0, loc.Longitude.Degrees())
	}

	loc, err = NewLocation(-90, -181)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, loc.Latitude.Degrees())
		assert.Equal(t, 0.0, loc.Longitude.Degrees())
	}
}

func TestNewLocationOverflow(t *testing.T) {
	loc, err := NewLocation(91, 180)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, loc.Latitude.Degrees())
		assert.Equal(t, 0.0, loc.Longitude.Degrees())
	}

	loc, err = NewLocation(90, 181)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, loc.Latitude.Degrees())
		assert.Equal(t, 0.0, loc.Longitude.Degrees())
	}
}
