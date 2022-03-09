import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screens.dart';
import 'package:meals_app/widgets/icon_and_text.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  const MealItems(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,required this.id})
      : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreens.routeName,arguments:id ).then((value) {
      if(value != null)
        {
          //removeItem(value);
        }
      //print(value);
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";

      case Complexity.Hard:
        return "Hard";

      case Complexity.Challanging:
        return "Challanging";

      default:
        return "Unknown";
    }
  }

  String get affordAbilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.pricey:
        return "pricey";

      case Affordability.Luxurious:
        return "Expensive";

      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin:const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style:const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconAndText(icon: Icons.schedule, text: "$duration min"),
                  IconAndText(icon: Icons.work, text: complexityText),
                  IconAndText(
                      icon: Icons.attach_money, text: affordAbilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
