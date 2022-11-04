import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final Image image;
  final String url;
  final String type;

  const ContactModel({
    required this.name,
    required this.image,
    required this.url,
    required this.type,
  });
}
