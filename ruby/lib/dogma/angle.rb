# This is free and unencumbered software released into the public domain.

##
# An angle.
#
# @see https://dogma.dev/Angle
class Dogma::Angle
  ##
  # @param  [Float, #to_f] degrees
  # @param  [Float, #to_f] radians
  # @param  [Float, #to_f] turns
  # @return [void]
  # @raise  [ArgumentError] if no keyword was provided
  def initialize(degrees: nil, radians: nil, turns: nil)
    @radians = case
      when radians then radians.to_f
      when degrees then degrees.to_f/180 * Math::PI
      when turns then turns.to_f * 2*Math::PI
      else raise ArgumentError, "Angle.new requires one of the keywords: degrees, radians, turns"
    end
  end

  ##
  # Returns the angle in radians.
  #
  # @return [Float]
  def to_f
    self.radians
  end

  ##
  # The angle in degrees.
  #
  # @return [Float]
  def degrees
    self.radians/Math::PI * 180
  end

  ##
  # The angle in radians.
  #
  # @return [Float]
  attr_reader :radians

  ##
  # The angle in turns.
  #
  # @return [Float]
  def turns
    self.radians / (2*Math::PI)
  end
end # Dogma::Angle
