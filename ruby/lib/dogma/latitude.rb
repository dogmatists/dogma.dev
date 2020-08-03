# This is free and unencumbered software released into the public domain.

require_relative 'angle'

##
# A latitude.
#
# @see https://dogma.dev/Latitude
class Dogma::Latitude < Dogma::Angle
  MIN_DEGREES = -90
  MAX_DEGREES = 90

  ##
  # @param  [Float, #to_f] degrees (-90..90)
  # @return [void]
  # @raise  [ArgumentError] if `degrees` is out of bounds
  def initialize(degrees)
    degrees = degrees.to_f
    raise ArgumentError, "Latitude bounds are ±90°, but got #{degrees}°" if degrees.abs > MAX_DEGREES
    super(degrees: degrees)
  end
end # Dogma::Latitude
