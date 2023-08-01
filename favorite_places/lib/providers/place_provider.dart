import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceProviderNotifier extends StateNotifier<List<Place>> {
  PlaceProviderNotifier() : super([]);

  void addPlace(String title, File image) {
    final newPlace = Place(title, image);
    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<PlaceProviderNotifier, List<Place>>(
    (ref) => PlaceProviderNotifier());
