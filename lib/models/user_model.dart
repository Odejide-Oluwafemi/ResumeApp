import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/models/experience_model.dart';
import 'package:resume_app/models/skill_model.dart';

/// Class holding full details on a User
class UserModel {
  /// Path to image file
  final String? imagePath;

  /// Users' last name
  final String lastName;

  /// Users' first name
  final String firstName;

  /// Users' job title
  final String jobTitle;

  /// Brief Description of the User
  final String overview;

  /// Skills possessed by the User. See [SkillModel]
  final List<SkillModel> skills;

  /// Users' Experiences and Past Projects / Job Posts Held. See [ExperienceModel]
  final List<ExperienceModel> experiences;

  /// What do you offer to the team/company?
  final String teamBenefit;

  /// The Users' Contact Handles. See [ContactModel]
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
