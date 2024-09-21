import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/pages/about_page/models/file_model.dart';
import 'package:my_portfolio/pages/about_page/utils/variables.dart';
import 'package:my_portfolio/pages/about_page/widgets/packages_widget_item.dart';

class PackagesWidget extends StatefulWidget {
  const PackagesWidget({super.key});

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
                        ]),
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
                                      // color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(packages.values.toList()[index]
                                        [index2]),
                                  ],
                                ),
                                setState: () {
                                  setState(() {});
                                },
                                onDoubleTap: () {
                                  files.add(
                                    FileModel(
                                      name: packages.values.toList()[index]
                                          [index2],
                                      pathName: packages.values.toList()[index]
                                          [index2],
                                      body: packagesWidgets[packages.keys
                                              .toList()[index]]?[index2] ??
                                          const SizedBox(),
                                    ),
                                  );
                                  setState(() {});
                                  debugPrint("length is ${files.length}");
                                  debugPrint(
                                      packages.values.toList()[index][index2]);
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

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     PackagesWidgetItem(
            //       bottomOfPackage: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           PackagesWidgetItem(
            //             title: Row(
            //               children: [
            //                 SvgPicture.asset("assets/images/package.svg"),
            //                 const SizedBox(
            //                   width: 5,
            //                 ),
            //                 const Text(
            //                   "bio",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //             onTap: (){
            //
            //             },
            //             bottomOfPackage: InkWell(
            //               child: PackagesWidgetItem(
            //                 title: Row(
            //                   children: [
            //                     SvgPicture.asset(
            //                       "assets/images/dart.svg",
            //                       width: 20,
            //                       color: Colors.blue,
            //                     ),
            //                     const SizedBox(
            //                       width: 5,
            //                     ),
            //                     const Text(
            //                       "bio.dart",
            //                       style: TextStyle(fontSize: 16),
            //                     ),
            //                   ],
            //                 ),
            //                 setState: () => setState(() {}),
            //               ),
            //             ),
            //             setState: () => setState(() {}),
            //           ),
            //           PackagesWidgetItem(
            //             title: Row(
            //               children: [
            //                 SvgPicture.asset(
            //                   "assets/images/package.svg",
            //                   width: 14,
            //                   color: const Color(0xff43D9AD),
            //                 ),
            //                 const SizedBox(
            //                   width: 5,
            //                 ),
            //                 const Text(
            //                   "interests",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //             bottomOfPackage: InkWell(
            //               child: PackagesWidgetItem(
            //                 title: Row(
            //                   children: [
            //                     SvgPicture.asset(
            //                       "assets/images/dart.svg",
            //                       width: 20,
            //                       color: Colors.blue,
            //                     ),
            //                     const SizedBox(
            //                       width: 5,
            //                     ),
            //                     const Text(
            //                       "interests.dart",
            //                       style: TextStyle(fontSize: 16),
            //                     ),
            //                   ],
            //                 ),
            //                 setState: () => setState(() {}),
            //               ),
            //             ),
            //             setState: () => setState(() {}),
            //           ),
            //           PackagesWidgetItem(
            //             title: Row(
            //               children: [
            //                 SvgPicture.asset(
            //                   "assets/images/package.svg",
            //                   color: const Color(0xff3A49A4),
            //                 ),
            //                 const SizedBox(
            //                   width: 5,
            //                 ),
            //                 const Text(
            //                   "education",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //             setState: () => setState(() {}),
            //             bottomOfPackage: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 InkWell(
            //                   child: PackagesWidgetItem(
            //                     title: Row(
            //                       children: [
            //                         SvgPicture.asset(
            //                           "assets/images/dart.svg",
            //                           width: 20,
            //                           color: Colors.blue,
            //                         ),
            //                         const SizedBox(
            //                           width: 5,
            //                         ),
            //                         const Text(
            //                           "school.dart",
            //                           style: TextStyle(fontSize: 16),
            //                         ),
            //                       ],
            //                     ),
            //                     setState: () => setState(() {}),
            //                   ),
            //                 ),
            //                 InkWell(
            //                   child: PackagesWidgetItem(
            //                     title: Row(
            //                       children: [
            //                         SvgPicture.asset(
            //                           "assets/images/dart.svg",
            //                           width: 20,
            //                           color: Colors.blue,
            //                         ),
            //                         const SizedBox(
            //                           width: 5,
            //                         ),
            //                         const Text(
            //                           "university.dart",
            //                           style: TextStyle(fontSize: 16),
            //                         ),
            //                       ],
            //                     ),
            //                     setState: () => setState(() {}),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       setState: () {
            //         setState(() {});
            //       },
            //       title: SizedBox(
            //         width: 280,
            //         child: RichText(
            //           maxLines: 1,
            //           text: const TextSpan(
            //             text: 'personal_info',
            //             style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               color: Colors.white,
            //               fontFamily: MyFonts.firaMedium,
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //             children: [
            //               TextSpan(
            //                 text: ' /',
            //                 style: TextStyle(
            //                   fontFamily: MyFonts.firaLight,
            //                   overflow: TextOverflow.ellipsis,
            //                   color: Colors.white54,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     PackagesWidgetItem(
            //       bottomOfPackage: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           PackagesWidgetItem(
            //             setState: () => setState(() {}),
            //             title: const Row(
            //               children: [
            //                 Icon(
            //                   Icons.mail,
            //                   color: Colors.white54,
            //                 ),
            //                 SizedBox(
            //                   width: 5,
            //                 ),
            //                 Text(
            //                   "murodilla780@gmail.com",
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           PackagesWidgetItem(
            //             setState: () => setState(() {}),
            //             title: const Row(
            //               children: [
            //                 Icon(
            //                   Icons.phone,
            //                   color: Colors.white54,
            //                 ),
            //                 SizedBox(
            //                   width: 5,
            //                 ),
            //                 Text(
            //                   "+998883336770",
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           PackagesWidgetItem(
            //             setState: () => setState(() {}),
            //             title: const Row(
            //               children: [
            //                 Icon(
            //                   Icons.telegram,
            //                   color: Colors.white54,
            //                 ),
            //                 SizedBox(
            //                   width: 5,
            //                 ),
            //                 Text(
            //                   "@murodullloh",
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       setState: () {
            //         setState(() {});
            //       },
            //       title: const Text(
            //         "contacts",
            //         style: TextStyle(
            //           fontSize: 16,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
