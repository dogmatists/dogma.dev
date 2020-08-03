# This is free and unencumbered software released into the public domain.

require_relative '../lib/dogma'

include Dogma

RSpec.describe Dogma::Longitude do
  describe ".new()" do
    it "raises an ArgumentError" do
      expect { Longitude.new }.to raise_error(ArgumentError)
    end
  end

  describe ".new(degrees)" do
    it "constructs the latitude from degrees" do
      expect(Longitude.new(0).degrees).to eq(0)
      expect(Longitude.new(-180).degrees).to eq(-180)
      expect(Longitude.new(180).degrees).to eq(180)
    end
  end

  describe ".new(degrees) where degrees > ±180°" do
    it "raises an ArgumentError" do
      expect { Longitude.new(-181) }.to raise_error(ArgumentError)
      expect { Longitude.new(181) }.to raise_error(ArgumentError)
    end
  end

  describe "#to_f" do
    it "returns the angle in radians" do
      expect(Longitude.new(90).to_f).to eq(0.5*Math::PI)
    end
  end
end
