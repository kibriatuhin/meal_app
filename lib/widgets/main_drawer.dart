import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_screens.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData iconData, String text, VoidCallback onPress) {
    return ListTile(
      leading: Icon(iconData,size: 26,),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant,"Meals",(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings,"Filters",(){
            Navigator.of(context).pushReplacementNamed(FilterScreens.routeName);
          }),

        ],
      ),
    );
  }
}
