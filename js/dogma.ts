/* This is free and unencumbered software released into the public domain. */

export class Angle {
  private readonly _radians: number;

  public constructor(radians: number) {
    this._radians = radians;
  }

  public static fromDegrees(degrees: number): Angle {
    return new Angle(degrees / 180 * Math.PI);
  }

  public static fromRadians(radians: number): Angle {
    return new Angle(radians);
  }

  public static fromTurns(turns: number): Angle {
    return new Angle(turns * 2 * Math.PI);
  }

  public get degrees(): number {
    return this._radians / Math.PI * 180;
  }

  public get radians(): number {
    return this._radians;
  }

  public get turns(): number {
    return this._radians / (2 * Math.PI);
  }
}

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

export class Location {
  public readonly latitude: Latitude;
  public readonly longitude: Longitude;

  public constructor(latitude: number, longitude: number) {
    this.latitude = new Latitude(latitude);
    this.longitude = new Longitude(longitude);
  }
}
