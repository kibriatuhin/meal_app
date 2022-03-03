import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoriesItems extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoriesItems({Key? key, this.id, this.title, this.color})
      : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed("/category-meals", arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title!, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color!.withOpacity(0.7), color!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
