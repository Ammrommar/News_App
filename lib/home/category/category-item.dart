import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/model/category.dart';

import '../../../my_theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.36,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
              bottomLeft: Radius.circular(index % 2 == 0 ? 0 : 20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          Text(
            category.categoryName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: MyTheme.whiteColor, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
