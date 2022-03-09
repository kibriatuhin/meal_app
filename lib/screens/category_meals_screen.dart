import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_items.dart';

/*class CategoryMealsScreens extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryId = routesArgs['id'];
    final categoryTitle = routesArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            id: categoryMeals[index].id, removeItem: (){},
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}*/

class CategoryMealsScreens extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;
  const CategoryMealsScreens({Key? key,required this.availableMeals}) : super(key: key);

  @override
  _CategoryMealsScreensState createState() => _CategoryMealsScreensState();
}

class _CategoryMealsScreensState extends State<CategoryMealsScreens> {

   String? categoryTitle;
  late List<Meal> categoryMeals;
  var _loadedIntialData = false;

  void _removeMeal(String mealId){
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

   @override
  void didChangeDependencies() {
    if(_loadedIntialData==false){
      final routesArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final categoryId = routesArgs['id'];
      categoryTitle = routesArgs['title'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedIntialData = true;
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            id: categoryMeals[index].id,

          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
