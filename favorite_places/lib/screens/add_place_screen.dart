import 'dart:io';

// import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput((image) => _selectedImage = image),
            const SizedBox(
              height: 10,
            ),
            LocationInput((location) => _selectedLocation = location),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;

                if (title.isEmpty ||
                    _selectedImage == null ||
                    _selectedLocation == null) {
                  return;
                }

                ref
                    .read(placeProvider.notifier)
                    .addPlace(title, _selectedImage!, _selectedLocation!);
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.add), Text('Add Place')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
