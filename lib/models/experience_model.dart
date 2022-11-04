import 'package:flutter/material.dart';

class ExperienceModel {
  final String projectTitle;
  final String description;
  final Image image;

  const ExperienceModel({
    required this.image,
    required this.description,
    required this.projectTitle,
  });
}
