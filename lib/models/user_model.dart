import 'package:flutter/material.dart';
import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/models/experience_model.dart';
import 'package:resume_app/models/skill_model.dart';

class UserModel {
  final String? imagePath;
  final String lastName;
  final String firstName;
  final String jobTitle;
  final String overview;
  final List<SkillModel> skills;
  final List<ExperienceModel> experiences;
  final String teamBenefit;
  final List<ContactModel> contacts;

  const UserModel({
    this.imagePath,
    required this.lastName,
    required this.firstName,
    required this.jobTitle,
    required this.overview,
    required this.skills,
    required this.experiences,
    required this.teamBenefit,
    required this.contacts,
  });
}
