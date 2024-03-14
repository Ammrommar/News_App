import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';
import 'package:news_app/home/tab/tab_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDM category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(AppLocalizations.of(context)!.someThing_went_wrong),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text(AppLocalizations.of(context)!.try_again)),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text(AppLocalizations.of(context)!.try_again)),
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return TabWidget(sourceList: sourcesList);
      },
    );
  }
}
