import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:news_app/settings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';

class Settings_Screen extends StatefulWidget {
  static const String routeName = 'Settings_Screen';

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/main_background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: MyTheme.blackColor),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: MyTheme.whiteColor,
                    border: Border.all(width: 2, color: MyTheme.primaryColor)),
                child: InkWell(
                  onTap: () {
                    showLanguageBottomSheet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.appLanguage == 'en'
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: MyTheme.primaryColor),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: MyTheme.primaryColor,
                        size: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void showLanguageBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}
