import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> coordinate() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
  }

  Future<List<Placemark>> addressFromCoordinate(
      {double latitude, double longitude}) async {
    List<Placemark> address =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    return address;
  }
}
