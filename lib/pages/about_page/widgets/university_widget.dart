import 'package:flutter/material.dart';

class UniversityWidget extends StatelessWidget {
  const UniversityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9 - 340,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "I am student of"
          "Tashkent University of Information Technologies named after Muhammad al-Khwarizmi,"
          "and i am second year student.",
        ),
      ),
    );
    //
  }
}
