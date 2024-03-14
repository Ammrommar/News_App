import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/drawer/home_drawer.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
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
        appBar: selectedCategory == null
            ? AppBar(
                title: Text(
                  selectedMenuItem == HomeDrawer.settings
                      ? AppLocalizations.of(context)!.settings
                      : selectedCategory == null
                          ? AppLocalizations.of(context)!.news_app
                          : '${selectedCategory!.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyTheme.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width * 1,
                    MediaQuery.of(context).size.height * 0.07),
                child: EasySearchBar(
                  searchBackgroundColor: MyTheme.whiteColor,
                  searchClearIconTheme:
                      IconThemeData(color: MyTheme.primaryColor),
                  searchBackIconTheme:
                      IconThemeData(color: MyTheme.primaryColor),
                  title: Text(
                    '${selectedCategory!.id.toUpperCase()}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: MyTheme.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  onSearch: (value) {
                    if (value.isNotEmpty) {
                      searchProvider.updateSearchValue(value);
                      setState(() {});
                    }
                  },
                  searchHintText: AppLocalizations.of(context)!.search_article,
                  searchTextStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.primaryColor),
                  searchHintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.darkGreyColor),
                ),
              ),
        drawer: Drawer(
          child: HomeDrawer(
            onDraweItemClick: onDrawerItemClick,
          ),
        ),
        body: selectedMenuItem == HomeDrawer.settings
            ? Settings_Screen()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetails(category: selectedCategory!),
      ),
    ]);
  }

  CategoryDM? selectedCategory;

  onCategoryItemClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
