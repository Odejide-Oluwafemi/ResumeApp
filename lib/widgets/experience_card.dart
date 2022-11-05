import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/experience_model.dart';
import 'package:resume_app/widgets/app_text.dart';

///  The Widget for users' experiences/projects
class ExperienceCard extends StatelessWidget {
  /// The [ExperienceModel] containing the required details. See [ExperienceModel] class
  final ExperienceModel model;

  /// Anything to be added at the bottom of the card, Usually the a Widget for showing the currently selected card in a List
  final Widget? bottomWidget;
  const ExperienceCard(this.model, {super.key, this.bottomWidget});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(model.imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: model.imagePath == null
                    ? Icon(
                        Icons.add,
                        color: Theme.of(context).textTheme.labelLarge!.color,
                        size: 22,
                      )
                    : Container(),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.projectTitle,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge!.color,
                      fontFamily:
                          Theme.of(context).textTheme.labelLarge!.fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 200,
                    height: 2,
                    color: AppColors.appColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Flexible(
            child: SingleChildScrollView(
              child: AppText(
                model.description,
              ),
            ),
          ),
          const SizedBox(height: 16),
          bottomWidget!,
        ],
      ),
    );
  }
}
