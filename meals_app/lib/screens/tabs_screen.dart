import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _selectPageFromNav(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _changeFavoriteStatus(Meal meal) {
    final isFavorite = favouriteMeals.contains(meal);
    if (isFavorite) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      _showInfoMessage('Removed "${meal.title}" from Favorites');
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
      _showInfoMessage('Added "${meal.title}" to Favorites');
    }
  }

  void _setScreenFromDrawer(String id) {
    Navigator.pop(context);
    if (id == 'filters') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (ctx) => MealsScreen(
    //       category.title,
    //       selectedMeals,
    //       onToggleFavorite,
    //     ),
    //   ),)
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(_changeFavoriteStatus);
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(null, favouriteMeals, _changeFavoriteStatus);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(_setScreenFromDrawer),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPageFromNav,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
