import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_items.dart';
class FavoriteScreens extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreens({Key? key,required this.favoriteMeals}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("Not added product in favorite screen"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,

          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
