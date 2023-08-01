import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  Place(this.title, this.image) : id = uuid.v4();

  final String id;
  final String title;
  final File image;
}

class PlaceLocation {
  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  }) : id = uuid.v4();

  final String id;
  final double latitude;
  final double longitude;
  final String address;
}
