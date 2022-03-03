import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        shrinkWrap: true,
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoriesItems(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
        ),
      ),
    );
  }
}
