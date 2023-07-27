import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(
          'Title',
          [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your category!'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        // this delegate means num of col is fixed
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // num of cols
          childAspectRatio: 3 / 2, // height : width
          crossAxisSpacing: 20, // horizontal spacinng
          mainAxisSpacing: 20, // vertical spacing
        ),
        children: [
          for (final c in availableCategories)
            CategoryGridItem(
              c,
              () => _selectCategory(context),
            ),
        ],
      ),
    );
  }
}
