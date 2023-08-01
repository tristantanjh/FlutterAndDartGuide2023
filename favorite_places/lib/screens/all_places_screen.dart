// import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllPlacesScreen extends ConsumerWidget {
  const AllPlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesList = ref.watch(placeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(placesList),
    );
  }
}
