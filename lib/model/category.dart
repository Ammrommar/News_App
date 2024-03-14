import 'package:flutter/animation.dart';
import 'package:news_app/my_theme.dart';

class CategoryDM {
  String id;
  String categoryName;
  String imagePath;
  Color color;

  CategoryDM({
    required this.id,
    required this.categoryName,
    required this.imagePath,
    required this.color,
  });

//    science  technology
  static List<CategoryDM> getGategories() {
    return [
      CategoryDM(
          id: 'sports',
          categoryName: 'Sports',
          imagePath: 'assets/images/sports.png',
          color: MyTheme.redColor),
      CategoryDM(
          id: 'general',
          categoryName: 'General',
          imagePath: 'assets/images/Politics.png',
          color: MyTheme.darkBlueColor),
      CategoryDM(
          id: 'health',
          categoryName: 'Health',
          imagePath: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      CategoryDM(
          id: 'business',
          categoryName: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      CategoryDM(
          id: 'entertainment',
          categoryName: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: MyTheme.blueColor),
      CategoryDM(
          id: 'science',
          categoryName: 'Science',
          imagePath: 'assets/images/science.png',
          color: MyTheme.yellowColor),
    ];
  }
}
