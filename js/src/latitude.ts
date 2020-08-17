/* This is free and unencumbered software released into the public domain. */

/// <reference path="angle.ts"/>
export class Latitude extends Angle {
  public static readonly MIN_DEGREES: number = -90;
  public static readonly MAX_DEGREES: number = 90;

  public constructor(degrees: number) {
    if (degrees < Latitude.MIN_DEGREES) {
      throw new RangeError(`Latitude bounds are ±90°, but got ${degrees}°`);
    }
    if (degrees > Latitude.MAX_DEGREES) {
      throw new RangeError(`Latitude bounds are ±90°, but got ${degrees}°`);
    }
    super(degrees / 180 * Math.PI);
  }
}
