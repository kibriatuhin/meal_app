import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screens.dart';
import 'package:meals_app/screens/tab_screens.dart';
import 'package:meals_app/utilities/constant.dart';
import 'package:meals_app/widgets/filter_screens.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian)
          return false;
        else
          return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: canvasColor,
          colorScheme: const ColorScheme(
            primary: Color(0xff6200ee), // focus
            onPrimary: Colors.white,
            primaryVariant: Colors.orange,

            background: Colors.red,
            onBackground: Colors.black,

            secondary: Colors.red, //float action button
            onSecondary: Colors.white,
            secondaryVariant: Colors.deepOrange,

            error: Colors.black,
            onError: Colors.white,

            surface: Colors.white, // AppBar
            onSurface: Colors.black, //icons, inputs

            brightness: Brightness.light,
          ),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: bodyText1,
              bodyText2: bodyText2,
              subtitle1: subtitle1,
              subtitle2: subtitle2)),
      //home:const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreens(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsScreens.routeName: (context) => CategoryMealsScreens(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreens.routeName: (context) => MealDetailsScreens(toggoleFavorite: _toggleFavorite,isFavorite: _isMealFavorite,),
        FilterScreens.routeName: (context) => FilterScreens(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }
}
