class ExperienceModel {
  final String projectTitle;
  final String description;
  final String? imagePath;

  const ExperienceModel({
    this.imagePath,
    required this.description,
    required this.projectTitle,
  });
}
