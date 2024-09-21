import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/bottom_navigation/my_bottom_navigation.dart';

class BottomItem extends StatelessWidget {
  const BottomItem(
      {super.key,
      required this.item,
      required this.onTap,
      required this.index,
      required this.length,
      required this.isSelected});

  final Function(int) onTap;
  final MyBottomItem item;
  final int index;
  final int length;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => onTap.call(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(
            color: Colors.white.withAlpha(50),
          ),
          right: BorderSide(
            color: Colors.white.withAlpha(50),
          ),
          bottom: isSelected
              ? const BorderSide(color: Color(0xffFEA55F), width: 2)
              : BorderSide.none,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: isSelected ? 1 : 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
