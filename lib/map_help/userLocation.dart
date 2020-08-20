import 'package:flutter_map/flutter_map.dart';
import 'package:geolocation/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
MapController controller = new MapController();


getPermission() async {
  final GeolocationResult result =
  await Geolocation.requestLocationPermission(permission: const LocationPermission(
      android: LocationPermissionAndroid.fine,
      ios: LocationPermissionIOS.always));
  return result;
}

getLocation() {
  return getPermission().then((result) async {
    if (result.isSuccessful) {
      final coords =
      await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
      return coords;
    }
  });
}

buildMap() {
  getLocation().then((response) {
    response.listen((value) {
      if (value.isSuccessful) {
        controller.move(
            new LatLng(value.location.latitude, value.location.longitude),
            18.0);
      }
    });
  });
}