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
