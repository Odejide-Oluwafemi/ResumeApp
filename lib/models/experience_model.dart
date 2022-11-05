/// Holds the Users' Project/Work History/Educational Background/Experience
class ExperienceModel {
  /// Title of Project / Job Post Held / The Experience in few words (e.g Volunteered to visit Orphanage Homes)
  final String projectTitle;

  /// Full Description
  final String description;

  /// An option path to an Icon that fits the [projectTitle].
  final String? imagePath;

  const ExperienceModel({
    this.imagePath,
    required this.description,
    required this.projectTitle,
  });
}
