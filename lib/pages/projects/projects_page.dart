import 'package:flutter/material.dart';
import 'package:my_portfolio/models/projects_model.dart';
import 'package:my_portfolio/pages/projects/project_item.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 179,
        minWidth: 500,
        maxWidth: 1000,
      ),
      child: Column(
        children: [
          ProjectItem(
            model: ProjectsModel(
              title: "Zikr va duolar",
              link: "",
              photo: "assets/images/projects/img.png",
            ),
            index: 1,
          ),
          ProjectItem(
            model: ProjectsModel(
              title: "Zikr va duolar",
              link: "",
              photo: "assets/images/Background Blurs.png",
            ),
            index: 0,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
