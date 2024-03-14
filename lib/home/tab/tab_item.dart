import 'package:flutter/material.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/my_theme.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryColor : Colors.transparent,
        border: Border.all(
          color: MyTheme.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        source.name!,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: isSelected ? MyTheme.whiteColor : MyTheme.primaryColor,
            ),
      ),
    );
  }
}
