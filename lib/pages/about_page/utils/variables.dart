import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about_page/models/file_model.dart';
import 'package:my_portfolio/pages/about_page/widgets/bio_widget.dart';
import 'package:my_portfolio/pages/about_page/widgets/interests_widget.dart';
import 'package:my_portfolio/pages/about_page/widgets/school_widget.dart';
import 'package:my_portfolio/pages/about_page/widgets/university_widget.dart';

// late ReadmeWidget readmeWidget;

mixin VariablesAboutPage {

  List<FileModel> files = [
    FileModel(
      name: "bio.dart",
      pathName: "bio.dart",
      body: const ReadmeWidget(),
    ),
  ];

  List<List<String>> packageNames = [];

  Map<String, List<String>> packages = {
    "bio.dart": [
      "bio.dart",
    ],
    // "Interests": [
    //   "interests.dart",
    // ],
    "Education": [
      "school.dart",
      "university.dart",
    ],
  };

  Map<String, List<Widget>> packagesWidgets = {
    "Bio": [
      const ReadmeWidget(),
    ],
    // "Interests": [
    //   const InterestsWidget(),
    // ],
    "Education": [
      const SchoolWidget(),
      const UniversityWidget(),
    ],
  };
}
