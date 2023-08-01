import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList(this.placesList, {super.key});

  final List<Place> placesList;

  @override
  Widget build(BuildContext context) {
    if (placesList.isEmpty) {
      return Center(
        child: Text(
          'No Places Added Yet!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (ctx, index) => ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PlaceDetailScreen(
              placesList[index],
            ),
          ),
        ),
        title: Text(
          placesList[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
