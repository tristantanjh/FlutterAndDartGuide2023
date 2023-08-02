import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  Place(
    this.title,
    this.image,
    this.location, {
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}
