import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/my_theme.dart';
import '../../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(news.publishedAt ?? '');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ??
                  'https://m.files.bbci.co.uk/modules/bbc-morph-sport-seo-meta/1.23.3/images/bbc-sport-logo.png',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            '${news.author}' ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.darkGreyColor),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
          ),
          Text(
            '${DateFormat.jm().format(dateTime!)}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.darkGreyColor),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
