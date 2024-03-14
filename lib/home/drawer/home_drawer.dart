import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/custom_row.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  Function onDraweItemClick;
  static const int categories = 1;
  static const int settings = 2;

  HomeDrawer({required this.onDraweItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.08),
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyTheme.primaryColor,
          ),
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            onDraweItemClick(categories);
          },
          child: CustomRow(
            text: AppLocalizations.of(context)!.categories,
            icon: Icons.list,
          ),
        ),
        InkWell(
          onTap: () {
            onDraweItemClick(settings);
          },
          child: CustomRow(
            text: AppLocalizations.of(context)!.settings,
            icon: Icons.settings,
          ),
        ),
      ],
    );
  }
}
