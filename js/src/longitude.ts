/* This is free and unencumbered software released into the public domain. */

/// <reference path="angle.ts"/>
export class Longitude extends Angle {
  public static readonly MIN_DEGREES: number = -180;
  public static readonly MAX_DEGREES: number = 180;

  public constructor(degrees: number) {
    if (degrees < Longitude.MIN_DEGREES) {
      throw new RangeError(`Longitude bounds are ±180°, but got ${degrees}°`);
    }
    if (degrees > Longitude.MAX_DEGREES) {
      throw new RangeError(`Longitude bounds are ±180°, but got ${degrees}°`);
    }
    super(degrees / 180 * Math.PI);
  }
}
