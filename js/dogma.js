/* This is free and unencumbered software released into the public domain. */
export class Angle {
    constructor(radians) {
        this._radians = radians;
    }
    static fromDegrees(degrees) {
        return new Angle(degrees / 180 * Math.PI);
    }
    static fromRadians(radians) {
        return new Angle(radians);
    }
    static fromTurns(turns) {
        return new Angle(turns * 2 * Math.PI);
    }
    get degrees() {
        return this._radians / Math.PI * 180;
    }
    get radians() {
        return this._radians;
    }
    get turns() {
        return this._radians / (2 * Math.PI);
    }
}
export class Latitude extends Angle {
    constructor(degrees) {
        if (degrees < Latitude.MIN_DEGREES) {
            throw new RangeError(`Latitude bounds are ±90°, but got ${degrees}°`);
        }
        if (degrees > Latitude.MAX_DEGREES) {
            throw new RangeError(`Latitude bounds are ±90°, but got ${degrees}°`);
        }
        super(degrees / 180 * Math.PI);
    }
}
Latitude.MIN_DEGREES = -90;
Latitude.MAX_DEGREES = 90;
export class Longitude extends Angle {
    constructor(degrees) {
        if (degrees < Longitude.MIN_DEGREES) {
            throw new RangeError(`Longitude bounds are ±180°, but got ${degrees}°`);
        }
        if (degrees > Longitude.MAX_DEGREES) {
            throw new RangeError(`Longitude bounds are ±180°, but got ${degrees}°`);
        }
        super(degrees / 180 * Math.PI);
    }
}
Longitude.MIN_DEGREES = -180;
Longitude.MAX_DEGREES = 180;
export class Location {
    constructor(latitude, longitude) {
        this.latitude = new Latitude(latitude);
        this.longitude = new Longitude(longitude);
    }
}
