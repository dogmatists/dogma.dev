export declare class Angle {
    private readonly _radians;
    constructor(radians: number);
    static fromDegrees(degrees: number): Angle;
    static fromRadians(radians: number): Angle;
    static fromTurns(turns: number): Angle;
    get degrees(): number;
    get radians(): number;
    get turns(): number;
}
export declare class Latitude extends Angle {
    static readonly MIN_DEGREES: number;
    static readonly MAX_DEGREES: number;
    constructor(degrees: number);
}
export declare class Longitude extends Angle {
    static readonly MIN_DEGREES: number;
    static readonly MAX_DEGREES: number;
    constructor(degrees: number);
}
export declare class Location {
    readonly latitude: Latitude;
    readonly longitude: Longitude;
    constructor(latitude: number, longitude: number);
}
