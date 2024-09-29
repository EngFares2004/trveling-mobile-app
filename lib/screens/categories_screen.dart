import 'package:flutter/material.dart';
import 'package:trveling_app/app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const screenRoute = '/categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 7 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categoriesData.map((e) =>
            CategoryItem(e.id, e.title, e.imageUrl)).toList(),
      ),
    );
  }
}
