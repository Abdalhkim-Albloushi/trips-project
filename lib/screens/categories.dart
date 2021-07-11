import '../widget/category_item.dart';
import 'package:flutter/material.dart';

import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          ),
        children:
          Categories_data.map((categoryData)=>
          Category_item(categoryData.title, categoryData.imageUrl, categoryData.id),
          ).toList()
      );
    
  }
}