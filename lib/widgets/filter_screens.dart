import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
class FilterScreens extends StatelessWidget {
  static const routeName = "/filter";
  const FilterScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filters!"),
      ),
    );
  }
}
