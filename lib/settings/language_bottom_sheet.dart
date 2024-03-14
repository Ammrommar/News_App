import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.4,
      color: MyTheme.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.expand_circle_down_outlined,
                  color: MyTheme.whiteColor,
                  size: 35,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              setState(() {});
            },
            child: provider.appLanguage == 'en'
                ? selectedLanguage(AppLocalizations.of(context)!.english)
                : unSelectedLanguage(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              setState(() {});
            },
            child: provider.appLanguage == 'ar'
                ? selectedLanguage(AppLocalizations.of(context)!.arabic)
                : unSelectedLanguage(AppLocalizations.of(context)!.arabic),
          )
        ],
      ),
    );
  }

  selectedLanguage(String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: MyTheme.whiteColor),
        ),
        Icon(
          Icons.check,
          color: MyTheme.whiteColor,
          size: 35,
        ),
      ],
    );
  }

  unSelectedLanguage(String language) {
    return Text(
      language,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: MyTheme.whiteColor),
    );
  }
}
