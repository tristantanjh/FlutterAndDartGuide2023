import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text;

              if (title.isEmpty) {
                return;
              }

              final newPlace = Place(title);
              ref.read(placeProvider.notifier).addPlace(newPlace);
              Navigator.pop(context);
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.add), Text('Add Place')],
            ),
          ),
        ],
      ),
    );
  }
}
