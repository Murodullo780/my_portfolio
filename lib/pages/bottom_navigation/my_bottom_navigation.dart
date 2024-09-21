import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/bottom_navigation/bottom_item.dart';

class MyBottomItem {
  String title;

  MyBottomItem({required this.title});
}

class MyBottomNavigation extends StatelessWidget {
  final List<MyBottomItem> items;
  final int selectedIndex;
  final Function(int value) onPress;

  const MyBottomNavigation(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: const BoxDecoration(

            border: Border(top: BorderSide(color: Colors.black12))),
        height: 72,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items.map((element) {
              return BottomItem(
                item: element,
                onTap: (item) => onPress.call(item),
                index: items.indexOf(element),
                isSelected: selectedIndex == items.indexOf(element),
                length: items.length,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
