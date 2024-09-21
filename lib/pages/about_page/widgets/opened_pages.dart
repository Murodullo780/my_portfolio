import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about_page/models/file_model.dart';

class OpenedPages extends StatelessWidget {
  final int selectedIndex;
  final List<FileModel> pages;
  final void Function(int index) onTap;
  final void Function(int index) close;

  const OpenedPages({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.pages,
    required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onTap(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.grey.shade800
                      : Colors.transparent,
                  border: index == selectedIndex
                      ? const Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 3,
                          ),
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    Text(pages[index].name, style: const TextStyle(fontSize: 12)),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        close(index);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
