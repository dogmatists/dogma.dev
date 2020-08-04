// This is free and unencumbered software released into the public domain.

package dogma

import "testing"
import "github.com/stretchr/testify/assert"

func TestNewLatitude(t *testing.T) {
	lat, err := NewLatitude(0)
	if assert.Nil(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}

	lat, err = NewLatitude(-90)
	if assert.Nil(t, err) {
		assert.Equal(t, -90.0, lat.Degrees())
	}

	lat, err = NewLatitude(90)
	if assert.Nil(t, err) {
		assert.Equal(t, 90.0, lat.Degrees())
	}
}

func TestNewLatitudeUnderflow(t *testing.T) {
	lat, err := NewLatitude(-91)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}
}

func TestNewLatitudeOverflow(t *testing.T) {
	lat, err := NewLatitude(91)
	if assert.Error(t, err) {
		assert.Equal(t, 0.0, lat.Degrees())
	}
}
