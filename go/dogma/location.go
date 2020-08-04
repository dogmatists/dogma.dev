// This is free and unencumbered software released into the public domain.

package dogma

// Location pairs a latitude and a longitude.
//
// See: https://dogma.dev/Location
type Location struct {
	Latitude  Latitude
	Longitude Longitude
}

// NewLocation constructs a new location.
func NewLocation(latitude float64, longitude float64) (Location, error) {
	lat, err := NewLatitude(latitude)
	if err != nil {
		return Location{}, err
	}
	lng, err := NewLongitude(longitude)
	if err != nil {
		return Location{}, err
	}
	return Location{Latitude: lat, Longitude: lng}, nil
}
