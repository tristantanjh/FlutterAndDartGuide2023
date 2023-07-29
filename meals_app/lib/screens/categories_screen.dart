import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this.availableMeals, {super.key});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final selectedMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          category.title,
          selectedMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
            () => _selectCategory(context, c),
          ),
      ],
    );
  }
}
