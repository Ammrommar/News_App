import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class CustomRow extends StatelessWidget {
  String text;
  IconData icon;

  CustomRow({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: MyTheme.blackColor,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.blackColor),
          ),
        ],
      ),
    );
  }
}
