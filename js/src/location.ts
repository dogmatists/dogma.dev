/* This is free and unencumbered software released into the public domain. */

/// <reference path="latitude.ts"/>
/// <reference path="longitude.ts"/>
export class Location {
  public readonly latitude: Latitude;
  public readonly longitude: Longitude;

  public constructor(latitude: number, longitude: number) {
    this.latitude = new Latitude(latitude);
    this.longitude = new Longitude(longitude);
  }
}
