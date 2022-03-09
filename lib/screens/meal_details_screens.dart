import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreens extends StatelessWidget {
  static const routeName = "/meal_details";
  final Function? toggoleFavorite ;
  final Function? isFavorite ;
  const MealDetailsScreens({Key? key, required this.toggoleFavorite,required this.isFavorite}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final mealsDetails = DUMMY_MEALS.firstWhere((element) {
      return element.id.contains(mealId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(mealsDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                mealsDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(ListView.builder(
                itemCount: mealsDetails.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white70,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(mealsDetails.ingredients[index]),
                    ),
                  );
                })),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
                itemCount: mealsDetails.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          mealsDetails.steps[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  );
                })),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFavorite!(mealId)? Icons.star: Icons.star_border,
        ),
        onPressed:()=>  toggoleFavorite!(mealId),
      ),
    );
  }
}
