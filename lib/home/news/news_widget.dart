import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';
import 'package:news_app/home/news/custom_news_container.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../content_screen.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late ScrollController scrollController;

  var searchList = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsById(
          sourceId: widget.source.id!,
          searchValue: searchProvider.searchValue,
          page: currentPage),
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
                    ApiManager.getNewsById(
                        sourceId: widget.source.id ?? '',
                        searchValue: searchProvider.searchValue,
                        page: currentPage);
                    setState(() {});
                  },
                  child: Text(AppLocalizations.of(context)!.try_again)),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsById(
                        sourceId: widget.source.id ?? '',
                        searchValue: searchProvider.searchValue,
                        page: currentPage);
                    setState(() {});
                  },
                  child: Text(AppLocalizations.of(context)!.try_again)),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        void searchArticle(String searchValue) {
          if (searchValue.isEmpty) {
            return;
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Add Your Code here.
              searchList = newsList
                  .where((item) => item.title!
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()))
                  .toList();
            });
          }
        }

        // print(searchProvider.searchValue);
        searchArticle(searchProvider.searchValue);
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (searchList.isEmpty) {
              if (index < newsList.length) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ContentScreen.routeName,
                        arguments: ContentArguments(news: newsList[index]));
                  },
                  child: NewsItem(news: newsList[index]),
                );
              }
            } else {
              if (index < searchList.length) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ContentScreen.routeName,
                        arguments: ContentArguments(news: searchList[index]));
                  },
                  child: NewsItem(news: searchList[index]),
                );
              }
            }
          },
          itemCount:
              searchList.isEmpty ? newsList.length + 1 : searchList.length,
        );
      },
    );
  }

  void loadNextPage() {
    setState(() {
      currentPage++;
      print("the Next Page");
      //add api for load the more data according to new page
    });
  }
}

class ContentArguments {
  News news;

  ContentArguments({required this.news});
}
