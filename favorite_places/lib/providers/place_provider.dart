import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  // creates/gets sql db
  final dbPath = await sql.getDatabasesPath();
  return sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, long REAL, address TEXT)',
      );
    },
    version: 1,
  );
}

class PlaceProviderNotifier extends StateNotifier<List<Place>> {
  PlaceProviderNotifier() : super([]);

  void addPlace(String title, File image, PlaceLocation location) async {
    // stores picked image locally
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace = Place(title, copiedImage, location);

    // inserts data into db
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'long': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

    state = [newPlace, ...state];
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();

    // gets full table of user places
    final data = await db.query('user_places');

    // parsing data to list of Place
    final placesList = data
        .map(
          (row) => Place(
            id: row['id'] as String,
            row['title'] as String,
            File(row['image'] as String),
            PlaceLocation(
              latitude: row['lat'] as double,
              longitude: row['long'] as double,
              address: row['address'] as String,
            ),
          ),
        )
        .toList();

    state = placesList;
  }
}

final placeProvider = StateNotifierProvider<PlaceProviderNotifier, List<Place>>(
    (ref) => PlaceProviderNotifier());
