import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/pages/about_page/models/file_model.dart';
import 'package:my_portfolio/pages/about_page/utils/variables.dart';
import 'package:my_portfolio/pages/about_page/widgets/packages_widget_item.dart';

class PackagesWidget extends StatefulWidget {
  final Function(FileModel)? onFileAdd;

  const PackagesWidget({
    super.key,
    required this.onFileAdd,
  });

  @override
  State<PackagesWidget> createState() => _PackagesWidgetState();
}

class _PackagesWidgetState extends State<PackagesWidget>
    with VariablesAboutPage {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 329,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.7,
            color: Colors.white38,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 320,
              child: PackagesWidgetItem(
                setState: () {
                  setState(() {});
                },
                title: SizedBox(
                  width: 280,
                  child: RichText(
                    maxLines: 1,
                    text: const TextSpan(
                      text: "personal-info ",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontFamily: MyFonts.firaMedium,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "~/Users/main_user/projects/my_portfolio",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                            fontFamily: MyFonts.firaMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomOfPackage: Column(
                  children: List.generate(
                    packages.length,
                    (index) {
                      return PackagesWidgetItem(
                        title: Row(
                          children: [
                            SvgPicture.asset("assets/images/package.svg"),
                            const SizedBox(width: 20),
                            Text(packages.keys.toList()[index]),
                          ],
                        ),
                        setState: () {
                          setState(() {});
                        },
                        bottomOfPackage: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            packages.values.toList()[index].length,
                            (index2) {
                              return PackagesWidgetItem(
                                title: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/dart.svg",
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      packages.values.toList()[index][index2],
                                    ),
                                  ],
                                ),
                                setState: () {
                                  setState(() {});
                                },
                                onDoubleTap: () {
                                  final newFile = FileModel(
                                    name: packages.values.toList()[index]
                                        [index2],
                                    pathName: packages.values.toList()[index]
                                        [index2],
                                    body: packagesWidgets[packages.keys
                                            .toList()[index]]?[index2] ??
                                        const SizedBox(),
                                  );
                                  if (widget.onFileAdd != null) {
                                    widget.onFileAdd!(newFile);
                                  }
                                  setState(() {});
                                  debugPrint("length is ${files.length}");
                                  debugPrint(
                                    packages.values.toList()[index][index2],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
