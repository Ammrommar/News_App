import 'package:flutter/material.dart';
import 'package:news_app/home/category/category-item.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getGategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.pick_your_category_of_interest,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: MyTheme.darkGreyColor,
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.1,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.21,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        onCategoryItemClick(categoriesList[index]);
                      },
                      child: CategoryItem(
                          category: categoriesList[index], index: index),
                    );
                  },
                  itemCount: categoriesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
