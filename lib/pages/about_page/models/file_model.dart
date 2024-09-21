import 'package:flutter/material.dart';

class FileModel {
  final String name;
  final String pathName;
  final Widget body;

  FileModel({
    required this.name,
    required this.pathName,
    required this.body,
  });
}
