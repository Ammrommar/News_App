import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContentScreen extends StatelessWidget {
  static const String routeName = 'Content Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ContentArguments;
    DateTime? dateTime = DateTime.tryParse(args.news.publishedAt!);

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
          appBar: AppBar(
            title: Text(
              args.news.title ?? 'News title',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MyTheme.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: args.news.urlToImage!,
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      color: MyTheme.primaryColor,
                    )),
                    errorWidget: (context, url, error) => Container(
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: MyTheme.darkGreyColor),
                        child: Icon(Icons.error)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  args.news.author ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.darkGreyColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  args.news.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.blackColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${DateFormat.jm().format(dateTime!)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.darkGreyColor),
                  textAlign: TextAlign.end,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: MyTheme.whiteColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              args.news.description ?? '',
                              maxLines: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(args.news.url ??
                                  'https://gizmodo.com/why-bitcoin-won-t-reach-1-000-000-1851252185');
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                              ;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .view_full_article,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(AppLocalizations.of(context)!
                                            .view_full_article ==
                                        'View Full Article'
                                    ? Icons.play_arrow
                                    : Icons.keyboard_arrow_left),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    ]);
  }
}
