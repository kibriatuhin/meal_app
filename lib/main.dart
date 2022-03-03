import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screens.dart';
import 'package:meals_app/screens/tab_screens.dart';
import 'package:meals_app/utilities/constant.dart';
import 'package:meals_app/widgets/filter_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        canvasColor: canvasColor,
        colorScheme: const ColorScheme(
          primary:  Color(0xff6200ee), // focus
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
          bodyText2:bodyText2,
          subtitle1:subtitle1,
        )

      ),
      //home:const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=> TabScreens(),
        CategoryMealsScreens.routeName:(context)=> CategoryMealsScreens(),
        MealDetailsScreens.routeName:(context) => MealDetailsScreens(),
        FilterScreens.routeName: (context) => FilterScreens(),
      },


    );
  }
}
