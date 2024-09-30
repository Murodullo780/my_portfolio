import 'package:flutter/material.dart';

class SchoolWidget extends StatelessWidget {
  const SchoolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9 - 340,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("I have graduated school in 2023"),
      ),
    );
  }
}
