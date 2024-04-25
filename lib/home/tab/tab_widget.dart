import 'package:flutter/material.dart';
import 'package:news_app/home/tab/tab_item.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/my_theme.dart';

import '../../model/sourceResponse.dart';
import '../content_screen.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourceList = [];

  TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourceList.isEmpty) {
      return Center(
          child: CircularProgressIndicator(
        color: MyTheme.primaryColor,
      ));
    }

    selectedIndex = selectedIndex.clamp(0, widget.sourceList.length - 1);

    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.only(left: 20),
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sourceList
                .asMap()
                .entries
                .map(
                  (source) => TabItem(
                    source: source.value,
                    isSelected: selectedIndex == source.key,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: NewsWidget(
              source: widget.sourceList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

// class _TabWidgetState extends State<TabWidget> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: widget.sourceList.length,
//       child: Column(
//         children: [
//           TabBar(
//             labelPadding: EdgeInsets.only(left: 20),
//             dividerColor: Colors.transparent,
//             onTap: (index) {
//               selectedIndex = index;
//               setState(() {});
//             },
//             indicatorColor: Colors.transparent,
//             isScrollable: true,
//             tabs: widget.sourceList
//                 .map(
//                   (source) => TabItem(
//                     source: source,
//                     isSelected:
//                         selectedIndex == widget.sourceList.indexOf(source),
//                   ),
//                 )
//                 .toList(),
//           ),
//           Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
//         ],
//       ),
//     );
//   }
// }
