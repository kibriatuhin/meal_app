import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screens.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabScreens extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreens({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), 'title': 'Category'},
      {
        "page": FavoriteScreens(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Your Favorite'
      },
    ];
  }

  void _selectedItems(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedItems,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
