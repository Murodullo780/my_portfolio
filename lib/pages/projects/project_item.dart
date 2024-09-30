import 'package:flutter/material.dart';
import 'package:my_portfolio/models/projects_model.dart';

class ProjectItem extends StatelessWidget {
  final ProjectsModel model;
  final int? index;

  const ProjectItem({
    super.key,
    required this.model,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: index?.isOdd == true
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
          width: 500,
          height: 120,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: Colors.white12,
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white12,
                    )
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.white12,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    model.photo,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SelectableText(model.title),
              const Spacer(),
              const Icon(Icons.launch),
            ],
          ),
        ),
      ],
    );
  }
}
