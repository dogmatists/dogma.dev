# This is free and unencumbered software released into the public domain.

require_relative '../lib/dogma'

include Dogma

RSpec.describe Dogma::Angle do
  describe ".new()" do
    it "raises an ArgumentError" do
      expect { Angle.new }.to raise_error(ArgumentError)
    end
  end

  describe ".new(degrees: ...)" do
    it "constructs the angle from degrees" do
      expect(Angle.new(degrees: 0).degrees).to eq(0)
      expect(Angle.new(degrees: 90).degrees).to eq(90)
      expect(Angle.new(degrees: 180).degrees).to eq(180)
      expect(Angle.new(degrees: 360).degrees).to eq(360)
    end
  end

  describe ".new(radians: ...)" do
    it "constructs the angle from radians" do
      expect(Angle.new(radians: 0).radians).to eq(0)
      expect(Angle.new(radians: 0.5*Math::PI).radians).to eq(0.5*Math::PI)
      expect(Angle.new(radians: Math::PI).radians).to eq(Math::PI)
      expect(Angle.new(radians: 2*Math::PI).radians).to eq(2*Math::PI)
    end
  end

  describe ".new(turns: ...)" do
    it "constructs the angle from turns" do
      expect(Angle.new(turns: 0).turns).to eq(0)
      expect(Angle.new(turns: 0.25).turns).to eq(0.25)
      expect(Angle.new(turns: 0.5).turns).to eq(0.5)
      expect(Angle.new(turns: 1).turns).to eq(1)
    end
  end

  describe "#to_f" do
    it "returns the angle in radians" do
      expect(Angle.new(radians: 3.1415).to_f).to eq(3.1415)
    end
  end

  describe "#degrees" do
    it "returns the angle in degrees" do
      expect(Angle.new(degrees: 180).degrees).to eq(180)
    end
  end

  describe "#radians" do
    it "returns the angle in radians" do
      expect(Angle.new(radians: Math::PI).radians).to eq(Math::PI)
    end
  end

  describe "#turns" do
    it "returns the angle in turns" do
      expect(Angle.new(turns: 0.5).turns).to eq(0.5)
    end
  end
end
