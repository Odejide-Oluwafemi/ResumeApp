import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final String? imagePath;
  final String url;
  final String type;

  const ContactModel({
    required this.name,
    this.imagePath,
    required this.url,
    required this.type,
  });
}
