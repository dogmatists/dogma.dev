# This is free and unencumbered software released into the public domain.

require_relative '../lib/dogma'

include Dogma

RSpec.describe Dogma::Latitude do
  describe ".new()" do
    it "raises an ArgumentError" do
      expect { Latitude.new }.to raise_error(ArgumentError)
    end
  end

  describe ".new(degrees)" do
    it "constructs the latitude from degrees" do
      expect(Latitude.new(0).degrees).to eq(0)
      expect(Latitude.new(-90).degrees).to eq(-90)
      expect(Latitude.new(90).degrees).to eq(90)
    end
  end

  describe ".new(degrees) where degrees > ±90°" do
    it "raises an ArgumentError" do
      expect { Latitude.new(-91) }.to raise_error(ArgumentError)
      expect { Latitude.new(91) }.to raise_error(ArgumentError)
    end
  end

  describe "#to_f" do
    it "returns the angle in radians" do
      expect(Latitude.new(90).to_f).to eq(0.5*Math::PI)
    end
  end
end
